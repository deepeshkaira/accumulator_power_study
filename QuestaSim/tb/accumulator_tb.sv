`timescale 1ns/1ps

import uvm_pkg::*;
import UPF::*;
`include "uvm_macros.svh"

interface acc_if(input logic clk);
    logic        rst_n;
    logic        enable;
    logic [31:0] data_in;
    logic [31:0] acc_out;
    logic        overflow;
endinterface


class acc_seq_item extends uvm_sequence_item;

    	rand logic        enable;
    	rand logic [31:0] data_in;

         logic        rst_n;
         logic [31:0] acc_out;
         logic        overflow;

    `uvm_object_utils_begin(acc_seq_item)
        `uvm_field_int(rst_n,    UVM_DEFAULT)
        `uvm_field_int(enable,   UVM_DEFAULT)
        `uvm_field_int(data_in,  UVM_DEFAULT)
        `uvm_field_int(acc_out,  UVM_DEFAULT)
        `uvm_field_int(overflow, UVM_DEFAULT)
    `uvm_object_utils_end

    function new(string name = "acc_seq_item");
        super.new(name);
    endfunction

endclass


// Directed functional sequence. Starting from reset value zero, checks addition, hold behavior, zero input, and two unsigned-overflow cases.
class acc_functional_sequence extends uvm_sequence #(acc_seq_item);

    `uvm_object_utils(acc_functional_sequence)

    function new(string name = "acc_functional_sequence");
        super.new(name);
    endfunction

    task send_item(logic enable, logic [31:0] data_in);
        acc_seq_item tx;
        tx = acc_seq_item::type_id::create("tx");
        start_item(tx);
        tx.enable  = enable;
        tx.data_in = data_in;
        finish_item(tx);
    endtask

    task body();
        send_item(1'b1, 32'h0000_0001); // 0 + 1 = 1
        send_item(1'b1, 32'h0000_0002); // 1 + 2 = 3
        send_item(1'b0, 32'hDEAD_BEEF); // hold 3
        send_item(1'b1, 32'hFFFF_FFFD); // 3 + FFFFFFFD = 0, overflow
        send_item(1'b0, 32'hFFFF_FFFF); // hold 0, overflow clears
        send_item(1'b1, 32'h0000_0000); // zero addition
        send_item(1'b1, 32'h8000_0000); // result 80000000
        send_item(1'b1, 32'h8000_0000); // result 0, overflow
    endtask

endclass


// High-activity workload: the accumulator updates on every transaction.
class acc_active_sequence extends uvm_sequence #(acc_seq_item);

    `uvm_object_utils(acc_active_sequence)

    function new(string name = "acc_active_sequence");
        super.new(name);
    endfunction

    task body();
        for (int i = 0; i < 100; i++) begin
            acc_seq_item tx;
            tx = acc_seq_item::type_id::create("tx");
            start_item(tx);
            tx.enable  = 1'b1;
            tx.data_in = (i % 2 == 0) ? 32'hAAAA_AAAA : 32'h5555_5555;
            finish_item(tx);
        end
    endtask

endclass


// Idle workload: initialize the state once, then toggle data while updates are disabled. This is expected to expose the clock-gating benefit later.
class acc_idle_sequence extends uvm_sequence #(acc_seq_item);

    `uvm_object_utils(acc_idle_sequence)

    function new(string name = "acc_idle_sequence");
        super.new(name);
    endfunction

    task body();
        acc_seq_item tx;

        tx = acc_seq_item::type_id::create("init_tx");
        start_item(tx);
        tx.enable  = 1'b1;
        tx.data_in = 32'h1234_5678;
        finish_item(tx);

        for (int i = 0; i < 100; i++) begin
            tx = acc_seq_item::type_id::create("idle_tx");
            start_item(tx);
            tx.enable  = 1'b0;
            tx.data_in = (i % 2 == 0) ? 32'h0000_0000 : 32'hFFFF_FFFF;
            finish_item(tx);
        end
    endtask

endclass


// Representative workload with active bursts, a long idle interval, and alternating active/idle transactions.
class acc_mixed_sequence extends uvm_sequence #(acc_seq_item);

    `uvm_object_utils(acc_mixed_sequence)

    function new(string name = "acc_mixed_sequence");
        super.new(name);
    endfunction

    task send_item(logic enable, logic [31:0] data_in);
        acc_seq_item tx;
        tx = acc_seq_item::type_id::create("tx");
        start_item(tx);
        tx.enable  = enable;
        tx.data_in = data_in;
        finish_item(tx);
    endtask

    task body();
        for (int i = 0; i < 20; i++)
            send_item(1'b1, (i % 2 == 0) ? 32'h0F0F_0F0F : 32'hF0F0_F0F0);

        for (int i = 0; i < 40; i++)
            send_item(1'b0, (i % 2 == 0) ? 32'hAAAA_AAAA : 32'h5555_5555);

        for (int i = 0; i < 20; i++)
            send_item(1'b1, (i % 2 == 0) ? 32'hFFFF_0000 : 32'h0000_FFFF);

        for (int i = 0; i < 20; i++)
            send_item(i[0], 32'hA5A5_0000 ^ i);
    endtask

endclass


class acc_sequencer extends uvm_sequencer #(acc_seq_item);

    `uvm_component_utils(acc_sequencer)

    function new(string name = "acc_sequencer", uvm_component parent = null);
        super.new(name, parent);
    endfunction

endclass


class acc_driver extends uvm_driver #(acc_seq_item);

    `uvm_component_utils(acc_driver)

    virtual acc_if vif;

    function new(string name = "acc_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db #(virtual acc_if)::get(this, "", "vif", vif))
            `uvm_fatal("NO_VIF", "Failed to get acc_if from the config DB")
    endfunction

    task run_phase(uvm_phase phase);
        acc_seq_item tx;

        wait (vif.rst_n === 1'b1);

        forever begin
            @(negedge vif.clk);

            tx = null;
            seq_item_port.try_next_item(tx);

            if (tx != null) begin
                vif.enable  <= tx.enable;
                vif.data_in <= tx.data_in;
                seq_item_port.item_done();
            end else begin
                vif.enable  <= 1'b0;
                vif.data_in <= 32'b0;
            end
        end
    endtask

endclass


class acc_monitor extends uvm_monitor;

    `uvm_component_utils(acc_monitor)

    virtual acc_if vif;
    uvm_analysis_port #(acc_seq_item) ap;

    function new(string name = "acc_monitor", uvm_component parent = null);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db #(virtual acc_if)::get(this, "", "vif", vif))
            `uvm_fatal("NO_VIF", "Failed to get acc_if from the config DB")
    endfunction

    task run_phase(uvm_phase phase);
        acc_seq_item tx;

        forever begin
            @(posedge vif.clk);
            #1step; // Sample after DUT nonblocking assignments settle.

            tx = acc_seq_item::type_id::create("tx");
            tx.rst_n    = vif.rst_n;
            tx.enable   = vif.enable;
            tx.data_in  = vif.data_in;
            tx.acc_out  = vif.acc_out;
            tx.overflow = vif.overflow;
            ap.write(tx);
        end
    endtask

endclass


class acc_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(acc_scoreboard)

    uvm_analysis_imp #(acc_seq_item, acc_scoreboard) ap;

    logic [31:0] expected_acc;
    logic        expected_overflow;
    int unsigned checks;
    int unsigned errors;

    function new(string name = "acc_scoreboard", uvm_component parent = null);
        super.new(name, parent);
        ap = new("ap", this);
        expected_acc      = 32'b0;
        expected_overflow = 1'b0;
        checks             = 0;
        errors             = 0;
    endfunction

    function void write(acc_seq_item tx);
        logic [32:0] expected_sum;

        if (!tx.rst_n) begin
            expected_acc      = 32'b0;
            expected_overflow = 1'b0;
        end else if (tx.enable) begin
            expected_sum      = {1'b0, expected_acc} + {1'b0, tx.data_in};
            expected_acc      = expected_sum[31:0];
            expected_overflow = expected_sum[32];
        end else begin
            expected_overflow = 1'b0;
        end

        checks++;

        if ((tx.acc_out !== expected_acc) ||
            (tx.overflow !== expected_overflow)) begin
            errors++;
            `uvm_error("ACC_SCOREBOARD",
                $sformatf("Mismatch: rst_n=%0b enable=%0b data_in=%08h acc_out=%08h expected_acc=%08h overflow=%0b expected_overflow=%0b",
                          tx.rst_n, tx.enable, tx.data_in,
                          tx.acc_out, expected_acc, tx.overflow,
                          expected_overflow))
        end else begin
            `uvm_info("ACC_SCOREBOARD",
                $sformatf("Match: enable=%0b data_in=%08h acc_out=%08h overflow=%0b",
                          tx.enable, tx.data_in, tx.acc_out, tx.overflow),
                UVM_LOW)
        end
    endfunction

    function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info("ACC_SCOREBOARD",
            $sformatf("Completed %0d checks with %0d scoreboard errors",
                      checks, errors), UVM_NONE)
    endfunction

endclass


class acc_agent extends uvm_agent;

    `uvm_component_utils(acc_agent)

    acc_sequencer sqr;
    acc_driver    drv;
    acc_monitor   mon;

    uvm_analysis_port #(acc_seq_item) analysis_port;

    function new(string name = "acc_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        sqr = acc_sequencer::type_id::create("sqr", this);
        drv = acc_driver::type_id::create("drv", this);
        mon = acc_monitor::type_id::create("mon", this);
        analysis_port = new("analysis_port", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        drv.seq_item_port.connect(sqr.seq_item_export);
        mon.ap.connect(analysis_port);
    endfunction

endclass


class acc_env extends uvm_env;

    `uvm_component_utils(acc_env)

    acc_agent      agnt;
    acc_scoreboard scrbd;

    function new(string name = "acc_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agnt  = acc_agent::type_id::create("agnt", this);
        scrbd = acc_scoreboard::type_id::create("scrbd", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agnt.analysis_port.connect(scrbd.ap);
    endfunction

endclass


class acc_test extends uvm_test;

    `uvm_component_utils(acc_test)

    acc_env env;

    function new(string name = "acc_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = acc_env::type_id::create("env", this);
    endfunction

    task run_phase(uvm_phase phase);
        acc_functional_sequence functional_seq;
        acc_active_sequence     active_seq;
        acc_idle_sequence       idle_seq;
        acc_mixed_sequence      mixed_seq;

        phase.raise_objection(this, "Starting accumulator sequence");
        
        // functional_seq = acc_functional_sequence::type_id::create("functional_seq");
        // functional_seq.start(env.agnt.sqr);

        active_seq = acc_active_sequence::type_id::create("active_seq");
        active_seq.start(env.agnt.sqr);

        // idle_seq = acc_idle_sequence::type_id::create("idle_seq");
        // idle_seq.start(env.agnt.sqr);

        // mixed_seq = acc_mixed_sequence::type_id::create("mixed_seq");
        // mixed_seq.start(env.agnt.sqr);

        // Return the interface to an idle state and allow the scoreboard to
        // observe overflow clearing on a disabled cycle.
       
	repeat (2) @(negedge env.agnt.drv.vif.clk);

        phase.drop_objection(this, "Completed accumulator sequence");
    endtask

endclass


module accumulator_tb;

    logic clk;
    acc_if intf(clk);

    initial clk = 1'b0;
    always #5 clk = ~clk;

    // for upf
    bit vdd_status;
    bit vss_status;

    accumulator dut (
        .clk      (clk),
        .rst_n    (intf.rst_n),
        .enable   (intf.enable),
        .data_in  (intf.data_in),
        .acc_out  (intf.acc_out),
        .overflow (intf.overflow)
    );

    initial begin
        intf.rst_n  = 1'b0;
        intf.enable = 1'b0;
        intf.data_in = 32'b0;

        vdd_status = supply_on("VDD",1.0);
	vss_status = supply_on("VSS",0.0);

	if (!vdd_status)
        	$fatal(1, "Failed to turn on UPF supply port VDD");

	if (!vss_status)
        	$fatal(1, "Failed to turn on UPF supply port VSS");

        repeat (2) @(posedge clk);
        intf.rst_n <= 1'b1;
    end

    initial begin
        uvm_config_db #(virtual acc_if)::set(null, "uvm_test_top.env.agnt.*", "vif", intf);
        run_test("acc_test");
    end

endmodule


/*
 * Copyright (c) 2024 Engineer of CTW
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_ctw_ldo (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua,       // Analog pins, only ua[5:0] can be used
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // BẮT BUỘC: Gán tất cả các chân Digital Output không sử dụng xuống mức 0 (Ground)
    // Điều này giúp hệ thống CI/CD tổng hợp mạch không bị báo lỗi Floating Net.
    assign uo_out  = 8'b0;
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
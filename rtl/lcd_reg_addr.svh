// ============================================================================
// Auto-generated SystemVerilog Address Header for LCD_CTRL
// Version: 1.0
// ============================================================================
// IMPORTANT: This file is auto-generated. Manual edits may be lost.
// For changes: Modify the XLS specification and regenerate.
//
// Usage: `include "lcd_reg_addr.svh"
//        case (PADDR)
//          `LCD_CTRL_ADDR: ...
//        endcase
// ============================================================================

`ifndef __LCD_REG_ADDR_SVH__
`define __LCD_REG_ADDR_SVH__

// ----------------------------------------------------------------------------
// Register Addresses (32-bit aligned)
// ----------------------------------------------------------------------------
`define LCD_CTRL_ADDR 32'h00000000
`define LCD_STATUS_ADDR 32'h00000004
`define LCD_IRQ_EN_ADDR 32'h00000008
`define LCD_FB0_ADDR 32'h0000000C
`define LCD_FB1_ADDR 32'h00000010
`define LCD_STRIDE_ADDR 32'h00000014
`define LCD_PU_X_ADDR 32'h00000018
`define LCD_PU_Y_ADDR 32'h0000001C
`define LCD_SPI_CFG_ADDR 32'h00000020
`define LCD_TE_CFG_ADDR 32'h00000024
`define LCD_RESX_CFG0_ADDR 32'h00000028
`define LCD_RESX_CFG1_ADDR 32'h0000002C
`define LCD_CMD_FIFO_ADDR 32'h00000030
`define LCD_CMD_STATUS_ADDR 32'h00000034
`define LCD_ERR_ADDR 32'h00000038
`define LCD_VERSION_ADDR 32'h0000003C
`define LCD_INFO_ADDR 32'h00000040
`define LCD_FRAME_CTRL_ADDR 32'h00000044
`define LCD_LINEBUF_STATUS_ADDR 32'h00000048
`define LCD_SLAVE_BUFA_ADDR 32'h0000004C
`define LCD_SLAVE_BUFB_ADDR 32'h00000050
`define LCD_SLAVE_INFO_ADDR 32'h00000054

`endif // __LCD_REG_ADDR_SVH__

// ============================================================================
// Auto-generated SystemVerilog Reset Value Header for LCD_CTRL
// Version: 1.0
// ============================================================================
// IMPORTANT: This file is auto-generated. Manual edits may be lost.
// For changes: Modify the XLS specification and regenerate.
//
// Usage: `include "lcd_reg_rstval.svh"
//        always_ff @(posedge clk or negedge rst_n)
//          if (!rst_n)
//            my_field_r <= `LCD_MY_REG_MY_FIELD_RST;
//
// What-if Analysis:
//   To test different defaults, modify values here without running reggen.
//   Then regenerate with reggen to make changes permanent.
// ============================================================================

`ifndef __LCD_REG_RSTVAL_SVH__
`define __LCD_REG_RSTVAL_SVH__

// ----------------------------------------------------------------------------
// Register-Level Reset Values (full 32-bit)
// ----------------------------------------------------------------------------
`define LCD_LCD_CTRL_RST 32'h00000800
`define LCD_LCD_STATUS_RST 32'h00000000
`define LCD_LCD_IRQ_EN_RST 32'h00000000
`define LCD_LCD_FB0_ADDR_RST 32'h00000000
`define LCD_LCD_FB1_ADDR_RST 32'h00000000
`define LCD_LCD_STRIDE_RST 32'h00000000
`define LCD_LCD_PU_X_RST 32'h00000000
`define LCD_LCD_PU_Y_RST 32'h00000000
`define LCD_LCD_SPI_CFG_RST 32'h0000F100
`define LCD_LCD_TE_CFG_RST 32'h00FF0101
`define LCD_LCD_RESX_CFG0_RST 32'h00000064
`define LCD_LCD_RESX_CFG1_RST 32'h00000064
`define LCD_LCD_CMD_FIFO_RST 32'h00000000
`define LCD_LCD_CMD_STATUS_RST 32'h00000180
`define LCD_LCD_ERR_ADDR_RST 32'h00000000
`define LCD_LCD_VERSION_RST 32'hAC1D0100
`define LCD_LCD_INFO_RST 32'h001400F0
`define LCD_LCD_FRAME_CTRL_RST 32'h00000000
`define LCD_LCD_LINEBUF_STATUS_RST 32'h0000000C
`define LCD_LCD_SLAVE_BUFA_ADDR_RST 32'h00000000
`define LCD_LCD_SLAVE_BUFB_ADDR_RST 32'h00000000
`define LCD_LCD_SLAVE_INFO_RST 32'h00000400

// ----------------------------------------------------------------------------
// Field-Level Reset Values (extracted from register reset values)
// Format: WIDTH'd VALUE
// ----------------------------------------------------------------------------
`define LCD_LCD_CTRL_LCD_EN_RST 1'd0
`define LCD_LCD_CTRL_DMA_EN_RST 1'd0
`define LCD_LCD_CTRL_TE_EN_RST 1'd0
`define LCD_LCD_CTRL_CMD_SEQ_EN_RST 1'd0
`define LCD_LCD_CTRL_STREAM_MODE_RST 1'd0
`define LCD_LCD_CTRL_PARTIAL_EN_RST 1'd0
`define LCD_LCD_CTRL_BYTE_SWAP_RST 1'd0
`define LCD_LCD_CTRL_FB_SEL_RST 1'd0
`define LCD_LCD_CTRL_SOFT_RST_RST 1'd0
`define LCD_LCD_CTRL_FORCE_CMD_RST 1'd0
`define LCD_LCD_CTRL_DMA_SRC_RST 1'd0
`define LCD_LCD_CTRL_AUTO_BUF_SEL_RST 1'd1

`define LCD_LCD_STATUS_FRAME_DONE_RST 1'd0
`define LCD_LCD_STATUS_CMD_DONE_RST 1'd0
`define LCD_LCD_STATUS_FRAME_LATE_RST 1'd0
`define LCD_LCD_STATUS_ADDR_OOB_RST 1'd0
`define LCD_LCD_STATUS_STRIDE_ERR_RST 1'd0
`define LCD_LCD_STATUS_AXI_ERR_RST 1'd0
`define LCD_LCD_STATUS_FIFO_UNDERRUN_RST 1'd0
`define LCD_LCD_STATUS_TE_TIMEOUT_RST 1'd0
`define LCD_LCD_STATUS_MODE_SWITCH_ERR_RST 1'd0
`define LCD_LCD_STATUS_SPI_BUSY_RST 1'd0
`define LCD_LCD_STATUS_DMA_BUSY_RST 1'd0
`define LCD_LCD_STATUS_FRAME_ACTIVE_RST 1'd0
`define LCD_LCD_STATUS_CMD_BUSY_RST 1'd0
`define LCD_LCD_STATUS_RESX_ACTIVE_RST 1'd0

`define LCD_LCD_IRQ_EN_FRAME_DONE_EN_RST 1'd0
`define LCD_LCD_IRQ_EN_CMD_DONE_EN_RST 1'd0
`define LCD_LCD_IRQ_EN_FRAME_LATE_EN_RST 1'd0
`define LCD_LCD_IRQ_EN_ADDR_OOB_EN_RST 1'd0
`define LCD_LCD_IRQ_EN_STRIDE_ERR_EN_RST 1'd0
`define LCD_LCD_IRQ_EN_AXI_ERR_EN_RST 1'd0
`define LCD_LCD_IRQ_EN_FIFO_UNDERRUN_EN_RST 1'd0
`define LCD_LCD_IRQ_EN_TE_TIMEOUT_EN_RST 1'd0
`define LCD_LCD_IRQ_EN_MODE_SWITCH_ERR_EN_RST 1'd0
`define LCD_LCD_IRQ_EN_CMD_HALF_EMPTY_EN_RST 1'd0

`define LCD_LCD_FB0_ADDR_FB0_ADDR_RST 32'd0

`define LCD_LCD_FB1_ADDR_FB1_ADDR_RST 32'd0

`define LCD_LCD_STRIDE_STRIDE_RST 16'd0

`define LCD_LCD_PU_X_PU_X_START_RST 16'd0
`define LCD_LCD_PU_X_PU_X_END_RST 16'd0

`define LCD_LCD_PU_Y_PU_Y_START_RST 16'd0
`define LCD_LCD_PU_Y_PU_Y_END_RST 16'd0

`define LCD_LCD_SPI_CFG_SPI_DIV_RST 4'd0
`define LCD_LCD_SPI_CFG_SPI_MODE_RST 2'd0
`define LCD_LCD_SPI_CFG_WIRE_3_RST 1'd0
`define LCD_LCD_SPI_CFG_CS_SETUP_RST 4'd1
`define LCD_LCD_SPI_CFG_CS_HOLD_RST 4'd15

`define LCD_LCD_TE_CFG_TE_FPS_NUM_RST 8'd1
`define LCD_LCD_TE_CFG_TE_FPS_DEN_RST 8'd1
`define LCD_LCD_TE_CFG_TE_TIMEOUT_RST 8'd255
`define LCD_LCD_TE_CFG_TE_POL_RST 1'd0

`define LCD_LCD_RESX_CFG0_RESX_WIDTH_RST 16'd100

`define LCD_LCD_RESX_CFG1_RESX_DELAY_RST 16'd100
`define LCD_LCD_RESX_CFG1_RESX_ASSERT_RST 1'd0

`define LCD_LCD_CMD_FIFO_CMD_ENTRY_RST 32'd0

`define LCD_LCD_CMD_STATUS_CMD_FIFO_LEVEL_RST 6'd0
`define LCD_LCD_CMD_STATUS_CMD_FIFO_FULL_RST 1'd0
`define LCD_LCD_CMD_STATUS_CMD_FIFO_EMPTY_RST 1'd1
`define LCD_LCD_CMD_STATUS_CMD_FIFO_HALF_EMPTY_RST 1'd1

`define LCD_LCD_ERR_ADDR_ERR_ADDR_RST 32'd0

`define LCD_LCD_VERSION_IP_VER_MINOR_RST 8'd0
`define LCD_LCD_VERSION_IP_VER_MAJOR_RST 8'd1
`define LCD_LCD_VERSION_IP_ID_RST 16'd44061

`define LCD_LCD_INFO_MAX_COL_RST 12'd240
`define LCD_LCD_INFO_MAX_ROW_RST 12'd320

`define LCD_LCD_FRAME_CTRL_FRAME_READY_RST 1'd0
`define LCD_LCD_FRAME_CTRL_FRAME_COUNT_RST 8'd0

`define LCD_LCD_LINEBUF_STATUS_BUF_A_FULL_RST 1'd0
`define LCD_LCD_LINEBUF_STATUS_BUF_B_FULL_RST 1'd0
`define LCD_LCD_LINEBUF_STATUS_BUF_A_EMPTY_RST 1'd1
`define LCD_LCD_LINEBUF_STATUS_BUF_B_EMPTY_RST 1'd1
`define LCD_LCD_LINEBUF_STATUS_ACTIVE_WR_BUF_RST 1'd0
`define LCD_LCD_LINEBUF_STATUS_ACTIVE_RD_BUF_RST 1'd0

`define LCD_LCD_SLAVE_BUFA_ADDR_BUFA_ADDR_RST 32'd0

`define LCD_LCD_SLAVE_BUFB_ADDR_BUFB_ADDR_RST 32'd0

`define LCD_LCD_SLAVE_INFO_APERTURE_SIZE_RST 32'd1024

`endif // __LCD_REG_RSTVAL_SVH__

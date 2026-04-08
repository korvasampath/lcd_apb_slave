// ============================================================================
// Auto-generated APB Register Block
// Block  : LCD_CTRL
// Prefix : LCD
// Version: 1.0
// ============================================================================
// IMPORTANT: This file is auto-generated. Manual edits may be lost.
// For ECOs: Modify the XLS specification and regenerate.
// ============================================================================

`include "lcd_reg_addr.svh"
`include "lcd_reg_rstval.svh"

module lcd_regs_apb (
  input  logic        PCLK,
  input  logic        PRESETn,
  input  logic        PSEL,
  input  logic        PENABLE,
  input  logic        PWRITE,
  input  logic [31:0] PADDR,
  input  logic [31:0] PWDATA,
  output logic [31:0] PRDATA,
  output logic        PREADY,
  output logic        PSLVERR,
  output logic        lcd_ctrl_lcd_en,
  output logic        lcd_ctrl_dma_en,
  output logic        lcd_ctrl_te_en,
  output logic        lcd_ctrl_cmd_seq_en,
  output logic        lcd_ctrl_stream_mode,
  output logic        lcd_ctrl_partial_en,
  output logic        lcd_ctrl_byte_swap,
  output logic        lcd_ctrl_fb_sel,
  output logic        lcd_ctrl_soft_rst,
  input  logic        lcd_ctrl_soft_rst_clr,
  output logic        lcd_ctrl_force_cmd,
  input  logic        lcd_ctrl_force_cmd_clr,
  output logic        lcd_ctrl_dma_src,
  output logic        lcd_ctrl_auto_buf_sel,
  output logic        lcd_status_frame_done,
  input  logic        lcd_status_frame_done_set,
  output logic        lcd_status_cmd_done,
  input  logic        lcd_status_cmd_done_set,
  output logic        lcd_status_frame_late,
  input  logic        lcd_status_frame_late_set,
  output logic        lcd_status_addr_oob,
  input  logic        lcd_status_addr_oob_set,
  output logic        lcd_status_stride_err,
  input  logic        lcd_status_stride_err_set,
  output logic        lcd_status_axi_err,
  input  logic        lcd_status_axi_err_set,
  output logic        lcd_status_fifo_underrun,
  input  logic        lcd_status_fifo_underrun_set,
  output logic        lcd_status_te_timeout,
  input  logic        lcd_status_te_timeout_set,
  output logic        lcd_status_mode_switch_err,
  input  logic        lcd_status_mode_switch_err_set,
  input  logic        lcd_status_spi_busy,
  input  logic        lcd_status_dma_busy,
  input  logic        lcd_status_frame_active,
  input  logic        lcd_status_cmd_busy,
  input  logic        lcd_status_resx_active,
  output logic        lcd_irq_en_frame_done_en,
  output logic        lcd_irq_en_cmd_done_en,
  output logic        lcd_irq_en_frame_late_en,
  output logic        lcd_irq_en_addr_oob_en,
  output logic        lcd_irq_en_stride_err_en,
  output logic        lcd_irq_en_axi_err_en,
  output logic        lcd_irq_en_fifo_underrun_en,
  output logic        lcd_irq_en_te_timeout_en,
  output logic        lcd_irq_en_mode_switch_err_en,
  output logic        lcd_irq_en_cmd_half_empty_en,
  output logic [31:0] lcd_fb0_addr_fb0_addr,
  output logic [31:0] lcd_fb1_addr_fb1_addr,
  output logic [15:0] lcd_stride_stride,
  output logic [15:0] lcd_pu_x_pu_x_start,
  output logic [15:0] lcd_pu_x_pu_x_end,
  output logic [15:0] lcd_pu_y_pu_y_start,
  output logic [15:0] lcd_pu_y_pu_y_end,
  output logic [3:0] lcd_spi_cfg_spi_div,
  output logic [1:0] lcd_spi_cfg_spi_mode,
  output logic        lcd_spi_cfg_wire_3,
  output logic [3:0] lcd_spi_cfg_cs_setup,
  output logic [3:0] lcd_spi_cfg_cs_hold,
  output logic [7:0] lcd_te_cfg_te_fps_num,
  output logic [7:0] lcd_te_cfg_te_fps_den,
  output logic [7:0] lcd_te_cfg_te_timeout,
  output logic        lcd_te_cfg_te_pol,
  output logic [15:0] lcd_resx_cfg0_resx_width,
  output logic [15:0] lcd_resx_cfg1_resx_delay,
  output logic        lcd_resx_cfg1_resx_assert,
  input  logic        lcd_resx_cfg1_resx_assert_clr,
  output logic [31:0] lcd_cmd_fifo_cmd_entry,
  output logic        lcd_cmd_fifo_cmd_entry_wr,
  input  logic [5:0] lcd_cmd_status_cmd_fifo_level,
  input  logic        lcd_cmd_status_cmd_fifo_full,
  input  logic        lcd_cmd_status_cmd_fifo_empty,
  input  logic        lcd_cmd_status_cmd_fifo_half_empty,
  input  logic [31:0] lcd_err_addr_err_addr,
  input  logic [7:0] lcd_version_ip_ver_minor,
  input  logic [7:0] lcd_version_ip_ver_major,
  input  logic [15:0] lcd_version_ip_id,
  input  logic [11:0] lcd_info_max_col,
  input  logic [11:0] lcd_info_max_row,
  output logic        lcd_frame_ctrl_frame_ready,
  input  logic        lcd_frame_ctrl_frame_ready_clr,
  input  logic [7:0] lcd_frame_ctrl_frame_count,
  input  logic        lcd_linebuf_status_buf_a_full,
  input  logic        lcd_linebuf_status_buf_b_full,
  input  logic        lcd_linebuf_status_buf_a_empty,
  input  logic        lcd_linebuf_status_buf_b_empty,
  input  logic        lcd_linebuf_status_active_wr_buf,
  input  logic        lcd_linebuf_status_active_rd_buf,
  input  logic [31:0] lcd_slave_bufa_addr_bufa_addr,
  input  logic [31:0] lcd_slave_bufb_addr_bufb_addr,
  input  logic [31:0] lcd_slave_info_aperture_size
);

// ----------------------------------------------------------------------------
// Internal Storage
// RW / HWC / W1C / WO / WO_PULSED : SW-owned registers
// ----------------------------------------------------------------------------
logic        lcd_ctrl_lcd_en_r;
logic        lcd_ctrl_dma_en_r;
logic        lcd_ctrl_te_en_r;
logic        lcd_ctrl_cmd_seq_en_r;
logic        lcd_ctrl_stream_mode_r;
logic        lcd_ctrl_partial_en_r;
logic        lcd_ctrl_byte_swap_r;
logic        lcd_ctrl_fb_sel_r;
logic        lcd_ctrl_soft_rst_r;
logic        lcd_ctrl_force_cmd_r;
logic        lcd_ctrl_dma_src_r;
logic        lcd_ctrl_auto_buf_sel_r;
logic        lcd_status_frame_done_r;
logic        lcd_status_cmd_done_r;
logic        lcd_status_frame_late_r;
logic        lcd_status_addr_oob_r;
logic        lcd_status_stride_err_r;
logic        lcd_status_axi_err_r;
logic        lcd_status_fifo_underrun_r;
logic        lcd_status_te_timeout_r;
logic        lcd_status_mode_switch_err_r;
logic        lcd_irq_en_frame_done_en_r;
logic        lcd_irq_en_cmd_done_en_r;
logic        lcd_irq_en_frame_late_en_r;
logic        lcd_irq_en_addr_oob_en_r;
logic        lcd_irq_en_stride_err_en_r;
logic        lcd_irq_en_axi_err_en_r;
logic        lcd_irq_en_fifo_underrun_en_r;
logic        lcd_irq_en_te_timeout_en_r;
logic        lcd_irq_en_mode_switch_err_en_r;
logic        lcd_irq_en_cmd_half_empty_en_r;
logic [31:0] lcd_fb0_addr_fb0_addr_r;
logic [31:0] lcd_fb1_addr_fb1_addr_r;
logic [15:0] lcd_stride_stride_r;
logic [15:0] lcd_pu_x_pu_x_start_r;
logic [15:0] lcd_pu_x_pu_x_end_r;
logic [15:0] lcd_pu_y_pu_y_start_r;
logic [15:0] lcd_pu_y_pu_y_end_r;
logic [3:0] lcd_spi_cfg_spi_div_r;
logic [1:0] lcd_spi_cfg_spi_mode_r;
logic        lcd_spi_cfg_wire_3_r;
logic [3:0] lcd_spi_cfg_cs_setup_r;
logic [3:0] lcd_spi_cfg_cs_hold_r;
logic [7:0] lcd_te_cfg_te_fps_num_r;
logic [7:0] lcd_te_cfg_te_fps_den_r;
logic [7:0] lcd_te_cfg_te_timeout_r;
logic        lcd_te_cfg_te_pol_r;
logic [15:0] lcd_resx_cfg0_resx_width_r;
logic [15:0] lcd_resx_cfg1_resx_delay_r;
logic        lcd_resx_cfg1_resx_assert_r;
logic [31:0] lcd_cmd_fifo_cmd_entry_r;
logic        lcd_frame_ctrl_frame_ready_r;
logic        lcd_cmd_fifo_cmd_entry_wr_r;
logic        pready_rd_r;

// ----------------------------------------------------------------------------
// Sequential Logic
// Write decode, HWC/W1C priority, ACR, RC_FIFO_1 wait FSM, PREADY register
// ----------------------------------------------------------------------------
always_ff @(posedge PCLK or negedge PRESETn) begin
  if (!PRESETn) begin
    lcd_ctrl_lcd_en_r <= `LCD_LCD_CTRL_LCD_EN_RST;
    lcd_ctrl_dma_en_r <= `LCD_LCD_CTRL_DMA_EN_RST;
    lcd_ctrl_te_en_r <= `LCD_LCD_CTRL_TE_EN_RST;
    lcd_ctrl_cmd_seq_en_r <= `LCD_LCD_CTRL_CMD_SEQ_EN_RST;
    lcd_ctrl_stream_mode_r <= `LCD_LCD_CTRL_STREAM_MODE_RST;
    lcd_ctrl_partial_en_r <= `LCD_LCD_CTRL_PARTIAL_EN_RST;
    lcd_ctrl_byte_swap_r <= `LCD_LCD_CTRL_BYTE_SWAP_RST;
    lcd_ctrl_fb_sel_r <= `LCD_LCD_CTRL_FB_SEL_RST;
    lcd_ctrl_soft_rst_r <= `LCD_LCD_CTRL_SOFT_RST_RST;
    lcd_ctrl_force_cmd_r <= `LCD_LCD_CTRL_FORCE_CMD_RST;
    lcd_ctrl_dma_src_r <= `LCD_LCD_CTRL_DMA_SRC_RST;
    lcd_ctrl_auto_buf_sel_r <= `LCD_LCD_CTRL_AUTO_BUF_SEL_RST;
    lcd_status_frame_done_r <= `LCD_LCD_STATUS_FRAME_DONE_RST;
    lcd_status_cmd_done_r <= `LCD_LCD_STATUS_CMD_DONE_RST;
    lcd_status_frame_late_r <= `LCD_LCD_STATUS_FRAME_LATE_RST;
    lcd_status_addr_oob_r <= `LCD_LCD_STATUS_ADDR_OOB_RST;
    lcd_status_stride_err_r <= `LCD_LCD_STATUS_STRIDE_ERR_RST;
    lcd_status_axi_err_r <= `LCD_LCD_STATUS_AXI_ERR_RST;
    lcd_status_fifo_underrun_r <= `LCD_LCD_STATUS_FIFO_UNDERRUN_RST;
    lcd_status_te_timeout_r <= `LCD_LCD_STATUS_TE_TIMEOUT_RST;
    lcd_status_mode_switch_err_r <= `LCD_LCD_STATUS_MODE_SWITCH_ERR_RST;
    lcd_irq_en_frame_done_en_r <= `LCD_LCD_IRQ_EN_FRAME_DONE_EN_RST;
    lcd_irq_en_cmd_done_en_r <= `LCD_LCD_IRQ_EN_CMD_DONE_EN_RST;
    lcd_irq_en_frame_late_en_r <= `LCD_LCD_IRQ_EN_FRAME_LATE_EN_RST;
    lcd_irq_en_addr_oob_en_r <= `LCD_LCD_IRQ_EN_ADDR_OOB_EN_RST;
    lcd_irq_en_stride_err_en_r <= `LCD_LCD_IRQ_EN_STRIDE_ERR_EN_RST;
    lcd_irq_en_axi_err_en_r <= `LCD_LCD_IRQ_EN_AXI_ERR_EN_RST;
    lcd_irq_en_fifo_underrun_en_r <= `LCD_LCD_IRQ_EN_FIFO_UNDERRUN_EN_RST;
    lcd_irq_en_te_timeout_en_r <= `LCD_LCD_IRQ_EN_TE_TIMEOUT_EN_RST;
    lcd_irq_en_mode_switch_err_en_r <= `LCD_LCD_IRQ_EN_MODE_SWITCH_ERR_EN_RST;
    lcd_irq_en_cmd_half_empty_en_r <= `LCD_LCD_IRQ_EN_CMD_HALF_EMPTY_EN_RST;
    lcd_fb0_addr_fb0_addr_r <= `LCD_LCD_FB0_ADDR_FB0_ADDR_RST;
    lcd_fb1_addr_fb1_addr_r <= `LCD_LCD_FB1_ADDR_FB1_ADDR_RST;
    lcd_stride_stride_r <= `LCD_LCD_STRIDE_STRIDE_RST;
    lcd_pu_x_pu_x_start_r <= `LCD_LCD_PU_X_PU_X_START_RST;
    lcd_pu_x_pu_x_end_r <= `LCD_LCD_PU_X_PU_X_END_RST;
    lcd_pu_y_pu_y_start_r <= `LCD_LCD_PU_Y_PU_Y_START_RST;
    lcd_pu_y_pu_y_end_r <= `LCD_LCD_PU_Y_PU_Y_END_RST;
    lcd_spi_cfg_spi_div_r <= `LCD_LCD_SPI_CFG_SPI_DIV_RST;
    lcd_spi_cfg_spi_mode_r <= `LCD_LCD_SPI_CFG_SPI_MODE_RST;
    lcd_spi_cfg_wire_3_r <= `LCD_LCD_SPI_CFG_WIRE_3_RST;
    lcd_spi_cfg_cs_setup_r <= `LCD_LCD_SPI_CFG_CS_SETUP_RST;
    lcd_spi_cfg_cs_hold_r <= `LCD_LCD_SPI_CFG_CS_HOLD_RST;
    lcd_te_cfg_te_fps_num_r <= `LCD_LCD_TE_CFG_TE_FPS_NUM_RST;
    lcd_te_cfg_te_fps_den_r <= `LCD_LCD_TE_CFG_TE_FPS_DEN_RST;
    lcd_te_cfg_te_timeout_r <= `LCD_LCD_TE_CFG_TE_TIMEOUT_RST;
    lcd_te_cfg_te_pol_r <= `LCD_LCD_TE_CFG_TE_POL_RST;
    lcd_resx_cfg0_resx_width_r <= `LCD_LCD_RESX_CFG0_RESX_WIDTH_RST;
    lcd_resx_cfg1_resx_delay_r <= `LCD_LCD_RESX_CFG1_RESX_DELAY_RST;
    lcd_resx_cfg1_resx_assert_r <= `LCD_LCD_RESX_CFG1_RESX_ASSERT_RST;
    lcd_cmd_fifo_cmd_entry_r <= `LCD_LCD_CMD_FIFO_CMD_ENTRY_RST;
    lcd_frame_ctrl_frame_ready_r <= `LCD_LCD_FRAME_CTRL_FRAME_READY_RST;
    lcd_cmd_fifo_cmd_entry_wr_r <= 1'b0;
    pready_rd_r <= 1'b0;
  end else begin

    // Default: clear WO write-strobes and WO_PULSED (single-cycle pulses)
    lcd_cmd_fifo_cmd_entry_wr_r <= 1'b0;

    // APB Write Decode — processed BEFORE HW-set to give HW priority over SW clear
    if (PSEL && PENABLE && PWRITE) begin
      case (PADDR)
        `LCD_LCD_CTRL_ADDR: begin  // LCD_CTRL
          lcd_ctrl_lcd_en_r <= PWDATA[0];
          lcd_ctrl_dma_en_r <= PWDATA[1];
          lcd_ctrl_te_en_r <= PWDATA[2];
          lcd_ctrl_cmd_seq_en_r <= PWDATA[3];
          lcd_ctrl_stream_mode_r <= PWDATA[4];
          lcd_ctrl_partial_en_r <= PWDATA[5];
          lcd_ctrl_byte_swap_r <= PWDATA[6];
          lcd_ctrl_fb_sel_r <= PWDATA[7];
          if (PWDATA[8]) lcd_ctrl_soft_rst_r <= 1'b1;  // write-1-to-set
          if (PWDATA[9]) lcd_ctrl_force_cmd_r <= 1'b1;  // write-1-to-set
          lcd_ctrl_dma_src_r <= PWDATA[10];
          lcd_ctrl_auto_buf_sel_r <= PWDATA[11];
        end
        `LCD_LCD_STATUS_ADDR: begin  // LCD_STATUS
          if (PWDATA[0]) lcd_status_frame_done_r <= 1'b0;  // write-1-to-clear
          if (PWDATA[1]) lcd_status_cmd_done_r <= 1'b0;  // write-1-to-clear
          if (PWDATA[2]) lcd_status_frame_late_r <= 1'b0;  // write-1-to-clear
          if (PWDATA[3]) lcd_status_addr_oob_r <= 1'b0;  // write-1-to-clear
          if (PWDATA[4]) lcd_status_stride_err_r <= 1'b0;  // write-1-to-clear
          if (PWDATA[5]) lcd_status_axi_err_r <= 1'b0;  // write-1-to-clear
          if (PWDATA[6]) lcd_status_fifo_underrun_r <= 1'b0;  // write-1-to-clear
          if (PWDATA[7]) lcd_status_te_timeout_r <= 1'b0;  // write-1-to-clear
          if (PWDATA[8]) lcd_status_mode_switch_err_r <= 1'b0;  // write-1-to-clear
        end
        `LCD_LCD_IRQ_EN_ADDR: begin  // LCD_IRQ_EN
          lcd_irq_en_frame_done_en_r <= PWDATA[0];
          lcd_irq_en_cmd_done_en_r <= PWDATA[1];
          lcd_irq_en_frame_late_en_r <= PWDATA[2];
          lcd_irq_en_addr_oob_en_r <= PWDATA[3];
          lcd_irq_en_stride_err_en_r <= PWDATA[4];
          lcd_irq_en_axi_err_en_r <= PWDATA[5];
          lcd_irq_en_fifo_underrun_en_r <= PWDATA[6];
          lcd_irq_en_te_timeout_en_r <= PWDATA[7];
          lcd_irq_en_mode_switch_err_en_r <= PWDATA[8];
          lcd_irq_en_cmd_half_empty_en_r <= PWDATA[9];
        end
        `LCD_LCD_FB0_ADDR_ADDR: begin  // LCD_FB0_ADDR
          lcd_fb0_addr_fb0_addr_r <= PWDATA[31:0];
        end
        `LCD_LCD_FB1_ADDR_ADDR: begin  // LCD_FB1_ADDR
          lcd_fb1_addr_fb1_addr_r <= PWDATA[31:0];
        end
        `LCD_LCD_STRIDE_ADDR: begin  // LCD_STRIDE
          lcd_stride_stride_r <= PWDATA[15:0];
        end
        `LCD_LCD_PU_X_ADDR: begin  // LCD_PU_X
          lcd_pu_x_pu_x_start_r <= PWDATA[15:0];
          lcd_pu_x_pu_x_end_r <= PWDATA[31:16];
        end
        `LCD_LCD_PU_Y_ADDR: begin  // LCD_PU_Y
          lcd_pu_y_pu_y_start_r <= PWDATA[15:0];
          lcd_pu_y_pu_y_end_r <= PWDATA[31:16];
        end
        `LCD_LCD_SPI_CFG_ADDR: begin  // LCD_SPI_CFG
          lcd_spi_cfg_spi_div_r <= PWDATA[3:0];
          lcd_spi_cfg_spi_mode_r <= PWDATA[5:4];
          lcd_spi_cfg_wire_3_r <= PWDATA[6];
          lcd_spi_cfg_cs_setup_r <= PWDATA[11:8];
          lcd_spi_cfg_cs_hold_r <= PWDATA[15:12];
        end
        `LCD_LCD_TE_CFG_ADDR: begin  // LCD_TE_CFG
          lcd_te_cfg_te_fps_num_r <= PWDATA[7:0];
          lcd_te_cfg_te_fps_den_r <= PWDATA[15:8];
          lcd_te_cfg_te_timeout_r <= PWDATA[23:16];
          lcd_te_cfg_te_pol_r <= PWDATA[24];
        end
        `LCD_LCD_RESX_CFG0_ADDR: begin  // LCD_RESX_CFG0
          lcd_resx_cfg0_resx_width_r <= PWDATA[15:0];
        end
        `LCD_LCD_RESX_CFG1_ADDR: begin  // LCD_RESX_CFG1
          lcd_resx_cfg1_resx_delay_r <= PWDATA[15:0];
          if (PWDATA[16]) lcd_resx_cfg1_resx_assert_r <= 1'b1;  // write-1-to-set
        end
        `LCD_LCD_CMD_FIFO_ADDR: begin  // LCD_CMD_FIFO
          lcd_cmd_fifo_cmd_entry_r    <= PWDATA[31:0];
          lcd_cmd_fifo_cmd_entry_wr_r <= 1'b1;
        end
        `LCD_LCD_FRAME_CTRL_ADDR: begin  // LCD_FRAME_CTRL
          if (PWDATA[0]) lcd_frame_ctrl_frame_ready_r <= 1'b1;  // write-1-to-set
        end
        default: ;  // undefined address — PSLVERR asserted combinationally
      endcase
    end

    // HWC: Hardware clear has priority over SW write
    if (lcd_ctrl_soft_rst_clr)
      lcd_ctrl_soft_rst_r <= 1'b0;
    if (lcd_ctrl_force_cmd_clr)
      lcd_ctrl_force_cmd_r <= 1'b0;
    if (lcd_resx_cfg1_resx_assert_clr)
      lcd_resx_cfg1_resx_assert_r <= 1'b0;
    if (lcd_frame_ctrl_frame_ready_clr)
      lcd_frame_ctrl_frame_ready_r <= 1'b0;

    // W1C: Hardware set — executes last to prevent missed interrupts
    if (lcd_status_frame_done_set)
      lcd_status_frame_done_r <= 1'b1;
    if (lcd_status_cmd_done_set)
      lcd_status_cmd_done_r <= 1'b1;
    if (lcd_status_frame_late_set)
      lcd_status_frame_late_r <= 1'b1;
    if (lcd_status_addr_oob_set)
      lcd_status_addr_oob_r <= 1'b1;
    if (lcd_status_stride_err_set)
      lcd_status_stride_err_r <= 1'b1;
    if (lcd_status_axi_err_set)
      lcd_status_axi_err_r <= 1'b1;
    if (lcd_status_fifo_underrun_set)
      lcd_status_fifo_underrun_r <= 1'b1;
    if (lcd_status_te_timeout_set)
      lcd_status_te_timeout_r <= 1'b1;
    if (lcd_status_mode_switch_err_set)
      lcd_status_mode_switch_err_r <= 1'b1;

    // PREADY read register: self-clears after 1 cycle; disabled for RC_FIFO_1 reads
    pready_rd_r <= PSEL && PENABLE && !PWRITE && !pready_rd_r;
  end
end

// ----------------------------------------------------------------------------
// Sequential Read Mux
// PRDATA registered on access phase; valid one cycle later when PREADY=1
// WO / WO_PULSED excluded — PSLVERR asserted on those reads
// ----------------------------------------------------------------------------
always_ff @(posedge PCLK or negedge PRESETn) begin
  if (!PRESETn) begin
    PRDATA <= 32'h0;
  end else if (PSEL && PENABLE && !PWRITE) begin
    PRDATA <= 32'h0;
    case (PADDR)
      `LCD_LCD_CTRL_ADDR: begin  // LCD_CTRL (RW)
        PRDATA[0] <= lcd_ctrl_lcd_en_r;
        PRDATA[1] <= lcd_ctrl_dma_en_r;
        PRDATA[2] <= lcd_ctrl_te_en_r;
        PRDATA[3] <= lcd_ctrl_cmd_seq_en_r;
        PRDATA[4] <= lcd_ctrl_stream_mode_r;
        PRDATA[5] <= lcd_ctrl_partial_en_r;
        PRDATA[6] <= lcd_ctrl_byte_swap_r;
        PRDATA[7] <= lcd_ctrl_fb_sel_r;
        PRDATA[10] <= lcd_ctrl_dma_src_r;
        PRDATA[11] <= lcd_ctrl_auto_buf_sel_r;
      end
      `LCD_LCD_STATUS_ADDR: begin  // LCD_STATUS (W1C)
        PRDATA[0] <= lcd_status_frame_done_r;
        PRDATA[1] <= lcd_status_cmd_done_r;
        PRDATA[2] <= lcd_status_frame_late_r;
        PRDATA[3] <= lcd_status_addr_oob_r;
        PRDATA[4] <= lcd_status_stride_err_r;
        PRDATA[5] <= lcd_status_axi_err_r;
        PRDATA[6] <= lcd_status_fifo_underrun_r;
        PRDATA[7] <= lcd_status_te_timeout_r;
        PRDATA[8] <= lcd_status_mode_switch_err_r;
        PRDATA[9] <= lcd_status_spi_busy;
        PRDATA[10] <= lcd_status_dma_busy;
        PRDATA[11] <= lcd_status_frame_active;
        PRDATA[12] <= lcd_status_cmd_busy;
        PRDATA[13] <= lcd_status_resx_active;
      end
      `LCD_LCD_IRQ_EN_ADDR: begin  // LCD_IRQ_EN (RW)
        PRDATA[0] <= lcd_irq_en_frame_done_en_r;
        PRDATA[1] <= lcd_irq_en_cmd_done_en_r;
        PRDATA[2] <= lcd_irq_en_frame_late_en_r;
        PRDATA[3] <= lcd_irq_en_addr_oob_en_r;
        PRDATA[4] <= lcd_irq_en_stride_err_en_r;
        PRDATA[5] <= lcd_irq_en_axi_err_en_r;
        PRDATA[6] <= lcd_irq_en_fifo_underrun_en_r;
        PRDATA[7] <= lcd_irq_en_te_timeout_en_r;
        PRDATA[8] <= lcd_irq_en_mode_switch_err_en_r;
        PRDATA[9] <= lcd_irq_en_cmd_half_empty_en_r;
      end
      `LCD_LCD_FB0_ADDR_ADDR: begin  // LCD_FB0_ADDR (RW)
        PRDATA[31:0] <= lcd_fb0_addr_fb0_addr_r;
      end
      `LCD_LCD_FB1_ADDR_ADDR: begin  // LCD_FB1_ADDR (RW)
        PRDATA[31:0] <= lcd_fb1_addr_fb1_addr_r;
      end
      `LCD_LCD_STRIDE_ADDR: begin  // LCD_STRIDE (RW)
        PRDATA[15:0] <= lcd_stride_stride_r;
      end
      `LCD_LCD_PU_X_ADDR: begin  // LCD_PU_X (RW)
        PRDATA[15:0] <= lcd_pu_x_pu_x_start_r;
        PRDATA[31:16] <= lcd_pu_x_pu_x_end_r;
      end
      `LCD_LCD_PU_Y_ADDR: begin  // LCD_PU_Y (RW)
        PRDATA[15:0] <= lcd_pu_y_pu_y_start_r;
        PRDATA[31:16] <= lcd_pu_y_pu_y_end_r;
      end
      `LCD_LCD_SPI_CFG_ADDR: begin  // LCD_SPI_CFG (RW)
        PRDATA[3:0] <= lcd_spi_cfg_spi_div_r;
        PRDATA[5:4] <= lcd_spi_cfg_spi_mode_r;
        PRDATA[6] <= lcd_spi_cfg_wire_3_r;
        PRDATA[11:8] <= lcd_spi_cfg_cs_setup_r;
        PRDATA[15:12] <= lcd_spi_cfg_cs_hold_r;
      end
      `LCD_LCD_TE_CFG_ADDR: begin  // LCD_TE_CFG (RW)
        PRDATA[7:0] <= lcd_te_cfg_te_fps_num_r;
        PRDATA[15:8] <= lcd_te_cfg_te_fps_den_r;
        PRDATA[23:16] <= lcd_te_cfg_te_timeout_r;
        PRDATA[24] <= lcd_te_cfg_te_pol_r;
      end
      `LCD_LCD_RESX_CFG0_ADDR: begin  // LCD_RESX_CFG0 (RW)
        PRDATA[15:0] <= lcd_resx_cfg0_resx_width_r;
      end
      `LCD_LCD_RESX_CFG1_ADDR: begin  // LCD_RESX_CFG1 (RW)
        PRDATA[15:0] <= lcd_resx_cfg1_resx_delay_r;
      end
      `LCD_LCD_CMD_STATUS_ADDR: begin  // LCD_CMD_STATUS (RO)
        PRDATA[5:0] <= lcd_cmd_status_cmd_fifo_level;
        PRDATA[6] <= lcd_cmd_status_cmd_fifo_full;
        PRDATA[7] <= lcd_cmd_status_cmd_fifo_empty;
        PRDATA[8] <= lcd_cmd_status_cmd_fifo_half_empty;
      end
      `LCD_LCD_ERR_ADDR_ADDR: begin  // LCD_ERR_ADDR (RO)
        PRDATA[31:0] <= lcd_err_addr_err_addr;
      end
      `LCD_LCD_VERSION_ADDR: begin  // LCD_VERSION (RO)
        PRDATA[7:0] <= lcd_version_ip_ver_minor;
        PRDATA[15:8] <= lcd_version_ip_ver_major;
        PRDATA[31:16] <= lcd_version_ip_id;
      end
      `LCD_LCD_INFO_ADDR: begin  // LCD_INFO (RO)
        PRDATA[11:0] <= lcd_info_max_col;
        PRDATA[23:12] <= lcd_info_max_row;
      end
      `LCD_LCD_FRAME_CTRL_ADDR: begin  // LCD_FRAME_CTRL (RW)
        PRDATA[15:8] <= lcd_frame_ctrl_frame_count;
      end
      `LCD_LCD_LINEBUF_STATUS_ADDR: begin  // LCD_LINEBUF_STATUS (RO)
        PRDATA[0] <= lcd_linebuf_status_buf_a_full;
        PRDATA[1] <= lcd_linebuf_status_buf_b_full;
        PRDATA[2] <= lcd_linebuf_status_buf_a_empty;
        PRDATA[3] <= lcd_linebuf_status_buf_b_empty;
        PRDATA[4] <= lcd_linebuf_status_active_wr_buf;
        PRDATA[5] <= lcd_linebuf_status_active_rd_buf;
      end
      `LCD_LCD_SLAVE_BUFA_ADDR_ADDR: begin  // LCD_SLAVE_BUFA_ADDR (RO)
        PRDATA[31:0] <= lcd_slave_bufa_addr_bufa_addr;
      end
      `LCD_LCD_SLAVE_BUFB_ADDR_ADDR: begin  // LCD_SLAVE_BUFB_ADDR (RO)
        PRDATA[31:0] <= lcd_slave_bufb_addr_bufb_addr;
      end
      `LCD_LCD_SLAVE_INFO_ADDR: begin  // LCD_SLAVE_INFO (RO)
        PRDATA[31:0] <= lcd_slave_info_aperture_size;
      end
    endcase
  end else begin
    PRDATA <= 32'h0;
  end
end

// ----------------------------------------------------------------------------
// PSLVERR — Illegal Access Detection
//   Write to RO/HW register or undefined address → PSLVERR
//   Read  from WO/WO_PULSED register or undefined address → PSLVERR
// Sampled by master only when PREADY=1; safe to assert combinationally.
// ----------------------------------------------------------------------------
always_comb begin
  PSLVERR = 1'b0;
  if (PSEL && PENABLE) begin
    if (PWRITE) begin
      case (PADDR)
        `LCD_LCD_CTRL_ADDR: PSLVERR = 1'b0;  // LCD_CTRL
        `LCD_LCD_STATUS_ADDR: PSLVERR = 1'b0;  // LCD_STATUS
        `LCD_LCD_IRQ_EN_ADDR: PSLVERR = 1'b0;  // LCD_IRQ_EN
        `LCD_LCD_FB0_ADDR_ADDR: PSLVERR = 1'b0;  // LCD_FB0_ADDR
        `LCD_LCD_FB1_ADDR_ADDR: PSLVERR = 1'b0;  // LCD_FB1_ADDR
        `LCD_LCD_STRIDE_ADDR: PSLVERR = 1'b0;  // LCD_STRIDE
        `LCD_LCD_PU_X_ADDR: PSLVERR = 1'b0;  // LCD_PU_X
        `LCD_LCD_PU_Y_ADDR: PSLVERR = 1'b0;  // LCD_PU_Y
        `LCD_LCD_SPI_CFG_ADDR: PSLVERR = 1'b0;  // LCD_SPI_CFG
        `LCD_LCD_TE_CFG_ADDR: PSLVERR = 1'b0;  // LCD_TE_CFG
        `LCD_LCD_RESX_CFG0_ADDR: PSLVERR = 1'b0;  // LCD_RESX_CFG0
        `LCD_LCD_RESX_CFG1_ADDR: PSLVERR = 1'b0;  // LCD_RESX_CFG1
        `LCD_LCD_CMD_FIFO_ADDR: PSLVERR = 1'b0;  // LCD_CMD_FIFO
        `LCD_LCD_FRAME_CTRL_ADDR: PSLVERR = 1'b0;  // LCD_FRAME_CTRL
        default: PSLVERR = 1'b1;  // RO, HW-owned, or undefined address
      endcase
    end else begin
      case (PADDR)
        `LCD_LCD_CTRL_ADDR: PSLVERR = 1'b0;  // LCD_CTRL
        `LCD_LCD_STATUS_ADDR: PSLVERR = 1'b0;  // LCD_STATUS
        `LCD_LCD_IRQ_EN_ADDR: PSLVERR = 1'b0;  // LCD_IRQ_EN
        `LCD_LCD_FB0_ADDR_ADDR: PSLVERR = 1'b0;  // LCD_FB0_ADDR
        `LCD_LCD_FB1_ADDR_ADDR: PSLVERR = 1'b0;  // LCD_FB1_ADDR
        `LCD_LCD_STRIDE_ADDR: PSLVERR = 1'b0;  // LCD_STRIDE
        `LCD_LCD_PU_X_ADDR: PSLVERR = 1'b0;  // LCD_PU_X
        `LCD_LCD_PU_Y_ADDR: PSLVERR = 1'b0;  // LCD_PU_Y
        `LCD_LCD_SPI_CFG_ADDR: PSLVERR = 1'b0;  // LCD_SPI_CFG
        `LCD_LCD_TE_CFG_ADDR: PSLVERR = 1'b0;  // LCD_TE_CFG
        `LCD_LCD_RESX_CFG0_ADDR: PSLVERR = 1'b0;  // LCD_RESX_CFG0
        `LCD_LCD_RESX_CFG1_ADDR: PSLVERR = 1'b0;  // LCD_RESX_CFG1
        `LCD_LCD_CMD_STATUS_ADDR: PSLVERR = 1'b0;  // LCD_CMD_STATUS
        `LCD_LCD_ERR_ADDR_ADDR: PSLVERR = 1'b0;  // LCD_ERR_ADDR
        `LCD_LCD_VERSION_ADDR: PSLVERR = 1'b0;  // LCD_VERSION
        `LCD_LCD_INFO_ADDR: PSLVERR = 1'b0;  // LCD_INFO
        `LCD_LCD_FRAME_CTRL_ADDR: PSLVERR = 1'b0;  // LCD_FRAME_CTRL
        `LCD_LCD_LINEBUF_STATUS_ADDR: PSLVERR = 1'b0;  // LCD_LINEBUF_STATUS
        `LCD_LCD_SLAVE_BUFA_ADDR_ADDR: PSLVERR = 1'b0;  // LCD_SLAVE_BUFA_ADDR
        `LCD_LCD_SLAVE_BUFB_ADDR_ADDR: PSLVERR = 1'b0;  // LCD_SLAVE_BUFB_ADDR
        `LCD_LCD_SLAVE_INFO_ADDR: PSLVERR = 1'b0;  // LCD_SLAVE_INFO
        default: PSLVERR = 1'b1;  // WO, WO_PULSED, or undefined address
      endcase
    end
  end
end

// ----------------------------------------------------------------------------
// PREADY
//   Write     : completes in 1 cycle (combinational)
//   Read      : completes in 2 cycles (pready_rd_r registered, 1 wait state)
//   RC_FIFO_1 : completes in 3 cycles (2 wait states, data valid on cycle 2)
// ----------------------------------------------------------------------------
assign PREADY =
  (PSEL && PENABLE &&  PWRITE) ||
  (PSEL && PENABLE && !PWRITE && pready_rd_r);

// ----------------------------------------------------------------------------
// Output Assignments
// ----------------------------------------------------------------------------
assign lcd_ctrl_lcd_en = lcd_ctrl_lcd_en_r;
assign lcd_ctrl_dma_en = lcd_ctrl_dma_en_r;
assign lcd_ctrl_te_en = lcd_ctrl_te_en_r;
assign lcd_ctrl_cmd_seq_en = lcd_ctrl_cmd_seq_en_r;
assign lcd_ctrl_stream_mode = lcd_ctrl_stream_mode_r;
assign lcd_ctrl_partial_en = lcd_ctrl_partial_en_r;
assign lcd_ctrl_byte_swap = lcd_ctrl_byte_swap_r;
assign lcd_ctrl_fb_sel = lcd_ctrl_fb_sel_r;
assign lcd_ctrl_soft_rst = lcd_ctrl_soft_rst_r;
assign lcd_ctrl_force_cmd = lcd_ctrl_force_cmd_r;
assign lcd_ctrl_dma_src = lcd_ctrl_dma_src_r;
assign lcd_ctrl_auto_buf_sel = lcd_ctrl_auto_buf_sel_r;
assign lcd_status_frame_done = lcd_status_frame_done_r;
assign lcd_status_cmd_done = lcd_status_cmd_done_r;
assign lcd_status_frame_late = lcd_status_frame_late_r;
assign lcd_status_addr_oob = lcd_status_addr_oob_r;
assign lcd_status_stride_err = lcd_status_stride_err_r;
assign lcd_status_axi_err = lcd_status_axi_err_r;
assign lcd_status_fifo_underrun = lcd_status_fifo_underrun_r;
assign lcd_status_te_timeout = lcd_status_te_timeout_r;
assign lcd_status_mode_switch_err = lcd_status_mode_switch_err_r;
assign lcd_irq_en_frame_done_en = lcd_irq_en_frame_done_en_r;
assign lcd_irq_en_cmd_done_en = lcd_irq_en_cmd_done_en_r;
assign lcd_irq_en_frame_late_en = lcd_irq_en_frame_late_en_r;
assign lcd_irq_en_addr_oob_en = lcd_irq_en_addr_oob_en_r;
assign lcd_irq_en_stride_err_en = lcd_irq_en_stride_err_en_r;
assign lcd_irq_en_axi_err_en = lcd_irq_en_axi_err_en_r;
assign lcd_irq_en_fifo_underrun_en = lcd_irq_en_fifo_underrun_en_r;
assign lcd_irq_en_te_timeout_en = lcd_irq_en_te_timeout_en_r;
assign lcd_irq_en_mode_switch_err_en = lcd_irq_en_mode_switch_err_en_r;
assign lcd_irq_en_cmd_half_empty_en = lcd_irq_en_cmd_half_empty_en_r;
assign lcd_fb0_addr_fb0_addr = lcd_fb0_addr_fb0_addr_r;
assign lcd_fb1_addr_fb1_addr = lcd_fb1_addr_fb1_addr_r;
assign lcd_stride_stride = lcd_stride_stride_r;
assign lcd_pu_x_pu_x_start = lcd_pu_x_pu_x_start_r;
assign lcd_pu_x_pu_x_end = lcd_pu_x_pu_x_end_r;
assign lcd_pu_y_pu_y_start = lcd_pu_y_pu_y_start_r;
assign lcd_pu_y_pu_y_end = lcd_pu_y_pu_y_end_r;
assign lcd_spi_cfg_spi_div = lcd_spi_cfg_spi_div_r;
assign lcd_spi_cfg_spi_mode = lcd_spi_cfg_spi_mode_r;
assign lcd_spi_cfg_wire_3 = lcd_spi_cfg_wire_3_r;
assign lcd_spi_cfg_cs_setup = lcd_spi_cfg_cs_setup_r;
assign lcd_spi_cfg_cs_hold = lcd_spi_cfg_cs_hold_r;
assign lcd_te_cfg_te_fps_num = lcd_te_cfg_te_fps_num_r;
assign lcd_te_cfg_te_fps_den = lcd_te_cfg_te_fps_den_r;
assign lcd_te_cfg_te_timeout = lcd_te_cfg_te_timeout_r;
assign lcd_te_cfg_te_pol = lcd_te_cfg_te_pol_r;
assign lcd_resx_cfg0_resx_width = lcd_resx_cfg0_resx_width_r;
assign lcd_resx_cfg1_resx_delay = lcd_resx_cfg1_resx_delay_r;
assign lcd_resx_cfg1_resx_assert = lcd_resx_cfg1_resx_assert_r;
assign lcd_cmd_fifo_cmd_entry = lcd_cmd_fifo_cmd_entry_r;
assign lcd_frame_ctrl_frame_ready = lcd_frame_ctrl_frame_ready_r;
assign lcd_cmd_fifo_cmd_entry_wr = lcd_cmd_fifo_cmd_entry_wr_r;

endmodule

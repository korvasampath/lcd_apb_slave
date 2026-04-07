# LCD_CTRL – Register Map

**Block Prefix:** LCD
**Bus Type:** APB
**Data Width:** 32 bits
**Address Alignment:** 4 bytes
**Version:** 1.0

**Description:** SPI LCD Controller with Integrated DMA Engine - GC9306X primary target

---

## Access Types

| Type | Behaviour |
|------|----------|
| RW | SW read-write, value exposed as output |
| RO | HW-driven, read-only via APB |
| WO | SW write, held data + single-cycle `_wr` strobe |
| WO_PULSED | Combinational pulse (no storage), zero when idle |
| HWC | SW writes 1 to set; HW asserts `_clr` to clear |
| W1C | HW sets via `_set`; SW writes 1 to clear; HW wins on race |
| ACR | HW-driven; read generates handshake `_clr` pulse |
| RC_FIFO_0 | FIFO read-with-pop, 0 wait states (combinatorial data) |
| RC_FIFO_1 | FIFO read-with-pop, 1 wait state (registered data) |

---

## Register Summary

| Register | Offset | Access | Source | Description |
|----------|--------|--------|--------|-------------|
| LCD_CTRL | 0x000 | RW | SW | Master enable. Clears cleanly with SOFT_RST. |
| LCD_STATUS | 0x004 | W1C | SW | Set when complete frame transmitted to display. Write 1 to clear. |
| LCD_IRQ_EN | 0x008 | RW | SW | Enable FRAME_DONE interrupt. |
| LCD_FB0_ADDR | 0x00C | RW | SW | AXI base address of frame buffer 0. Bits[1:0] must be 0. Latched at DMA trigger. |
| LCD_FB1_ADDR | 0x010 | RW | SW | AXI base address of frame buffer 1. Bits[1:0] must be 0. Latched at DMA trigger. |
| LCD_STRIDE | 0x014 | RW | SW | Row stride in bytes. QVGA=480, VGA=1280. Multiple of AXI data width. Latched at DMA trigger. |
| LCD_PU_X | 0x018 | RW | SW | Start column 0-based inclusive. SC value for CASET. Latched at DMA trigger. |
| LCD_PU_Y | 0x01C | RW | SW | Start row 0-based inclusive. SP value for PASET. Latched at DMA trigger. |
| LCD_SPI_CFG | 0x020 | RW | SW | SPI clock divider. SCK = sys_clk / (2*(SPI_DIV+1)). GC9306X target: SPI_DIV=4 @ 100MHz -> 10MHz. |
| LCD_TE_CFG | 0x024 | RW | SW | Bresenham numerator: target FPS (e.g. 24). Divider passes TE_FPS_NUM of every TE_FPS_DEN pulses. |
| LCD_RESX_CFG0 | 0x028 | RW | SW | RESX pulse width in sys_clk cycles. GC9306X requires >= 10us low (1000 cycles @ 100MHz). |
| LCD_RESX_CFG1 | 0x02C | RW | SW | Delay in sys_clk cycles after RESX de-assertion before RESX_DONE is set. GC9306X requires >= 5ms. |
| LCD_CMD_FIFO | 0x030 | WO_PULSED | SW | Word0: LCD command byte to send (DC=0). E.g. 0x2A=CASET, 0x2B=PASET, 0x2C=RAMWR. |
| LCD_CMD_STATUS | 0x034 | RO | HW | Current number of entries in CMD FIFO (0-63). |
| LCD_ERR_ADDR | 0x038 | RO | HW | AXI read address that triggered last DMA fault (ADDR_OOB or AXI_ERR). Debug use. |
| LCD_VERSION | 0x03C | RO | HW | Minor version number. Synthesis parameter IP_VER_MINOR. Default 0x00 for v1.0. |
| LCD_INFO | 0x040 | RO | HW | Max column count from synthesis parameter MAX_COL. Default 240 for QVGA, 640 for VGA. |
| LCD_FRAME_CTRL | 0x044 | RW | SW | Write 1 to trigger a frame. Self-clearing. TE mode: arms trigger, DMA starts on next qualifying TE edge. |
| LCD_LINEBUF_STATUS | 0x048 | RO | HW | Line buffer A is full (DMA fill complete for this row). |
| LCD_SLAVE_BUFA_ADDR | 0x04C | RO | HW | AXI slave Buffer A base address in SoC memory map. Set at integration time via parameter. |
| LCD_SLAVE_BUFB_ADDR | 0x050 | RO | HW | AXI slave Buffer B base address in SoC memory map. = BUFA_ADDR + LINE_BUF_SIZE. |
| LCD_SLAVE_INFO | 0x054 | RO | HW | AXI slave total aperture size in bytes. = 2 * LINE_BUF_SIZE. QVGA: 1024 (0x400), VGA: 4096 (0x1000). |

---

## Register Details

### LCD_CTRL (0x000)

**Description:** Master enable. Clears cleanly with SOFT_RST.

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000800

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| LCD_EN | [0] | RW | No | Master enable. Clears cleanly with SOFT_RST. |
| DMA_EN | [1] | RW | No | Enable DMA engine for autonomous frame fetch from system memory. |
| TE_EN | [2] | RW | No | Enable TE synchronization. Frame trigger waits for TE edge. |
| CMD_SEQ_EN | [3] | RW | No | Enable auto CASET/PASET/RAMWR sequence before pixel burst. |
| STREAM_MODE | [4] | RW | No | CS# stays LOW across frames, CMD skipped after first. Latch-at-trigger. |
| PARTIAL_EN | [5] | RW | No | Enable partial update region (LCD_PU_X/Y). Latched at trigger. |
| BYTE_SWAP | [6] | RW | No | 0=MSB first (GC9306X native), 1=LSB first. Latched at trigger. |
| FB_SEL | [7] | RW | No | Latched at trigger. Select active frame buffer: 0=FB0, 1=FB1. |
| SOFT_RST | [8] | HWC | Yes | Self-clearing. Resets all internal state except RESX output. |
| FORCE_CMD | [9] | HWC | Yes | Self-clearing. Forces immediate CMD FIFO drain, bypassing frame FSM. |
| DMA_SRC | [10] | RW | No | Pixel source: 0=DMA engine (default), 1=AXI slave port. Idle-only change. |
| AUTO_BUF_SEL | [11] | RW | No | AXI slave buffer routing: 1=auto-route to AXI_OWN buffer, 0=explicit AWADDR. Idle-only change. |

### LCD_STATUS (0x004)

**Description:** Set when complete frame transmitted to display. Write 1 to clear.

**Access:** W1C  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000000

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| FRAME_DONE | [0] | W1C | Yes | Set when complete frame transmitted to display. Write 1 to clear. |
| CMD_DONE | [1] | W1C | Yes | Set when CMD FIFO drains completely. Write 1 to clear. |
| FRAME_LATE | [2] | W1C | Yes | Set when new TE edge arrives before current frame completes. Write 1 to clear. |
| ADDR_OOB | [3] | W1C | Yes | Set when DMA address exceeds validated AXI region. Write 1 to clear. |
| STRIDE_ERR | [4] | W1C | Yes | STRIDE too small or not aligned. DMA aborted. Write 1 to clear. |
| AXI_ERR | [5] | W1C | Yes | Set on AXI RRESP != OKAY during DMA burst. ERR_ADDR latched. Write 1 to clear. |
| FIFO_UNDERRUN | [6] | W1C | Yes | TX FIFO emptied mid-row during SPI drain. Critical. Write 1 to clear. |
| TE_TIMEOUT | [7] | W1C | Yes | TE_TIMEOUT period expired with no TE edge. Write 1 to clear. |
| MODE_SWITCH_ERR | [8] | W1C | Yes | SPI_CFG written while SPI_BUSY=1. Write 1 to clear. |
| SPI_BUSY | [9] | RO | Yes | Live: SPI engine is actively clocking data. |
| DMA_BUSY | [10] | RO | Yes | Live: DMA engine is performing AXI read burst. |
| FRAME_ACTIVE | [11] | RO | Yes | Live: Frame transfer in progress (DMA+SPI inclusive). |
| CMD_BUSY | [12] | RO | Yes | Live: Command path is draining CMD FIFO. |
| RESX_ACTIVE | [13] | RO | Yes | Live: RESX pulse or post-reset delay in progress. |

### LCD_IRQ_EN (0x008)

**Description:** Enable FRAME_DONE interrupt.

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000000

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| FRAME_DONE_EN | [0] | RW | No | Enable FRAME_DONE interrupt. |
| CMD_DONE_EN | [1] | RW | No | Enable CMD_DONE interrupt. |
| FRAME_LATE_EN | [2] | RW | No | Enable FRAME_LATE interrupt. |
| ADDR_OOB_EN | [3] | RW | No | Enable ADDR_OOB interrupt. |
| STRIDE_ERR_EN | [4] | RW | No | Enable STRIDE_ERR interrupt. |
| AXI_ERR_EN | [5] | RW | No | Enable AXI_ERR interrupt. |
| FIFO_UNDERRUN_EN | [6] | RW | No | Enable FIFO_UNDERRUN interrupt. |
| TE_TIMEOUT_EN | [7] | RW | No | Enable TE_TIMEOUT interrupt. |
| MODE_SWITCH_ERR_EN | [8] | RW | No | Enable MODE_SWITCH_ERR interrupt. |
| CMD_HALF_EMPTY_EN | [9] | RW | No | Enable IRQ when CMD FIFO drops below half-full. |

### LCD_FB0_ADDR (0x00C)

**Description:** AXI base address of frame buffer 0. Bits[1:0] must be 0. Latched at DMA trigger.

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000000

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| FB0_ADDR | [31:0] | RW | No | AXI base address of frame buffer 0. Bits[1:0] must be 0. Latched at DMA trigger. |

### LCD_FB1_ADDR (0x010)

**Description:** AXI base address of frame buffer 1. Bits[1:0] must be 0. Latched at DMA trigger.

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000000

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| FB1_ADDR | [31:0] | RW | No | AXI base address of frame buffer 1. Bits[1:0] must be 0. Latched at DMA trigger. |

### LCD_STRIDE (0x014)

**Description:** Row stride in bytes. QVGA=480, VGA=1280. Multiple of AXI data width. Latched at DMA trigger.

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000000

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| STRIDE | [15:0] | RW | No | Row stride in bytes. QVGA=480, VGA=1280. Multiple of AXI data width. Latched at DMA trigger. |

### LCD_PU_X (0x018)

**Description:** Start column 0-based inclusive. SC value for CASET. Latched at DMA trigger.

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000000

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| PU_X_START | [15:0] | RW | No | Start column 0-based inclusive. SC value for CASET. Latched at DMA trigger. |
| PU_X_END | [31:16] | RW | No | End column 0-based inclusive. EC value for CASET. Latched at DMA trigger. |

### LCD_PU_Y (0x01C)

**Description:** Start row 0-based inclusive. SP value for PASET. Latched at DMA trigger.

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000000

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| PU_Y_START | [15:0] | RW | No | Start row 0-based inclusive. SP value for PASET. Latched at DMA trigger. |
| PU_Y_END | [31:16] | RW | No | End row 0-based inclusive. EP value for PASET. Latched at DMA trigger. |

### LCD_SPI_CFG (0x020)

**Description:** SPI clock divider. SCK = sys_clk / (2*(SPI_DIV+1)). GC9306X target: SPI_DIV=4 @ 100MHz -> 10MHz.

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x0000F100

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| SPI_DIV | [3:0] | RW | No | SPI clock divider. SCK = sys_clk / (2*(SPI_DIV+1)). GC9306X target: SPI_DIV=4 @ 100MHz -> 10MHz. |
| SPI_MODE | [5:4] | RW | No | SPI clock polarity/phase: 0=Mode0(CPOL=0/CPHA=0), 1=Mode1, 2=Mode2, 3=Mode3. |
| WIRE_3 | [6] | RW | No | 0=4-wire SPI (separate spi_dc pin), 1=3-wire SPI (D/C embedded as 9th bit). |
| CS_SETUP | [11:8] | RW | No | CS# setup cycles between CS# assertion and first SCK edge. Min 3 @ 100MHz (30ns >= GC9306X 20ns). |
| CS_HOLD | [15:12] | RW | No | CS# hold cycles between last SCK edge and CS# de-assertion. Min 5 @ 100MHz (50ns >= GC9306X 40ns). |

### LCD_TE_CFG (0x024)

**Description:** Bresenham numerator: target FPS (e.g. 24). Divider passes TE_FPS_NUM of every TE_FPS_DEN pulses.

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00FF0101

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| TE_FPS_NUM | [7:0] | RW | No | Bresenham numerator: target FPS (e.g. 24). Divider passes TE_FPS_NUM of every TE_FPS_DEN pulses. |
| TE_FPS_DEN | [15:8] | RW | No | Bresenham denominator: display TE rate in Hz (e.g. 60). 0 treated as 1 (divide-by-zero protection). |
| TE_TIMEOUT | [23:16] | RW | No | Timeout in TE periods (10ms units @ 100MHz). 0=disabled. If no TE edge, assert TE_TIMEOUT IRQ. |
| TE_POL | [24] | RW | No | TE input polarity: 0=trigger on rising edge (GC9306X default, V-blank HIGH), 1=falling edge. |

### LCD_RESX_CFG0 (0x028)

**Description:** RESX pulse width in sys_clk cycles. GC9306X requires >= 10us low (1000 cycles @ 100MHz).

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000064

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| RESX_WIDTH | [15:0] | RW | No | RESX pulse width in sys_clk cycles. GC9306X requires >= 10us low (1000 cycles @ 100MHz). |

### LCD_RESX_CFG1 (0x02C)

**Description:** Delay in sys_clk cycles after RESX de-assertion before RESX_DONE is set. GC9306X requires >= 5ms.

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000064

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| RESX_DELAY | [15:0] | RW | No | Delay in sys_clk cycles after RESX de-assertion before RESX_DONE is set. GC9306X requires >= 5ms. |
| RESX_ASSERT | [16] | HWC | Yes | Self-clearing. Write 1 to trigger RESX pulse sequence. Cleared when sequence starts. |

### LCD_CMD_FIFO (0x030)

**Description:** Word0: LCD command byte to send (DC=0). E.g. 0x2A=CASET, 0x2B=PASET, 0x2C=RAMWR.

**Access:** WO_PULSED  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000000

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| CMD_BYTE | [7:0] | WO_PULSED | No | Word0: LCD command byte to send (DC=0). E.g. 0x2A=CASET, 0x2B=PASET, 0x2C=RAMWR. |
| PAYLOAD_LEN | [23:16] | WO_PULSED | No | Word0: Number of payload bytes following (0-255). Word1+ carry payload bytes (DC=1). |

### LCD_CMD_STATUS (0x034)

**Description:** Current number of entries in CMD FIFO (0-63).

**Access:** RO  
**Source:** HW  
**Volatile:** Yes  
**Reset Value:** N/A (hardware-driven)

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| CMD_FIFO_LEVEL | [5:0] | RO | Yes | Current number of entries in CMD FIFO (0-63). |
| CMD_FIFO_FULL | [6] | RO | Yes | Asserted when CMD FIFO contains 64 entries. |
| CMD_FIFO_EMPTY | [7] | RO | Yes | Asserted when CMD FIFO is empty. |
| CMD_FIFO_HALF_EMPTY | [8] | RO | Yes | Asserted when CMD FIFO level < 32. Use with CMD_HALF_EMPTY_EN for IRQ-driven write. |

### LCD_ERR_ADDR (0x038)

**Description:** AXI read address that triggered last DMA fault (ADDR_OOB or AXI_ERR). Debug use.

**Access:** RO  
**Source:** HW  
**Volatile:** Yes  
**Reset Value:** N/A (hardware-driven)

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| ERR_ADDR | [31:0] | RO | Yes | AXI read address that triggered last DMA fault (ADDR_OOB or AXI_ERR). Debug use. |

### LCD_VERSION (0x03C)

**Description:** Minor version number. Synthesis parameter IP_VER_MINOR. Default 0x00 for v1.0.

**Access:** RO  
**Source:** HW  
**Volatile:** Yes  
**Reset Value:** N/A (hardware-driven)

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| IP_VER_MINOR | [7:0] | RO | Yes | Minor version number. Synthesis parameter IP_VER_MINOR. Default 0x00 for v1.0. |
| IP_VER_MAJOR | [15:8] | RO | Yes | Major version number. Synthesis parameter IP_VER_MAJOR. Default 0x01 for v1.x. |
| IP_ID | [31:16] | RO | Yes | IP identifier constant. Synthesis parameter IP_ID. Default 0xAC1D for silicon ID. |

### LCD_INFO (0x040)

**Description:** Max column count from synthesis parameter MAX_COL. Default 240 for QVGA, 640 for VGA.

**Access:** RO  
**Source:** HW  
**Volatile:** Yes  
**Reset Value:** N/A (hardware-driven)

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| MAX_COL | [11:0] | RO | Yes | Max column count from synthesis parameter MAX_COL. Default 240 for QVGA, 640 for VGA. |
| MAX_ROW | [23:12] | RO | Yes | Max row count from synthesis parameter MAX_ROW. Default 320 for QVGA, 480 for VGA. |

### LCD_FRAME_CTRL (0x044)

**Description:** Write 1 to trigger a frame. Self-clearing. TE mode: arms trigger, DMA starts on next qualifying TE edge.

**Access:** RW  
**Source:** SW  
**Volatile:** No  
**Reset Value:** 0x00000000

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| FRAME_READY | [0] | HWC | Yes | Write 1 to trigger a frame. Self-clearing. TE mode: arms trigger, DMA starts on next qualifying TE edge. |
| FRAME_COUNT | [15:8] | RO | Yes | Rolling 8-bit frame counter. Incremented on each FRAME_DONE. Wraps 255->0. Frame-rate measurement. |

### LCD_LINEBUF_STATUS (0x048)

**Description:** Line buffer A is full (DMA fill complete for this row).

**Access:** RO  
**Source:** HW  
**Volatile:** Yes  
**Reset Value:** N/A (hardware-driven)

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| BUF_A_FULL | [0] | RO | Yes | Line buffer A is full (DMA fill complete for this row). |
| BUF_B_FULL | [1] | RO | Yes | Line buffer B is full. |
| BUF_A_EMPTY | [2] | RO | Yes | Line buffer A is empty (SPI drain complete). |
| BUF_B_EMPTY | [3] | RO | Yes | Line buffer B is empty. |
| ACTIVE_WR_BUF | [4] | RO | Yes | Current DMA write target: 0=Buffer A, 1=Buffer B. |
| ACTIVE_RD_BUF | [5] | RO | Yes | Current SPI read source: 0=Buffer A, 1=Buffer B. |

### LCD_SLAVE_BUFA_ADDR (0x04C)

**Description:** AXI slave Buffer A base address in SoC memory map. Set at integration time via parameter.

**Access:** RO  
**Source:** HW  
**Volatile:** Yes  
**Reset Value:** N/A (hardware-driven)

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| BUFA_ADDR | [31:0] | RO | Yes | AXI slave Buffer A base address in SoC memory map. Set at integration time via parameter. |

### LCD_SLAVE_BUFB_ADDR (0x050)

**Description:** AXI slave Buffer B base address in SoC memory map. = BUFA_ADDR + LINE_BUF_SIZE.

**Access:** RO  
**Source:** HW  
**Volatile:** Yes  
**Reset Value:** N/A (hardware-driven)

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| BUFB_ADDR | [31:0] | RO | Yes | AXI slave Buffer B base address in SoC memory map. = BUFA_ADDR + LINE_BUF_SIZE. |

### LCD_SLAVE_INFO (0x054)

**Description:** AXI slave total aperture size in bytes. = 2 * LINE_BUF_SIZE. QVGA: 1024 (0x400), VGA: 4096 (0x1000).

**Access:** RO  
**Source:** HW  
**Volatile:** Yes  
**Reset Value:** N/A (hardware-driven)

#### Fields

| Field | Bits | Access | HW Write | Description |
|-------|------|--------|----------|-------------|
| APERTURE_SIZE | [31:0] | RO | Yes | AXI slave total aperture size in bytes. = 2 * LINE_BUF_SIZE. QVGA: 1024 (0x400), VGA: 4096 (0x1000). |


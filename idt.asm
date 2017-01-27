idt_begin:
;Interrupt 0 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 1 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 2 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 3 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 4 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 5 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 6 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 7 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 8 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 9 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 10 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 11 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 12 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 13 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 14 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 15 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 16 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 17 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 18 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 19 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 20 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 21 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 22 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 23 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 24 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 25 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 26 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 27 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 28 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 29 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 30 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;Interrupt 31 (Exception)
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;IRQ 0 - Timer
            dw  isr           ; Offset(0..15) wird später eingetragen
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;IRQ 1 - Keyboard
            dw  0			; Offset(0..15) wird später eingetragen
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;IRQ 2
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;IRQ 3
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;IRQ 4
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;IRQ 5
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)

;IRQ 6 - Floppy
            dw  isr           ; Offset(0..15) wird später eingetragen
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)
;IRQ 7
            dw  isr         ; Offset(0..15)
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)
;IRQ 8 - Clock
            dw  isr           ; Offset(0..15) wird später eingetragen
            dw  0x8         ; Segment Selector
            db  0
            db  10001110b   ; P DPL(2) S=0 Type(4)
            dw  1           ; Offset(16..31)
idt_end:

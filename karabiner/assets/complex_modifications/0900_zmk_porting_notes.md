# ZMK SOA39 -> Karabiner Porting Notes (Phase 1)

Implemented:
- default / NUM / MOUSE / MOVE layer key mappings (using layer-1/2/3 variables)
- primary Mod-Tap and Layer-Tap behavior approximations
- combo `m1` (F11 with right_option+right_shift)
- combo `m2` (F12 with right_option+right_shift)
- combo `tab_alt` approximation (e + japanese_eisuu => left_option + layer-3)

Deferred / Not fully reproducible in Karabiner:
- ZMK Bluetooth layer actions: `&bt BT_SEL`, `&bt BT_CLR`, `&bt BT_CLR_ALL`
- `&bootloader`
- `ws2812_wdg`
- tap-dance exact behavior (`tp_msc_up_left`, `tp_msc_down_right`)
  - Current Karabiner mapping uses single-direction wheel scroll approximation
- SCROLL layer (`&mo 5`) detailed behavior

Timing defaults:
- Karabiner global hold/tap thresholds remain in `karabiner.json` (170ms)
- ZMK per-behavior timing is approximated; adjust Karabiner parameters if hold/tap misfires occur

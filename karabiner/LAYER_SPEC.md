# Karabiner レイヤー仕様書

## レイヤートリガー
- **Space**: Layer-1をアクティベート（単体押しでスペース）
- **英数 (japanese_eisuu)**: Layer-2をアクティベート（単体押しで英数）

## Layer-0 (Default)

### 長押し機能（レイヤー非アクティブ時のみ）
- **Q**: 長押し→Left Alt、短押し→Q
- **A**: 長押し→Right Command、短押し→A
- **Z**: 長押し→Left Shift、短押し→Z
- **S**: 長押し→Left Command、短押し→S

### Apple内蔵キーボード専用
- **Left Control** → Right Command
- **Left Command** → Left Option
- **Left Option** → Left Control

### 全キーボード共通

## Layer-1 (Numbers & Symbols)
**トリガー**: Space長押し

| キー | 機能 |
|------|------|
| Q | Home |
| W | ↑ |
| E | End |
| T | [ |
| Y | ] |
| U | 7 |
| I | 8 |
| O | 9 |
| P | 0 |
| A | ← |
| S | ↓ |
| D | → |
| F | = |
| G | { |
| H | } |
| J | 4 |
| K | 5 |
| L | 6 |
| ; | - |
| N | ' |
| M | 1 |
| , | 2 |
| . | 3 |
| / | ` |

## Layer-2 (Mouse & Navigation)
**トリガー**: 英数長押し

| キー | 機能 |
|------|------|
| Q | Left Command |
| W | 水平スクロール左 |
| E | 垂直スクロール下 |
| R | 水平スクロール右 |
| T | マウス進む(Button5) |
| Y | Home |
| U | Page Down |
| I | Page Up |
| O | End |
| P | Insert |
| A | Left Option |
| S | Left Shift |
| D | 垂直スクロール上 |
| F | 左クリック(Button1) |
| G | 右クリック(Button3) |
| H | ← |
| J | ↓ |
| K | ↑ |
| L | → |
| Z | Left Control |
| X | Backspace |
| C | Delete |
| V | 中クリック(Button2) |
| B | マウス戻る(Button4) |
| N | Enter |
| M | Space |
| , | Backspace |
| . | Delete |
| / | Caps Lock |

## 特殊設定

### Parallels対応（RDP & Input Switching）
Parallelsアプリ使用時のみ：
- Left Command ↔ Left Control入れ替え
- Right Command ↔ Right Control入れ替え
- Right Control + Q → Alt + F4

### G600マウス設定
G600マウス（vendor_id: 1133, product_id: 49738）使用時：
- Keypad 1 → Home
- Keypad 2 → ↑
- Keypad 3 → End
- Keypad 4 → ←
- Keypad 5 → ↓
- Keypad 6 → →
- Keypad 9 → Option + ←（単語移動）
- Keypad 0 → Cmd + Shift + S

この仕様書を基に、今後の変更指示を行ってください。
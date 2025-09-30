# Karabiner レイヤー仕様書
*Vialベースの設計思想を取り入れた長押し修飾キー + レイヤーシステム*

## 設計コンセプト
### 長押し修飾キー（タップホールド機能）
- **効率性**: 手の移動を最小限に抑えた修飾キー配置
- **エルゴノミクス**: 左右の手でバランスよく修飾キーを分散
- **学習性**: 直感的で覚えやすいキー配置
- **タイミング設定**:
  - 長押し判定: 220ms以上
  - 単独押し判定: 170ms以内
  - 遅延アクション: 50ms

### レイヤーシステム
- **Layer-0**: ベース + 長押し修飾キー
- **Layer-1**: 数字・記号（テンキー風配列）
- **Layer-2**: マウス・ナビゲーション（Vim風 + マウス制御）
- **Layer-3**: カーソル制御（WASD配置）

## レイヤートリガー
- **Space**: Layer-1をアクティベート（単体押しでスペース）
- **英数 (japanese_eisuu)**: Layer-2をアクティベート（単体押しで英数）
- **無変換 (japanese_kana)**: Layer-3をアクティベート（単体押しで無変換）

## Layer-0 (Default)

| キー | 機能 | 説明 |
|------|------|------|
| **上段** |||
| Q | 長押し→Left Alt、短押し→Q | 長押し修飾キー |
| W | △ | 透過 |
| E | △ | 透過 |
| R | 長押し→Left Alt、短押し→R | 長押し修飾キー |
| T | △ | 透過 |
| Y | △ | 透過 |
| U | △ | 透過 |
| I | △ | 透過 |
| O | △ | 透過 |
| P | △ | 透過 |
| **中段（ホーム行）** |||
| A | 長押し→Right Command、短押し→A | 長押し修飾キー |
| S | 長押し→Left Control、短押し→S | 長押し修飾キー |
| D | △ | 透過 |
| F | 長押し→Right Command、短押し→F | 長押し修飾キー |
| G | 長押し→Left Control、短押し→G | 長押し修飾キー |
| H | △ | 透過 |
| J | △ | 透過 |
| K | △ | 透過 |
| L | △ | 透過 |
| ; | △ | 透過 |
| **下段** |||
| Z | 長押し→Left Shift、短押し→Z | 長押し修飾キー |
| X | △ | 透過 |
| C | △ | 透過 |
| V | 長押し→Left Shift、短押し→V | 長押し修飾キー |
| B | △ | 透過 |
| N | △ | 透過 |
| M | △ | 透過 |
| , | △ | 透過 |
| . | △ | 透過 |
| / | △ | 透過 |

### デバイス別設定

#### Apple内蔵キーボード専用
- **識別**: is_built_in_keyboard: true
- **Left Control** → Right Command
- **Left Command** → Left Option
- **Left Option** → Left Control

#### HHKB (Happy Hacking Keyboard)
- **識別**: vendor_id: 1278, product_id: 34
- **Left Control** → Right Command
- **Left Command** → Left Control
- **japanese_pc_nfer（無変換）** → japanese_eisuu
- **japanese_pc_xfer（変換）** → japanese_kana

#### ThinkPad Keyboard
- **識別**: vendor_id: 6127, product_id: 24801
- **Caps Lock** → Right Command
- **Left Control** → Caps Lock
- **Left Command** → Left Control
- **japanese_pc_nfer（無変換）** → japanese_eisuu
- **japanese_pc_xfer（変換）** → japanese_kana

### 全キーボード共通

## Layer-1 (Numbers & Symbols)
**トリガー**: Space長押し

| キー | 機能 | 説明 |
|------|------|------|
| **上段** |||
| Q | 長押し→Left Alt、短押し→` | バッククォート |
| W | 7 | 数字7 |
| E | 8 | 数字8 |
| R | 長押し→Left Alt、短押し→9 | 数字9 |
| T | ' | シングルクォート |
| Y | F1 | ファンクションキー |
| U | F2 | ファンクションキー |
| I | F3 | ファンクションキー |
| O | F4 | ファンクションキー |
| P | F5 | ファンクションキー |
| **中段（ホーム行）** |||
| A | 長押し→Right Command、短押し→- | ハイフン・マイナス |
| S | 長押し→Left Control、短押し→4 | 数字4 |
| D | 5 | 数字5 |
| F | 長押し→Right Command、短押し→6 | 数字6 |
| G | 長押し→Left Control、短押し→. | ピリオド |
| H | F6 | ファンクションキー |
| J | F7 | ファンクションキー |
| K | F8 | ファンクションキー |
| L | F9 | ファンクションキー |
| ; | F10 | ファンクションキー |
| **下段** |||
| Z | 長押し→Left Shift、短押し→= | イコール |
| X | 1 | 数字1 |
| C | 2 | 数字2 |
| V | 長押し→Left Shift、短押し→3 | 数字3 |
| B | 0 | 数字0 |
| N | F11 | ファンクションキー |
| M | F12 | ファンクションキー |
| , | [ | 開き角括弧 |
| . | ] | 閉じ角括弧 |
| / | \ | バックスラッシュ |

## Layer-2 (Mouse & Navigation)
**トリガー**: 英数長押し

| キー | 機能 | 説明 |
|------|------|------|
| **上段** |||
| Q | 長押し→Left Alt、短押し→Escape | Escapeキー |
| W | 水平スクロール左 | マウス横スクロール |
| E | 垂直スクロール上 | マウス縦スクロール |
| R | 水平スクロール右 | マウス横スクロール |
| T | マウス進む(Button5) | ブラウザ進む |
| Y | Home | 行頭移動 |
| U | Page Down | ページダウン |
| I | Page Up | ページアップ |
| O | End | 行末移動 |
| P | Print Screen | スクリーンショット |
| **中段（ホーム行）** |||
| A | 長押し→Right Command、短押し→- | ハイフン |
| S | 長押し→Left Control、短押し→Enter | 改行・決定 |
| D | 垂直スクロール下 | マウス縦スクロール |
| F | 左クリック(Button1) | マウス左クリック |
| G | 中クリック(Button3) | マウス中クリック |
| H | ← | 左矢印（Vim風） |
| J | ↓ | 下矢印（Vim風） |
| K | ↑ | 上矢印（Vim風） |
| L | → | 右矢印（Vim風） |
| ; | △ | 下位レイヤー透過 |
| **下段** |||
| Z | 長押し→Left Shift、短押し→\ | バックスラッシュ |
| X | Backspace | 後退削除 |
| C | Delete | 前進削除 |
| V | 右クリック(Button2) | マウス右クリック |
| B | マウス戻る(Button4) | ブラウザ戻る |
| N | F17 | ファンクションキー |
| M | F16 | ファンクションキー |
| , | F18 | ファンクションキー |
| . | F19 | ファンクションキー |
| / | Caps Lock | 大文字ロック |

## Layer-3 (Cursor Control)
**トリガー**: 無変換 (japanese_kana) 長押し

| キー | 機能 | 説明 |
|------|------|------|
| **上段** |||
| Q | △ | 透過 |
| W | ↑ | 上矢印 |
| E | △ | 透過 |
| R | △ | 透過 |
| T | △ | 透過 |
| Y | △ | 透過 |
| U | △ | 透過 |
| I | △ | 透過 |
| O | △ | 透過 |
| P | △ | 透過 |
| **中段（ホーム行）** |||
| A | ← | 左矢印 |
| S | ↓ | 下矢印 |
| D | → | 右矢印 |
| F | △ | 透過 |
| G | △ | 透過 |
| H | △ | 透過 |
| J | △ | 透過 |
| K | △ | 透過 |
| L | △ | 透過 |
| ; | △ | 下位レイヤー透過 |
| **下段** |||
| Z | △ | 透過 |
| X | △ | 透過 |
| C | △ | 透過 |
| V | △ | 透過 |
| B | △ | 透過 |
| N | △ | 透過 |
| M | △ | 透過 |
| , | △ | 透過 |
| . | △ | 透過 |
| / | △ | 透過 |

## 特殊設定

### Parallels対応（RDP & Input Switching）
Parallelsアプリ使用時のみ：
- Left Command ↔ Left Control入れ替え
- Right Command ↔ Right Control入れ替え
- Right Control + Q → Alt + F4

#### 長押し修飾キーの入れ替え（RDP使用時）
Parallelsアプリ使用時、長押し修飾キーのCommand/Controlを入れ替え：
- A長押し → Right Control（通常時：Right Command）
- S長押し → Left Command（通常時：Left Control）
- F長押し → Right Control（通常時：Right Command）
- G長押し → Left Command（通常時：Left Control）

### G600マウス設定（レイヤー毎）
G600マウス（vendor_id: 1133, product_id: 49738）のテンキーボタンをVialでレイヤー毎にリマップ：

#### Layer-0（ベースレイヤー）
| キー | 機能 | 説明 |
|------|------|------|
| button9 | △ | 透過 |
| button10 | △ | 透過 |
| button11 | △ | 透過 |
| button12 | △ | 透過 |
| button13 | △ | 透過 |
| button14 | △ | 透過 |
| button15 | △ | 透過 |
| button16 | △ | 透過 |
| button17 | △ | 透過 |
| button18 | Right Control + Print Screen | 右Control+スクリーンショット |
| button19 | △ | 透過 |
| button20 | △ | 透過 |
| button1 | △ | 透過 |
| button2 | △ | 透過 |
| button3 | △ | 透過 |
| button4 | △ | 透過 |
| button5 | △ | 透過 |
| button6 | MO(1) | Layer-1切り替え |
| button7 | △ | 透過 |
| button8 | △ | 透過 |
| 上スクロール | △ | 透過 |
| 下スクロール | △ | 透過 |

#### Layer-1（数字・記号レイヤー）
| キー | 機能 | 説明 |
|------|------|------|
| button9 | Home | 行頭移動 |
| button10 | △ | 透過 |
| button11 | Left Shift | 左シフトキー |
| button12 | End | 行末移動 |
| button13 | △ | 透過 |
| button14 | △ | 透過 |
| button15 | △ | 透過 |
| button16 | △ | 透過 |
| button17 | △ | 透過 |
| button18 | △ | 透過 |
| button19 | △ | 透過 |
| button20 | △ | 透過 |
| button1 | △ | 透過 |
| button2 | △ | 透過 |
| button3 | △ | 透過 |
| button4 | △ | 透過 |
| button5 | △ | 透過 |
| button6 | △ | 透過 |
| button7 | △ | 透過 |
| button8 | △ | 透過 |
| 上スクロール | ↑ | 上矢印 |
| 下スクロール | ↓ | 下矢印 |

#### Layer-2（マウス・ナビゲーションレイヤー）
| キー | 機能 | 説明 |
|------|------|------|
| button9 | △ | 透過 |
| button10 | △ | 透過 |
| button11 | △ | 透過 |
| button12 | △ | 透過 |
| button13 | △ | 透過 |
| button14 | △ | 透過 |
| button15 | △ | 透過 |
| button16 | △ | 透過 |
| button17 | △ | 透過 |
| button18 | △ | 透過 |
| button19 | △ | 透過 |
| button20 | △ | 透過 |
| button1 | △ | 透過 |
| button2 | △ | 透過 |
| button3 | △ | 透過 |
| button4 | △ | 透過 |
| button5 | △ | 透過 |
| button6 | △ | 透過 |
| button7 | △ | 透過 |
| button8 | △ | 透過 |
| 上スクロール | △ | 透過 |
| 下スクロール | △ | 透過 |

#### Layer-3（カーソル制御レイヤー）
| キー | 機能 | 説明 |
|------|------|------|
| button9 | △ | 透過 |
| button10 | △ | 透過 |
| button11 | △ | 透過 |
| button12 | △ | 透過 |
| button13 | △ | 透過 |
| button14 | △ | 透過 |
| button15 | △ | 透過 |
| button16 | △ | 透過 |
| button17 | △ | 透過 |
| button18 | △ | 透過 |
| button19 | △ | 透過 |
| button20 | △ | 透過 |
| button1 | △ | 透過 |
| button2 | △ | 透過 |
| button3 | △ | 透過 |
| button4 | △ | 透過 |
| button5 | △ | 透過 |
| button6 | △ | 透過 |
| button7 | △ | 透過 |
| button8 | △ | 透過 |
| 上スクロール | △ | 透過 |
| 下スクロール | △ | 透過 |

## 使用上の注意

### 長押し修飾キーのコツ
1. **短いタップ**: 通常のキー入力（Q, R, A, S, F, G, V, Z）
2. **長押し**: 修飾キーとして機能（200ms以上の長押し）
3. **修飾キー透過**: レイヤー内でも既存の修飾キーが動作

### 学習の段階
1. **第1段階**: Layer-0の長押し修飾キーに慣れる
2. **第2段階**: Layer-1のテンキー配列をマスター
3. **第3段階**: Layer-2のマウス・ナビゲーション機能を活用
4. **第4段階**: Layer-3のカーソル制御機能を活用

## 今後の拡張予定

### Layer-3の拡張
- **カーソル制御拡張**: Page Up/Down、Home/End
- **ウィンドウ管理**: デスクトップ切り替え、ウィンドウ移動
- **システム機能**: スクリーンショット、通知センター

### 機能改良
- **マクロ機能**: よく使う文字列の自動入力
- **コンボキー**: 複数キー同時押しでの特殊機能
- **タップダンス**: 同じキーの連続タップで異なる機能

この仕様書を基に、段階的にKarabiner設定を実装・改良していきます。
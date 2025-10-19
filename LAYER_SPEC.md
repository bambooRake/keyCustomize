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

#### Windowsでの修飾・レイヤートリガーの読み替え
- 本仕様の修飾キー表記は macOS 前提。Windows では次の読み替えを適用：
  - Control → Win（Windows キー）
  - Command → Control
  - 英数（EISUU）→ Windows の OEM 固有キー（VK_OEM_PA1）
  - かな（KANA）→ Windows の OEM 固有キー（VK_OEM_PA1）
- 例: 「Right Command」は Windows では「Right Control」、「Left Control」は Windows では「Left Win」。
- Kanata（Windows）のキー名例: Win は `lmet/rmet`、Control は `lctl/rctl`。
- 英数/かなは環境により OEM 固有キーとして報告されるため、Kanata では `deflocalkeys-win` でスキャンコードを定義して使用します。
  - 参考（スクリーンショットより）:
    - 英数: Virtual-Key `VK_OEM_PA1 (0xEB)`, ScanCode `0x7B` → 10進 `123`
    - かな: Virtual-Key `VK_OEM_PA1 (0xFF/0xEB)`, ScanCode `0x79` → 10進 `121`
  - Kanata 設定例:
    - `(deflocalkeys-win  eisuu 123  kana 121)`
    - エイリアス: `(tap-hold 170 220 eisuu (layer-while-held L2))` / `(tap-hold 170 220 kana (layer-while-held L3))`

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

[... omitted 88 of 344 lines ...]

- F長押し → Right Control（通常時：Right Command）
- G長押し → Left Command（通常時：Left Control）

### G600マウス設定（レイヤー毎）
G600マウス（vendor_id: 1133, product_id: 49738）のテンキーボタンをVialでレイヤー毎にリマップ：

#### Layer-0（ベースレイヤー）
| キー | 機能 | 説明 |
|------|------|------|
| f9 | △ | 透過 |
| f10 | △ | 透過 |
| f11 | △ | 透過 |
| f12 | △ | 透過 |
| f13 | △ | 透過 |
| f14 | △ | 透過 |
| f15 | △ | 透過 |
| f16 | △ | 透過 |
| f17 | △ | 透過 |
| f18 | Right Control + Print Screen | 右Control+スクリーンショット |
| f19 | △ | 透過 |
| f20 | △ | 透過 |
| f6 | MO(1) | Layer-1切り替え |
| button1 | △ | 透過 |
| button2 | △ | 透過 |
| button3 | △ | 透過 |
| button7 | △ | 透過 |
| button8 | △ | 透過 |
| 上スクロール | △ | 透過 |
| 下スクロール | △ | 透過 |

#### Layer-1（数字・記号レイヤー）
| キー | 機能 | 説明 |
|------|------|------|
| f9 | Home | 行頭移動 |
| f10 | △ | 透過 |
| f11 | Left Shift | 左シフトキー |
| f12 | End | 行末移動 |
| f13 | △ | 透過 |
| f14 | △ | 透過 |
| f15 | △ | 透過 |
| f16 | △ | 透過 |
| f17 | △ | 透過 |
| f18 | △ | 透過 |
| f19 | △ | 透過 |
| f20 | △ | 透過 |
| f6 | △ | 透過 |
| button1 | ← | 左矢印 |
| button2 | → | 右矢印 |
| button3 | △ | 透過 |
| button7 | △ | 透過 |
| button8 | △ | 透過 |
| 上スクロール | ↑ | 上矢印 |
| 下スクロール | ↓ | 下矢印 |

#### Layer-2（マウス・ナビゲーションレイヤー）
| キー | 機能 | 説明 |
|------|------|------|
| f9 | △ | 透過 |
| f10 | △ | 透過 |
| f11 | △ | 透過 |
| f12 | △ | 透過 |
| f13 | △ | 透過 |
| f14 | △ | 透過 |
| f15 | △ | 透過 |
| f16 | △ | 透過 |
| f17 | △ | 透過 |
| f18 | △ | 透過 |
| f19 | △ | 透過 |
| f20 | △ | 透過 |
| f6 | △ | 透過 |
| button1 | △ | 透過 |
| button2 | △ | 透過 |
| button3 | △ | 透過 |
| button7 | △ | 透過 |
| button8 | △ | 透過 |
| 上スクロール | △ | 透過 |
| 下スクロール | △ | 透過 |

#### Layer-3（カーソル制御レイヤー）
| キー | 機能 | 説明 |
|------|------|------|
| f9 | △ | 透過 |
| f10 | △ | 透過 |
| f11 | △ | 透過 |
| f12 | △ | 透過 |
| f13 | △ | 透過 |
| f14 | △ | 透過 |
| f15 | △ | 透過 |
| f16 | △ | 透過 |
| f17 | △ | 透過 |
| f18 | △ | 透過 |
| f19 | △ | 透過 |
| f20 | △ | 透過 |
| f6 | △ | 透過 |
| button1 | △ | 透過 |
| button2 | △ | 透過 |
| button3 | △ | 透過 |
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

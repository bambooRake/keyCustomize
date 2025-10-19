Kanata setup (Windows)

- Config path in repo: `kanata/config.kbd`
- Example run: `kanata --check -c kanata/config.kbd` then `kanata -c kanata/config.kbd`

Symlink example (PowerShell)
- Create parent dir if needed: `New-Item -ItemType Directory -Force -Path "$HOME\kanata"`
- Link: `New-Item -ItemType SymbolicLink -Path "$HOME\kanata\config.kbd" -Target "$(Resolve-Path kanata\config.kbd)" -Force`
- Run with default search path: `kanata` (it searches `%APPDATA%\kanata\kanata.kbd` and CWD `kanata.kbd`). Adjust if linking elsewhere.

What's implemented
- Home-row tap/hold mods (tap=文字, hold=修飾)
  - Windows読み替え適用: Q/R→Alt, A/F→Ctrl, S/G→Win, Z/V→Shift
- Layer-1: 数字・記号（テンキー風）
- Layer-2: マウス/ナビ（Vim風HJKLで矢印、F=左クリック、G=中クリック、V=右クリック、T/Bで進む/戻る、Y/U/I/OでHome/PgDn/PgUp/End、X/CでBackspace/Delete）
- Layer-3: カーソル（WASDで矢印、Y/U/I/OでHome/PgDn/PgUp/End）
- Space tap/hold: tap=Space, hold=Layer-1 (numbers/symbols)
- Layer-1: テンキー風の主要キー（1–0, -, =, [], など）
- Layer-2/3: ひな形（透過）。必要に応じて割り当てを追加してください。

Customize triggers for Layer-2/3
- Windowsの英数/かな（OEM固有）
  - 本リポの設定では `deflocalkeys-win` で `eisuu=123`, `kana=121` を定義（スクショ: VK_OEM_PA1, ScanCode 0x7B/0x79）。
  - もし環境で数値が異なる場合は `kanata/config.kbd` の `deflocalkeys-win` を修正してください。
  - 既に `L2_TRIG`（英数）/`L3_TRIG`（かな） はこのキーで有効化済みです。

Notes
- `deflayermap` + `process-unmapped-keys yes` を採用。必要なら `defsrc` を定義してください。
- Tap/Hold パラメータは仕様どおり: `tap-repress=170ms`, `hold=220ms`。
- バックスラッシュは環境依存で扱いが難しいため一旦 `/` のまま。必要に応じて差し替えてください。
Interception (wintercept) でRDP対応
- 目的: RDP先へ入力を伝搬しやすくするため、カーネルドライバ経由に切替。
- 手順概要:
  1) ドライバ導入（管理者/再起動要）
     - 取得: https://github.com/oblitum/Interception/releases （zip内の `install-interception.exe`）
     - 管理者PowerShell/コマンドで: `install-interception.exe /install`
     - 再起動
  2) Kanata wintercept 版EXE取得
     - https://github.com/jtroo/kanata/releases/tag/v1.9.0 から `kanata_wintercept.exe` を `kanata/bin/` に配置
  3) 動作確認（コード確認が必要なら）
     - `kanata_wintercept.exe --trace -c kanata/debug-listener.kbd`
     - 英数/かな/無変換/変換などを押して `code:(XXXX)` を確認
     - 必要なら `deflocalkeys-wintercept` に反映
  4) 本運用
     - `kanata_wintercept.exe -c kanata/config.kbd`

備考
- 競合回避: 他のリマッパ（AutoHotkey等）のキーボードフックは停止を推奨
- アンインストール: `install-interception.exe /uninstall`（管理者/再起動）
- `deflocalkeys-wintercept` は現在空。必要になったら `--trace` で取得した数値を入れてください。

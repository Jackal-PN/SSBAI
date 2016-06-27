# SSBAI
スマブラ64のAIを書くためのスクリプトです。


### 起動に必要なもの
Lua拡張したMupen64rerecording
- ビルド済みのものは[こちら](https://code.google.com/archive/p/mupen64-rr/downloads)からDLできます。
- ソースは[こちら](https://github.com/anta-/mupen64-rr-lua-)から。


### 実行手順に関して
- 1.MupenLuaを起動しスマブラのロムをロード。
- 2.対戦モードで1P,2Pキャラクターを選択後、ステージをプププランドにして対戦を開始する。
- 3.Lua ScriptのNew Instance...を選択しコンソールウィンドウを開く。
- 4.Browse...からmain.luaを選択（main.luaと同じディレクトリにインクルードするすべてのファイルを置いておく）
- 5.Run。

以上の手順でスクリプトが動くようになります。

### ショートカットキー等に関して
最初はmain.luaをメモ帳等で開きながら自分が使いやすいように編集してください。
スクリプト起動中でも上書き保存後コンソールウィンドウでRestartするだけで変更を適用させる事ができます。



MupenLua独自の関数につきましては[こちらを参考にしてください](https://code.google.com/archive/p/mupen64-rr/wikis/EmuLua.wiki)。

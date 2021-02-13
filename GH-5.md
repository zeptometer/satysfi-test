# GH-5: test run tool
* SATySFi で satysfi-test のテストを実行するにあたって面倒な部分を吸収したい
    - テスト用のコマンドオプションを与える
    - テスト結果をとってくる(外部ファイルへの出力ができない)
    - テスト失敗時にexit code 1にする
* テストランツールをsatysfi-testのopam packageに含めたい
    - opamならできるだろうけど……どうやって？
    - Satyrographosのテストにはどうやって組込む?
        + sandbox(よくわかってない)を気にする必要はある?
            * ホストOSと同じ
            * ネットワークがない
            * ビルドディレクトリへのアクセスしかない
        + opamに必要な外部依存が全部書いてあることが必要
            * OCaml / shellscript で書くのが一番楽
        + 機械可読な出力ができると嬉しいよね
            * Test Anything Protocol
    - Satyrographos test サブコマンド
        + Satyristesにテスト用のコマンドを書く感じになりそう
* その他
    - ScalaTestも参考になるかも
    - text mode で本当にいい? (GH-6)
        + font selection schemeのロジックとか
        + crossref絡みのロジックとか ← text modeでも使えるかも
        + document modeだとどうやってテストレポートを出力する?
        + cross-ref から読み出すのがありかなあ(satysfi-aux は json)
    - visual regression testを組込みたい
        + pdf level
        + OCaml sandbox内で実行できると嬉しい
        + (野望) こういう機能があるとできそう
            - toPdf: document -> pdf
            - comparePdf: pdf -> pdf -> pdf option
            - writePdf: path -> pdf -> unit
            - pdfToGraphics: pdf -> graphics
            - contextにドキュメント作成に必要な可変参照を全部入れられるようにすると、documentを複数作成する場合に可変参照がリセットされない問題を簡単に回避できそう
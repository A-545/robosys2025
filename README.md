# taxコマンド
![test](https://github.com/A-545/robosys2025/actions/workflows/test.yml/badge.svg)

## 概要
`tax` は標準入力から受け取った数値に、**税率10%** を加算して小数点以下切り捨てで出力するコマンドです。

次のような入力は無効とみなされ、標準エラー出力にエラーメッセージを表示し、終了ステータス 1 を返します。

- 数字以外の文字を含む行

- 空行

- 数値として解釈できない行

- 負の数

## インストール方法 (Ubuntu環境)
以下コマンドをターミナル上で入力

### Git のインストール (インストール済みの方は不要)
```
$ sudo apt update
```
```
$ sudo apt install git
```
### リポジトリをクローンして移動
```
$ git clone https://github.com/A-545/robosys2025.git
```
```
$ cd robosys2025
```
### 実行権限の付与
```
$ chmod +x tax
```

## 使用方法
標準入力から数値を渡して実行します。

入力 1 行ごとに税込価格を計算し、複数行入力時はそれぞれ処理します。
```
$ echo "数値" | ./tax
```

## 実行例
### 例1: 100円の税込み価格を計算する場合
**入力** 
```
$ echo 100 | ./tax
```
**出力**
<pre>
110
</pre>

### 例2: 複数行の場合
**入力**
```
$ printf "100\n200\n300\n" | ./tax
```
**出力**
<pre>
110
220
330
</pre>

### 例3: 無効な入力
**入力**
```
$ printf "100\nabc\n200\n1a\n300\n" | ./tax
```
**出力**
<pre>
無効な入力: abc
</pre>

## ファイル構成
<pre>
.
├── LICENSE   # BSD 3条項ライセンスファイル
├── README.md # 本ドキュメント
├── tax       # 消費税計算コマンド
└── test.bash # テストスクリプト
</pre>

## 動作環境
### ソフトウェア
- Python
    - 3.7 ~ 3.10 テスト済み
### テスト環境
- Ubuntu 24.04.3 動作確認済み

## 備考
このリポジトリは大学講義（robosys2025）の課題として作成されたものです。

## ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- このパッケージのコードの一部は、下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを、本人の許可を得て自身の著作としたものです。
    - [ryuichiueda/my_slides robosys_2025](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)
- © 2025 Kotaro Oshima

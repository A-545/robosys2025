# taxコマンド
![test](https://github.com/A-545/robosys2025/actions/workflows/test.yml/badge.svg)

## 概要
`tax` は標準入力から数値を受け取り、**税率10%**を加算して小数点以下切り捨て
で出力するコマンドです。

## インストール方法
以下コマンドをターミナル上で実行
```
git clone https://github.com/A-545/robosys2025.git
```
```
cd robosys2025
```
**実行権限の付与**
```
chmod +x tax
```

## 使用方法
標準入力から数値を渡して実行
```
echo "数値" | ./tax
```

## 実行例
### 例1:100円の税込み価格を計算する場合
-入力
```
echo 100 | ./tax
```
-出力
```
110
```

### 例2:複数行の場合
-入力
```
printf "100\n200\n300\n" | ./tax
```
-出力
```
110
220
330
```

### 例3:無効な入力
以下の場合はエラーとなり、標準エラーにメッセージが出力される。

- 空行を含む入力

- 数字でない文字（例: abc, 1a）

- 数値変換できない行が1つでもある場合

- 負の数
#### 例
-入力
```
$ printf "100\nabc\n200\n1a\n300\n" | ./tax
```
-出力
```
無効な入力: abc
```

## ファイル構成
.

├── LICENSE

├── README.md

├── tax

└── test.bash

## 動作環境
### ソフトウェア
- Python
    - 3.7 ~ 3.10 テスト済み
### テスト環境
- Ubuntu 24.04.3 動作確認済み

## 備考
このリポジトリは、大学の講義(robosys2025)の課題のために作成されました。

---

## ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- このパッケージのコードの一部は、下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを、本人の許可を得て自身の著作としたものです。
    - [ryuichiueda/my_slides robosys_2025](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)
- © 2025 Kotaro Oshima

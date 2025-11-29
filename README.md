# taxコマンド
![test](https://github.com/A-545/robosys2025/actions/workflows/test.yml/badge.svg)

_税抜き価格に消費税10%を加算するコマンド_  

## インストール方法
以下コマンドをターミナル上で実行
```
git clone https://github.com/A-545/robosys2025.git
cd robosys2025
```
**実行権限の付与**
```
chmod +x tax
```

## 使用方法
`tax` は標準入力から数値を受け取り、**税率10%**を加算して小数点以下切り捨てで出力するコマンドです。

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

### 例3:無効な場合
以下の場合は出力されず続行。

空行を含む入力

数字でない文字（例: abc, 1a）

数値変換できない行が1つでもある場合
-入力
```
printf "100\nabc\n200\n1a\n300\n" | ./tax
```
-出力
```
110
220
330
```

## ファイル構成
<repository-root>/
├── .github/
│ └── workflows/
│ └── test.yml # Python 3.7〜3.10 でのGitHub Actionsテスト
├── LICENSE # BSD ライセンス
├── README.md # 本ファイル
├── tax/ # メインコード
├── test.bash # テストスクリプト

## 動作環境
- Python 3.7 ~ 3.10
- Ubuntu 24.04.3 動作確認済み

## 備考
このリポジトリは、大学の講義用の課題のために作成されました。

robosys2025
---

## ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- このパッケージのコードの一部は、下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを、本人の許可を得て自身の著作としたものです。
    - [ryuichiueda/my_slides robosys_2025](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)
- © 2025 Kotaro Oshima

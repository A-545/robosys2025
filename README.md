# tax
![test](https://github.com/A-545/robosys2025/actions/workflows/test.yml/badge.svg)

_税抜き価格に消費税10%を加算するコマンド_  

## クローン方法
以下コマンドをターミナル上で実行
g\it clone https://github.com/A-545/robosys2025.git

### 使い方
tax は標準入力から数値を受け取り、税率10%を加算して小数点以下切り捨てで出力するコマンドです。

**例1:100円の税込み価格を計算する場合**   
-入力
```
echo 100 | ./tax
```  
-出力  
```
110
```  

**例2:複数行の場合**
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

**例3:エラーの場合***
以下の場合は何も出力せず終了。

空行を含む入力

数字でない文字（例: abc, 1a）

数値変換できない行が1つでもある場合
-入力
```
echo abc | ./tax
echo $?
```
-出力
```
1
```

#### ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- このパッケージのコードの一部は、下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを、本人の許可を得て自身の著作としたものです。
    - [ryuichiueda/my_slides robosys_2025](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)
-このリポジトリの "test.bash" の一部（ng 関数など）は、上記スライドで公開されているサンプルコードを参考にして作成しています。 
- © 2025 Kotaro Oshima

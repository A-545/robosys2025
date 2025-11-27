#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Kotaro Oshima
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目が違うよ
        res=1
}

res=0


### NORMAL INPUT ###
out=$(echo 1000 | ./tax) #通常
[ "$out" = 1100 ] || ng "$LINENO"

out=$(echo 99.9 | ./tax) #少数
[ "$out" = 109 ] || ng "$LINENO"

out=$(printf "100\n200\n300\n" | ./tax) #複数
expected=$(printf "110\n220\n330\n")
[ "$out" = "$expected" ] || ng "$LINENO"

out=$(echo 0 | ./tax) #境界値
[ "$out" = 0 ] || ng "$LINENO"

out=$(echo 1 | ./tax)
[ "$out" = 1 ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./tax) #文字列
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo | ./tax 2) #空行
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "" ] || ng "$LINENO"

out=$(echo 1a | ./tax)
[ "$?" = 1 ] || ng "$LINENO" #文字列が混じる
[ "$out" = "" ] || ng "$LINENO"

out=$(printf "100\nabc\n200\n" | ./tax) #複数行に文字列
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "110" ] || ng "$LINENO"

out=$(printf "100\n1a\n200\n" | ./tax)
[ "$?" = 1 ] || ng "$LINENO" #複数行に文字列が混ざる
[ "$out" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo 

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

out=$(echo "100 " | ./tax) #末尾空白
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "110" ] || ng "$LINENO"

out=$(echo " 100" | ./tax) #先頭空白
[ "$?" = 0 ] || ng "$LINENO"
[ "$out" = "110" ] || ng "$LINENO"

### STRANGE INPUT ###

out=$(echo あ | ./tax 2>&1)  # 文字列
status=$?
[ "$status" = 1 ] || ng "$LINENO"
[ "$out" = "無効な入力: あ" ] || ng "$LINENO"

out=$(echo | ./tax 2>&1)  # 空行
status=$?
[ "$status" = 1 ] || ng "$LINENO"
[ "$out" = "無効な入力: " ] || ng "$LINENO"

out=$(echo -100 | ./tax 2>&1)  # 負の数
status=$?
[ "$status" = 1 ] || ng "$LINENO"
[ "$out" = "無効な入力: -100" ] || ng "$LINENO"

out=$(echo 1a | ./tax 2>&1)  # 数字に文字が混じる
status=$?
[ "$status" = 1 ] || ng "$LINENO"
[ "$out" = "無効な入力: 1a" ] || ng "$LINENO"

out=$(printf "100\nabc\n200\n" | ./tax 2>&1)  # 複数行に文字列
status=$?
[ "$status" = 1 ] || ng "$LINENO"
[ "$out" = "無効な入力: abc" ] || ng "$LINENO"

out=$(printf "100\n1a\n200\n" | ./tax 2>&1)  # 複数行に数字と文字
status=$?
[ "$status" = 1 ] || ng "$LINENO"
[ "$out" = "無効な入力: 1a" ] || ng "$LINENO"

out=$(echo 10.0.5 | ./tax 2>&1)  # 小数点が複数
status=$?
[ "$status" = 1 ] || ng "$LINENO"
[ "$out" = "無効な入力: 10.0.5" ] || ng "$LINENO"

out=$(printf "100\n\n200\n" | ./tax 2>&1)  # 空行交じり
status=$?
[ "$status" = 1 ] || ng "$LINENO"
[ "$out" = "無効な入力: " ] || ng "$LINENO"


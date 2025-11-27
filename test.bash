#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Kotaro Oshima
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo ${1}行目が違うよ
        res=1
}

res=0


### NORMAL INPUT ###
out=$( 1000 | ./tax)          
[ "${out}" = "1100" ] || ng "$LINENO"  

### STRANGE INPUT ###
out=$(echo あ | ./tax)        
[ "$?" = 1 ] || ng "$LINENO"  
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./tax)           
[ "$?" = 1 ] || ng "$LINENO" 
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res

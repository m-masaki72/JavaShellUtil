#!/bin/bash
echo "javaファイルをコンパイル後、実行します"
echo "==========================="
for i in *.java
do
    echo "-----------------------"
    echo "FileName : " $i
    echo "-----------------------"
    javac $i
    if [ $? -ne 0 ]; then
        echo "ステータス：コンパイルエラー"
	echo ""
    else
	grep "main" $i
	if [ $? -eq 0 ]; then
	    java ${i%.java} 
	    if [ $? -eq 0 ]; then
		echo "ステータス：実行完了"
		echo ""
	    else
		echo "ステータス：実行エラー"
		echo ""
	    fi
	else
	echo "ステータス：コンパイル完了"
	echo ""
	fi
    fi
    echo "==========================="
    echo ""

done

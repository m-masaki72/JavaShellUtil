#!/bin/bash
echo "javaファイルをコンパイル後、実行します"
echo "==========================="

for FILE in `\find . -name '*.java'`
do
    echo "-----------------------"
    echo "FileName : " $FILE
    echo "-----------------------"

    echo ""
    javac $FILE
    if [ $? -eq 0 ]; then
	grep "main" $FILE
	if [ $? -eq 0 ]; then
	    EXE=${FILE%.java}
	    java ${EXE#./*}
	    if [ $? -eq 0 ]; then
		echo "ステータス：実行完了"
	    else
		echo "ステータス：実行エラー"
		java ${EXE#./*}
	    fi
	else
	    echo "ステータス：コンパイル完了"
	fi
    else
        echo "ステータス：コンパイルエラー"
    fi
    echo ""
    echo "==========================="
    echo ""
done

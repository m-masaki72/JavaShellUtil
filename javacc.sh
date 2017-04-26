#!/bin/bash
echo "javaファイルをコンパイル後、実行します"
echo "==========================="

for FILE in `\find . -name '*.java'`
do
    echo "-----------------------"
    echo "FileName : " $FILE
    echo "-----------------------"

    javac $FILE

    echo ""
    if [ $? -ne 0 ]; then
        echo "ステータス：コンパイルエラー"
    else
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

    fi
    echo ""
    echo "==========================="
    echo ""
done

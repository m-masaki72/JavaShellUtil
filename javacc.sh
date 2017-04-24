#!/bin/bash
echo "javaファイルをコンパイル後、実行します"
echo "==========================="

find . -type f | while read FILE
do
    if [ $(echo $FILE | grep -e '.java') ]; then

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
		java ${FILE%.java} 
		if [ $? -eq 0 ]; then
		    echo "ステータス：実行完了"
		else
		    echo "ステータス：実行エラー"
		fi
	    else
		echo "ステータス：コンパイル完了"
	    fi

	fi
	echo ""
	echo "==========================="
	echo ""
    fi
done

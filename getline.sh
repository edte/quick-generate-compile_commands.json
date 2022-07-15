#!/bin/bash

# 先判断是不是输入了空的参数
if [[ ! -n $1 ]]; then
    echo "please input target file or suffix"
    exit
fi

filename=$1

echo "input: $filename"

# 获取文件后缀
#suffix="${filename##*.}"

# 有后缀,统计该单个文件
if [[ $filename =~ \. ]]; then    
#    echo $suffix
    nums=$(find . -name "$filename" | xargs grep -v "^$" | wc -l)
    echo "count file $filename, line counts number: $nums"
    exit
fi

# 统计所有该后缀的文件
nums=$(find . -name "*.$filename" | xargs grep -v "^$" | wc -l)
echo "count *.$filename files,line counts number: $nums"

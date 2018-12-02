#!bin/bash

# 该脚本用于为某个文件夹中的所有文件加上由用户指定的特定前缀，若用户未指定，则默认使用文件夹名作为前缀。
# 应用场景：数据集处理时当多个不同文件夹内的图像起名较简单，如1.jpg, 2.jpg，在合并文件夹时会遇到重名。故先对不同文件夹的文件添加前缀。
# 参数说明： $1 待处理文件夹名称 $2 指定的前缀名（可选参数）

dir_name=${1}
if [[ $# < 2 ]]
then
    final_str=$(echo ${dir_name: -1})
    if [ "$final_str" == "/" ]; then dir_name=$(echo ${dir_name: 0:-1});fi #check if end with '/'

    if [ `echo $dir_name | grep / ` != '0' ] #check if dir contains '/'
    then
      prefix=$(echo $dir_name | rev | cut -d / -f 1 | rev)
    else
      prefix=$dir_name
    fi
else
    prefix = ${2}
fi

echo input dir_name: $dir_name
echo add prefix: $prefix

#operate
cd $dir_name
#i=1.jpg
for i in *.jpg;do mv $i $prefix"_"$i;done
#for i in *.json;do mv $i $prefix"_"$i;done
#echo $prefix"_"$i

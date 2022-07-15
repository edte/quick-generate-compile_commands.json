#!/bin/bash 

rm -rf CMakeLists.txt

DIRS=$(find $1 -maxdepth 20 -type d)
echo "cmake_minimum_required(VERSION 3.22)" >> CMakeLists.txt
echo "set (CMAKE_EXPORT_COMPILE_COMMANDS ON)" >> CMakeLists.txt
echo "project(PROJECT_NAME_RANDOM)" >> CMakeLists.txt
for i in $DIRS; 
do  
	echo "include_directories($i)" >> CMakeLists.txt
	echo "aux_source_directory($i DIRS)" >> CMakeLists.txt
done
echo "add_executable(\${PROJECT_NAME} \${DIRS})" >> CMakeLists.txt

echo "CMakeLists generate successful."

mkdir build
cd build
rm -rf *
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=True ..
cd ..
ln -s build/compile_commands.json  ./

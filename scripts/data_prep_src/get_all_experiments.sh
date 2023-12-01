#!/bin/bash

data_path='/mnt/c/Users/dnxjc/OneDrive/Desktop/CURR/bme 1/FINAL PROJECT/data/Filtered_Data_mat/'
echo ${data_path}

exp="$1"

cd "${data_path}"

> "all_${exp}.txt"
for f in *ex${exp}*.mat ; do
	echo -e $f >> "all_${exp}.txt"
done

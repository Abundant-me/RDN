#!/bin/bash
path=$1
files=$(ls ${path})
filename=result_$2
mkdir /home/liuxu/Projects/EDSR-PyTorch/experiment/${filename}
for f in ${files}
do
    echo ${f}
    CUDA_VISIBLE_DEVICES=4,5,6,7 python main.py --template MDSR --dir_demo /home/liuxu/Projects/EDSR-PyTorch/src/data/SDR_540p/${f} --data_test video --n_GPUs 4 --model $2 --scale 2+3+4 --n_resblocks 80 --pre_train /home/liuxu/Projects/EDSR-PyTorch/experiment/model/MDSR.pt --reset --test_only --save video_try_MDSR_234
    cp /home/liuxu/Projects/EDSR-PyTorch/experiment/video_try_MDSR_234/*.avi /home/liuxu/Projects/EDSR-PyTorch/experiment/${filename}
done

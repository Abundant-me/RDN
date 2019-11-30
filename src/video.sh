#!/bin/bash
path=$1
files=$(ls ${path})
filename=result_$2
mkdir /home/dengzeshuai/code/EDSR-PyTorch-JDY/experiment/${filename}
for f in ${files}
do
    echo ${f}
    CUDA_VISIBLE_DEVICES=4,5,6,7 python main.py --dir_demo /home/dengzeshuai/code/EDSR-PyTorch-JDY/src/data/SDR_540p/${f} --data_test video --n_GPUs 4 --model $2 --scale 4 --pre_train /home/dengzeshuai/pretrained_models/RDN_BIX4_G10R20P48/model/model_best.pt --reset --test_only --save video_try_RDN_4
    cp /home/dengzeshuai/code/EDSR-PyTorch-JDY/experiment/video_try_RDN_4/*.avi /home/dengzeshuai/code/EDSR-PyTorch-JDY/experiment/${filename}
done

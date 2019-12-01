#!/bin/bash

mkdir -p "SDR/trainset/HR"
mkdir -p "SDR/trainset/LR/X4"

cp pngs/gt/*0.png "SDR/trainset/HR"
cp pngs/X4/*0.png "SDR/trainset/LR/X4"

rm SDR/trainset/HR/14022549*.png
rm SDR/trainset/LR/X4/14022549*.png

rm SDR/trainset/HR/13521019*.png
rm SDR/trainset/LR/X4/13521019*.png

rm SDR/trainset/HR/97342178*.png
rm SDR/trainset/LR/X4/97342178*.png

rm SDR/trainset/HR/97592544*.png
rm SDR/trainset/LR/X4/97592544*.png

rm SDR/trainset/HR/84009993*.png
rm SDR/trainset/LR/X4/84009993*.png

rm SDR/trainset/HR/54798383*.png
rm SDR/trainset/LR/X4/54798383*.png

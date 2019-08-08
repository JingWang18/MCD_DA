#!/bin/bash
# Change this to be the location to store the data
base_gta="gta5"
base_www=https://download.visinf.tu-darmstadt.de/data/from_games/data

base_dir=`pwd`
mkdir -p "${base_gta}"
mkdir -p "${base_gta}/zips"

for i in {01..10}
do
    img_file="${base_www}/${i}_images.zip"
    anno_file="${base_www}/${i}_labels.zip"
    # Download Images
    if ! [ -e "${base_gta}/zips/${i}_images.zip" ];
    then 
        echo "Starting download of images: ${i}"
        #wget ${base_gta} ${img_file}/zips --no-check-certificate
    fi
    if [ -e "${base_gta}/images" ];
    then
        echo "Images folder already exists skipping"
    else
        unzip ${base_gta}/zips/${i}_images.zip
    fi
    
    # Download Annotations
    if ! [ -e "${base_gta}/zips/${i}_labels.zip" ];
    then
        echo "Starting download of labels: ${i}"
        wget ${base_gta} ${anno_file}/zips --no-check-certificate
    fi
    if [ -e "${base_gta}/labels" ];
    then
        echo "Labels folder already exists skipping"
    else
        unzip ${base_gta}/${i}_labels.zip -d ${base_gta}
    fi
done

if ! [ -e "${base_gta}/zips/read_mapping.zip" ]
then
    wget -P ${base_gta}/zips https://download.visinf.tu-darmstadt.de/data/from_games/code/read_mapping.zip --no-check-certificate
fi
unzip ${base_gta}/zips/read_mapping.zip -d ${base_gta}
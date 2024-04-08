#!/bin/bash

file_to_read=$1

prefix_meta=meta_
prefix_data=data_

for f in $(ls -1 $1)
do
    echo Working on FILE $f
    cat $f |grep -B100000000  META_STOP|grep -A10000000 META_START|grep -v META_START|grep -v META_STOP > ${prefix_meta}$f
    cat $f |grep -A100000000  DATA_START|grep -B10000000 DATA_STOP|grep -v DATA_START|grep -v DATA_STOP > ${prefix_data}$f
    
done

#!/bin/bash

for cup_file in *.stl
do
    cup_name=$(basename $cup_file);
    echo "Adding object for " . $cup_name;
    object_id=$(rosrun object_recognition_core object_add.py -n "$cup_name" --commit | sed 's/Stored new object with id: //g');
    echo "Adding mesh for " . $cup_name;
    rosrun object_recognition_core mesh_add.py $object_id $cup_file --commit
done
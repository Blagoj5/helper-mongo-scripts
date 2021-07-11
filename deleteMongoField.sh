#!/bin/bash

echo Enter database
read database

echo Enter collection
read collection

echo Enter the name of the field that you want to unset
read field


# TODO: dont allow script to continue if any of the fields above is missing

echo $database $collection $field1 $field2
mongo $database <<EOF
    db.$collection.update({}, {\$unset: {$field: 1 }}, {multi: true})
EOF

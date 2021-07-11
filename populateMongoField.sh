#!/bin/bash

echo Enter database
read database

echo Enter collection
read collection

echo Enter the name of the field that you want the population to happen from
read field1

echo Enter field that you want to populate
read field2

# TODO: dont allow script to continue if any of the fields above is missing

echo $database $collection $field1 $field2
mongo $database <<EOF
db.$collection.find().forEach(function(document) { 
    db.$collection.update({_id: document._id}, {\$set: {$field2: document.$field1 }})
    print("Value: document.$field1 will be added to $field2");
})
EOF

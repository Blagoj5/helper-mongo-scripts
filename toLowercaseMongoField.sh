#!/bin/bash

echo Enter database
read database

echo Enter collection
read collection

echo Enter the name of the field that you want the population to happen from
read field

# TODO: dont allow script to continue if any of the fields above is missing

echo $database $collection $field1 $field2
mongo $database <<EOF
db.$collection.find().forEach(function(document) { 
    document.$field = document.$field.toLowerCase();
    db.$collection.save(document);
})
EOF

#Extracts data from passwd file into a CSV file
# The csv data file contains the user name, user id and home directory of each user account defined in passwd file

#Transforms the text demiliter from ":" to ","

#Loads the adta from CSV file into a table in postgresql database

echo "Extracting data"

#extract the columns 1 (username), 2 (userid) and 6 (home directory path) from passwd file
#and bring to extracted_data.txt file
cut -d":" -f1,3,6 d:/pgpass/passwd.txt > extracted_data.txt 

echo "Transforming data"
#replace the colons with commas in the extracted_data.txt file
tr ":" "," < extracted_data.txt > transformed_data.csv 

#load transformed data to postgresql database
echo "Loading data"
echo "\c passwd;\COPY users FROM 'D:/pgpass/transformed_data.csv' DELIMITER ',' CSV;" | psql --username=postgres --host=localhost
echo "##############################################################################################################################"
echo "WARNING: the database schema you want import should passed as parameter. example: ./db-import-abasteceai-local.sh backoffice"
echo "WARNING: the MySQL container name used is: bd-mysql"
echo "WARNING: the MySQL username used is: root"
echo "WARNING: the MySQL password used is: root"
echo "### Process Has been started - Abasteceai local database - exec dump for schema: $1 ###"
echo "##############################################################################################################################"

echo " LOG -------------------------------- "
echo " Removing old merged files "
rm -R ~/workspace/abasteceai/database/local/merged_files
mkdir ~/workspace/abasteceai/database/local/merged_files

echo " LOG -------------------------------- "
echo " Merging all .sql files for schema $1 "
cat ~/workspace/abasteceai/database/local/dumps/$1/*$1*.sql > ~/workspace/abasteceai/database/local/merged_files/$1.sql

echo " LOG -------------------------------- "
echo " Removing trash from sql file "
sed -i 's/COLLATE=utf8mb4_0900_ai_ci//g' ~/workspace/abasteceai/database/local/merged_files/$1.sql

echo " LOG -------------------------------- "
echo "Adding initial script for schema $1"
sed -i "1iDROP DATABASE if exists $1; \n CREATE DATABASE $1; \n USE $1; \n" ~/workspace/abasteceai/database/local/merged_files/$1.sql

echo " LOG -------------------------------- "
echo "Executing dump into bd-mysql docker container"
echo "warning: make sure whether MySQL container name, MySQL username and MySQL password are right to run the next script"
docker exec -i bd-mysql mysql -uroot -proot < ~/workspace/abasteceai/database/local/merged_files/$1.sql

echo "##############################################################################################"
echo "### Process Has been done - the $1 database is now full of data to perform your tests ###"
echo "##############################################################################################"

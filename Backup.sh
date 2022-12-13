
#!/bin/bash


echo "Starting backup..."
read -r -p "Wich directory do you want to save ? ex: /home/joefreddy/ " responsedirectory
read -r -p "Where do you want to backups this directory ? ex: /Backups/ " responsedest


day=$(date +%d-%m-%Y_%H:%M:%S) 
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"
echo $archive_file



tar czf $responsedest/"$archive_file" $responsedirectory
ls -lh $responsedest


echo "Deleting files older than 7 days..."
find $responsedirectory -mtime +7 -exec rm {} \;

echo "Backup done !"
python3 Sending-telegram.py




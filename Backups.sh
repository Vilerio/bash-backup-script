
#!/bin/bash
echo "Démarrage de la sauvegarde..."
sudo mkdir /home/username/temporary/sql
sudo mysqldump -u root --databases database > /home/username/temporary/sql/database.sql

# tu backup quel fichier ?
backup_files="/home /etc /var/www"

# Tu met la backup dans ?
dest="/Backups"

# Le nom de ta backup.
day=$(date +%d-%m-%Y_%H:%M:%S) 
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"
echo $archive_file



# Backup.
tar czf $dest/"$archive_file" $backup_files

ls -lh $dest
#suppresion du dossier temporaire
sudo rm -r /home/username/temporary/sql
#Copie de la sauvegarde sur un serveur distant (à monter avant)
sudo cp /Backups/$archive_file /Distant-backups



echo "Sauvegarde terminée !"
python3 Sending-telegram.py

# Tu supprime les backup de plus de 7 jours.
find $dest -mtime +7 -exec rm {} \;
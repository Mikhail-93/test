#!bin/bash
chmod +x create_dir.sh; chmod +x export.sh; chmod +x import.sh
sudo docker cp sql_scripts $1:/
sudo docker exec --user=root $1 /bin/bash -c "chmod +x sql_scripts/add.sql; chmod +x sql_scripts/add_pmd.sql; chmod +x sql_scripts/drop.sql; chmod +x sql_scripts/create_dir.sql;"
sudo docker exec --user=root $1 /bin/bash -c "source /home/oracle/.bashrc;mkdir /ORCL/backup/day;mkdir /ORCL/backup/week;mkdir /ORCL/backup/month;mkdir /ORCL/backup/year;"
sudo docker exec --user=root $1 /bin/bash -c "source /home/oracle/.bashrc;chmod 777 /ORCL/backup/day; chmod 777 -R /ORCL/backup/week;chmod 777 -R /ORCL/backup/month;chmod 777 -R /ORCL/backup/year;"
sudo docker exec $1 /bin/bash -c "source /home/oracle/.bashrc;sqlplus / as sysdba @sql_scripts/create_dir.sql"


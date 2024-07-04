# *How to install and configure PostgresSQL*


__UPDATE APT & INSTALL POSTGRESQL__
```bash
sudo apt update && sudo apt install postgresql
```
__CHANGE USER & LOGIN WITH POSTGRES__
```bash
sudo -i -u postgres
psql -U postgres
```
__ADD USER & PASSWORD__
```sql
create user <username_admin> with password <''>;
```
__CHANGE ROLE TO ADMIN__
```sql
alter role <username_admin> superuser;
```
__CHANGE SERVER LISTEN ADDRESS TO ALL__
```bash
sudo nano /etc/postgresql/14/main/postgresql.conf\
```
EDIT=>

        JUMP TO LINE:'listen_addresses = ''
        CHANGE:'local' -> '*'

__GRANT USER LOGIN PERMISSIONS TO DB AND CHANGE TO PASSWORD LOGIN__
```bash
sudo nano /etc/postgresql/14/main/pg_hba.conf\
```
ADD=>   
```bash
        TO LINE CONTAINS: # 'local' is for Unix..
        ADD NEWLINE: local <db_name> <username_admin> md5
        TO LINE CONTAINS: # IPv4 local..
        ADD NEWLINE: host <db_name> <username_admin> md5
        TO LINE UNDER: # IPv6 local\
        ADD NEWLINE: host <db_name> <username_admin> 172.18.0.1/16 md5
```

__RESTART SERVICE TO APPLY NEW CONFIG__
```bash
sudo systemctl restart postgresql
```
__LOGIN WITH NEW USER TO NEW DB__
```bash
psql -U <username_admin> -d <db_name>
```

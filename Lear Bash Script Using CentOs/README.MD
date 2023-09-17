Goals

The server should be running :
    1. Centos ≥ 7
    2. Nginx ≥ 1.15
    3. Postgresql ≥ 11
    4. Node.js >= 0.10.6

The server must have 3 easily executable bash scripts in /opt/oss/bin :
    1. bin/stop → stop the Express server, nginx, and postgresql.
    2. bin/start → start the Express server, nginx, and postgresql.
    3. bin/backup → dump the postgresql database to a .sqlfile in /opt/oss/data/backups


Outputs
A dockerfile or a vagrantfile which fulfills all the goals listed above, along with the 3
executable bash scripts.

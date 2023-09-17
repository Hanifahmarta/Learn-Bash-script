Goals

The server should be running: Centos ≥ 7,  Nginx ≥ 1.15, Postgresql ≥ 11, Node.js >= 0.10.6

The server must have 3 easily executable bash scripts in /opt/oss/bin :
- bin/stop → stop the Express server, nginx, and PostgreSQL.
- bin/start → start the Express server, nginx, and PostgreSQL.
- bin/backup → dump the postgresql database to a .sqlfile in /opt/oss/data/backups

Outputs
A dockerfile or a vagrantfile which fulfills all the goals listed above, along with the 3
executable bash scripts.

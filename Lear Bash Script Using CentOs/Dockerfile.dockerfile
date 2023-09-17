FROM centos:7
# Set environment variables for PostgreSQL
ENV PGDATA /var/lib/postgresql/data

# Install Node.js
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash -
RUN yum install -y nodejs

# Install Nginx
RUN yum install -y epel-release
RUN yum install -y nginx

# Install PostgreSQL
RUN yum install -y epel-release
RUN yum -y install postgresql postgresql-server postgresql-contrib

# Copy your application source code and package.json
COPY src/ /opt/oss/src/
COPY ./package.json /opt/oss/

# Install Node.js dependencies
WORKDIR /opt/oss
RUN npm install

# Configuration Nginx
COPY ./nginx.conf /etc/nginx/conf.d
# Configuration PostgreSQL
COPY ./postgresql.conf /var/lib/pgsql/data/postgresql.conf

# Buat direktori untuk backup
RUN mkdir -p /opt/oss/data/backups
# Bash script to stop services
COPY bin/stop /opt/oss/bin/stop

# Bash script to start services
COPY bin/start /opt/oss/bin/start
# Bash script to backup PostgreSQL
COPY bin/backup /opt/oss/bin/backup

# chmod
RUN chmod +x /opt/oss/bin/*

# Expose port 80
EXPOSE 80
# Start services
CMD ["/opt/oss/bin/start"]
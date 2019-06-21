
FROM centos:latest

RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm epel-release.noarch

RUN yum install -y pgadmin4-web.noarch policycoreutils-python.x86_64 openssh-clients.x86_64

RUN yum update -y

RUN mkdir -p /var/lib/pgadmin/storage
RUN mkdir -p /var/lib/pgadmin/sessions
RUN mkdir -p /var/log/pgadmin

COPY pgadmin4.db /var/lib/pgadmin/pgadmin4.db
COPY pgadmin4.conf /etc/httpd/conf.d/pgadmin4.conf
COPY pgadmin4.log /var/log/pgadmin/pgadmin4.log

RUN chmod -R 700 /var/lib/pgadmin
RUN chmod 700 /var/lib/pgadmin
RUN chmod 755 /var/lib/pgadmin/storage
RUN chmod 600 /var/lib/pgadmin/pgadmin4.db
RUN chmod 644 /var/log/pgadmin/pgadmin4.log

RUN chown -R apache:apache /var/lib/pgadmin
RUN chown -R apache:apache /var/log/pgadmin

# ./usr/pgadmin4/bin/pgadmin4-web-setup.sh
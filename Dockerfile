
FROM centos:7

RUN yum update -y

RUN yum install -y https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-redhat-repo-2-1.noarch.rpm

RUN yum install -y pgadmin4-web.noarch policycoreutils-python.x86_64 openssh-clients.x86_64

RUN mkdir /root/.ssh

COPY arca     /root/.ssh/arca
COPY arca.pub /root/.ssh/arca.pub
COPY config   /root/.ssh/config

# RUN /usr/pgadmin4/bin/setup-web.sh
# CMD ["httpd", "-DNO_DETACH"]

CMD [ "bash" ]

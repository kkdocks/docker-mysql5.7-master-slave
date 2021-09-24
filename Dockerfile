FROM mysql:5.7 as mysql-parent

LABEL maintainer="nekoimi <nekoimime@gmail.com>"

ARG timezone

ENV TIMEZONE=${timezone:-"Asia/Shanghai"}

ADD docker-create-mysql-user.sh /usr/local/bin/docker-create-mysql-user

RUN set -x \
    # Timezone
    && /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' > /etc/timezone \
    && chmod +x /usr/local/bin/docker-create-mysql-user

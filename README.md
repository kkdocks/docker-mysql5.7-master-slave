### 环境变量

- MYSQL_ROOT_HOST

- MYSQL_DATABASE

- MYSQL_USER

- MYSQL_PASSWORD

- MYSQL_ROOT_PASSWORD

- MYSQL_ALLOW_EMPTY_PASSWORD

- MYSQL_RANDOM_ROOT_PASSWORD

### 目录列表

- /docker-entrypoint-initdb.d/  初始化sql文件目录

- /etc/mysql/conf.d  配置文件目录

- /var/lib/mysql  数据目录

- /var/lib/mysql-files  数据目录

### 创建普通用户

- 进入容器

```bash
docker-create-mysql-user {用户名} {密码} {数据库名称}
```

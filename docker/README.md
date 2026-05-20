# Docker 基础服务说明

本目录用于维护后端依赖的基础服务配置。项目本地开发阶段通过根目录 `docker-compose.yml` 启动 MySQL、Redis、Milvus、Etcd 和 MinIO。

本项目使用独立的 Compose 项目名 `campus-ai-assistant`，容器、网络和数据卷均与其他项目隔离。对外端口也使用本项目专属端口，避免占用本机默认的 `3306`、`6379`、`9000` 等端口。

## 启动服务

```bash
docker compose up -d
```

## 查看状态

```bash
docker compose ps
```

## 停止服务

```bash
docker compose down
```

## 初始化 SQL

MySQL 初始化脚本放在：

```text
docker/mysql/init/
```

首次创建 MySQL 容器时，Docker 会自动执行该目录下的 `.sql` 文件。已经创建过数据卷后，修改初始化 SQL 不会自动重新执行；如需重新初始化，必须确认数据可删除后再清理 Docker volume。

## 默认连接信息

| 服务 | 地址 | 用户名 | 密码 |
| --- | --- | --- | --- |
| MySQL | `localhost:13306` | `campus_ai` | `campus_ai123456` |
| Redis | `localhost:16379` | 无 | 无 |
| Milvus | `localhost:19531` | 无 | 无 |
| MinIO API | `http://localhost:19000` | `minioadmin` | `minioadmin` |
| MinIO 控制台 | `http://localhost:19001` | `minioadmin` | `minioadmin` |

生产或演示环境应通过 `.env` 覆盖默认密码。

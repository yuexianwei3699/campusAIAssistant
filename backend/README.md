# 后端服务说明

后端基于 Spring Boot 3 开发，默认端口为 `18080`。

## 启动前置条件

先在项目根目录启动 Docker 基础服务：

```bash
docker compose up -d
```

## 启动后端

```bash
mvn spring-boot:run
```

## 验证接口

```text
GET http://localhost:18080/api/health
GET http://localhost:18080/api/health/dependencies
```

接口文档：

```text
http://localhost:18080/doc.html
http://localhost:18080/swagger-ui.html
```


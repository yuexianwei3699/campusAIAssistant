# campusAIAssistant

基于大语言模型的校园智能问答与个性化服务系统。

## 项目结构

```text
campus-ai-assistant/
├── backend/              # Spring Boot 后端工程
├── frontend/             # Vue 3 前端工程
├── docker/               # Docker 配置与数据库初始化脚本
├── docs/                 # 项目文档与迭代任务清单
├── scripts/              # 辅助脚本
├── data/                 # 示例数据，不存放隐私数据
├── docker-compose.yml    # MySQL、Redis、Milvus 基础服务
└── 系统设计规范.md
```

## 本地开发启动流程

Docker 基础服务使用本项目专属容器名和端口，不占用本机默认数据库端口。后续开发按以下顺序启动：

```bash
docker compose up -d
cd backend
mvn spring-boot:run
cd ../frontend
npm install
npm run dev
```

后端默认地址为 `http://localhost:18080`，基础健康检查接口为 `http://localhost:18080/api/health`。

## 任务清单

迭代任务记录在 [docs/TASKS.md](docs/TASKS.md)。完成任务后将对应复选框从 `[ ]` 改为 `[x]`。

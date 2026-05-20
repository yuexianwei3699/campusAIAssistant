<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { CheckCircle2, Database, FileText, MessageSquareText } from 'lucide-vue-next'
import { getDependencyHealth, getHealth } from '@/api/systemApi'

const appStatus = ref('checking')
const dependencyStatus = ref('checking')

onMounted(async () => {
  try {
    const health = await getHealth()
    appStatus.value = health.data.status
  } catch {
    appStatus.value = 'DOWN'
  }

  try {
    const dependencies = await getDependencyHealth()
    dependencyStatus.value = dependencies.data.status
  } catch {
    dependencyStatus.value = 'DOWN'
  }
})
</script>

<template>
  <div class="home-grid">
    <section class="hero-card">
      <div class="hero-copy">
        <span class="badge">Knowledge-grounded assistant</span>
        <h2>让校园政策、流程和通知变成可追问的服务入口。</h2>
        <p>
          系统以知识库为基础，结合语义检索和大模型生成，面向学生、教师与管理员提供问答、推荐和后台维护能力。
        </p>
        <div class="hero-actions">
          <RouterLink class="primary-button" to="/chat">开始问答</RouterLink>
          <RouterLink class="text-button" to="/admin/dashboard">查看后台</RouterLink>
        </div>
      </div>
      <div class="terminal-card">
        <div class="terminal-line"><span class="pill thinking">Thinking</span> 识别用户问题意图</div>
        <div class="terminal-line"><span class="pill read">Reading</span> 检索校园知识片段</div>
        <div class="terminal-line"><span class="pill edit">Editing</span> 生成带来源的回答</div>
        <div class="terminal-line"><span class="pill done">Done</span> 返回办事路径与提醒</div>
      </div>
    </section>

    <section class="feature-row">
      <article class="feature-card">
        <MessageSquareText :size="22" />
        <h3>智能问答</h3>
        <p>支持自然语言提问、多轮追问、来源展示和反馈。</p>
      </article>
      <article class="feature-card">
        <FileText :size="22" />
        <h3>知识库管理</h3>
        <p>支持分类、标签、上传、审核、发布与下架流程。</p>
      </article>
      <article class="feature-card">
        <Database :size="22" />
        <h3>基础服务</h3>
        <p>MySQL、Redis、Milvus 已通过 Docker 独立部署。</p>
      </article>
    </section>

    <section class="status-card">
      <div>
        <span class="badge">System Health</span>
        <h3>后端联通状态</h3>
      </div>
      <div class="status-list">
        <span><CheckCircle2 :size="18" /> 应用：{{ appStatus }}</span>
        <span><CheckCircle2 :size="18" /> MySQL / Redis：{{ dependencyStatus }}</span>
      </div>
    </section>
  </div>
</template>

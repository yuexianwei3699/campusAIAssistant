<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink, RouterView, useRoute } from 'vue-router'
import { Bot, LayoutDashboard, MessageSquareText, Search, ShieldCheck } from 'lucide-vue-next'

const route = useRoute()

const activeTitle = computed(() => {
  if (route.path.startsWith('/chat')) return '智能问答'
  if (route.path.startsWith('/admin')) return '管理后台'
  return '校园服务'
})
</script>

<template>
  <div class="app-shell">
    <header class="top-nav">
      <RouterLink class="brand" to="/home">
        <span class="brand-mark">CA</span>
        <span>Campus AI</span>
      </RouterLink>
      <nav class="nav-links">
        <RouterLink to="/home">首页</RouterLink>
        <RouterLink to="/chat">智能问答</RouterLink>
        <RouterLink to="/admin/dashboard">管理后台</RouterLink>
      </nav>
      <RouterLink class="nav-action" to="/login">登录</RouterLink>
    </header>

    <main class="workspace">
      <aside class="side-panel">
        <div class="panel-caption">Workspace</div>
        <RouterLink class="side-link" to="/home">
          <LayoutDashboard :size="17" />
          <span>概览</span>
        </RouterLink>
        <RouterLink class="side-link" to="/chat">
          <MessageSquareText :size="17" />
          <span>问答</span>
        </RouterLink>
        <RouterLink class="side-link" to="/admin/dashboard">
          <ShieldCheck :size="17" />
          <span>后台</span>
        </RouterLink>
        <div class="search-box">
          <Search :size="16" />
          <span>搜索知识库</span>
        </div>
      </aside>

      <section class="content-stage">
        <div class="stage-heading">
          <div>
            <span class="badge">AI CAMPUS SERVICE</span>
            <h1>{{ activeTitle }}</h1>
          </div>
          <div class="agent-status">
            <Bot :size="17" />
            <span>RAG ready</span>
          </div>
        </div>
        <RouterView />
      </section>
    </main>
  </div>
</template>

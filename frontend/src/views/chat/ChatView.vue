<script setup lang="ts">
import { SendHorizonal } from 'lucide-vue-next'

const messages = [
  { role: 'user', text: '补办学生证需要什么材料？' },
  { role: 'assistant', text: '请准备本人身份证明、近期证件照，并按学院或教务处要求提交申请。正式流程以后端知识库为准。' }
]
</script>

<template>
  <div class="chat-shell">
    <section class="chat-panel">
      <div v-for="message in messages" :key="message.text" class="chat-message" :class="message.role">
        <span class="message-role">{{ message.role === 'user' ? 'You' : 'Campus AI' }}</span>
        <p>{{ message.text }}</p>
      </div>
      <div class="source-strip">
        <span class="pill read">Source</span>
        <span>后续迭代接入知识库来源展示</span>
      </div>
    </section>
    <form class="composer">
      <input placeholder="输入校园问题，例如：奖学金什么时候申请？" />
      <button type="button" aria-label="发送问题">
        <SendHorizonal :size="18" />
      </button>
    </form>
  </div>
</template>

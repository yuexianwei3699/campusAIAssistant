<template>
  <main class="login-page">
    <section class="login-panel">
      <span class="badge">Campus AI</span>
      <h1>登录校园智能服务系统</h1>
      <p>后续迭代将接入真实账号、JWT 与角色权限；当前页面用于确认前端基础流程。</p>
      <el-form label-position="top">
        <el-form-item label="账号">
          <el-input placeholder="student001" />
        </el-form-item>
        <el-form-item label="密码">
          <el-input placeholder="请输入密码" type="password" show-password />
        </el-form-item>
        <RouterLink class="primary-button full-width" to="/home">进入系统</RouterLink>
      </el-form>
    </section>
  </main>
</template>

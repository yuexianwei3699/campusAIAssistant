import { createRouter, createWebHistory } from 'vue-router'
import MainLayout from '@/layouts/MainLayout.vue'
import LoginView from '@/views/auth/LoginView.vue'
import HomeView from '@/views/HomeView.vue'
import ChatView from '@/views/chat/ChatView.vue'
import AdminDashboard from '@/views/admin/AdminDashboard.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/login', name: 'login', component: LoginView },
    {
      path: '/',
      component: MainLayout,
      redirect: '/home',
      children: [
        { path: 'home', name: 'home', component: HomeView },
        { path: 'chat', name: 'chat', component: ChatView },
        { path: 'admin/dashboard', name: 'admin-dashboard', component: AdminDashboard }
      ]
    }
  ]
})

export default router

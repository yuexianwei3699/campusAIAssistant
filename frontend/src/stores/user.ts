import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    username: '演示用户',
    role: 'student'
  }),
  actions: {
    setDemoRole(role: string) {
      this.role = role
    }
  }
})

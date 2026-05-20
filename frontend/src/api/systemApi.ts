import { http } from './http'

export interface HealthResponse {
  code: number
  message: string
  data: {
    status: string
    checkedAt: string
  }
}

export function getHealth() {
  return http.get<unknown, HealthResponse>('/health')
}

export function getDependencyHealth() {
  return http.get<unknown, HealthResponse>('/health/dependencies')
}

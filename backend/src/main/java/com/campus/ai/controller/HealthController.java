package com.campus.ai.controller;

import com.campus.ai.common.Result;
import com.campus.ai.vo.HealthVO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@Tag(name = "系统健康检查")
@RestController
@RequestMapping("/api/health")
public class HealthController {

    private final JdbcTemplate jdbcTemplate;
    private final StringRedisTemplate redisTemplate;

    public HealthController(JdbcTemplate jdbcTemplate, StringRedisTemplate redisTemplate) {
        this.jdbcTemplate = jdbcTemplate;
        this.redisTemplate = redisTemplate;
    }

    @Operation(summary = "基础健康检查")
    @GetMapping
    public Result<HealthVO> health() {
        return Result.success(new HealthVO("UP", LocalDateTime.now()));
    }

    @Operation(summary = "数据库与缓存连接检查")
    @GetMapping("/dependencies")
    public Result<HealthVO> dependencies() {
        jdbcTemplate.queryForObject("SELECT 1", Integer.class);
        redisTemplate.opsForValue().set("campus-ai:health", "UP");
        return Result.success(new HealthVO("UP", LocalDateTime.now()));
    }
}

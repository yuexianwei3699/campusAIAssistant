CREATE DATABASE IF NOT EXISTS campus_ai
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE campus_ai;

CREATE TABLE IF NOT EXISTS sys_user (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(64) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  real_name VARCHAR(64),
  role_code VARCHAR(32) NOT NULL DEFAULT 'student',
  college VARCHAR(128),
  major VARCHAR(128),
  grade VARCHAR(32),
  status VARCHAR(32) NOT NULL DEFAULT 'enabled',
  deleted TINYINT NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS knowledge_category (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(128) NOT NULL,
  parent_id BIGINT,
  sort_order INT NOT NULL DEFAULT 0,
  status VARCHAR(32) NOT NULL DEFAULT 'enabled',
  deleted TINYINT NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS knowledge_item (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  category_id BIGINT,
  source_name VARCHAR(255),
  source_url VARCHAR(512),
  applicable_roles VARCHAR(255),
  tags VARCHAR(255),
  status VARCHAR(32) NOT NULL DEFAULT 'draft',
  deleted TINYINT NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_category_status (category_id, status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO knowledge_category (name, parent_id, sort_order)
SELECT '教务管理', NULL, 1
WHERE NOT EXISTS (SELECT 1 FROM knowledge_category WHERE name = '教务管理');

INSERT INTO knowledge_category (name, parent_id, sort_order)
SELECT '学生事务', NULL, 2
WHERE NOT EXISTS (SELECT 1 FROM knowledge_category WHERE name = '学生事务');

INSERT INTO knowledge_category (name, parent_id, sort_order)
SELECT '后勤服务', NULL, 3
WHERE NOT EXISTS (SELECT 1 FROM knowledge_category WHERE name = '后勤服务');


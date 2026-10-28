CREATE DATABASE IF NOT EXISTS buffet_poc CHARACTER SET utf8mb4;
USE buffet_poc;

CREATE TABLE IF NOT EXISTS orders (
  id                BIGINT AUTO_INCREMENT PRIMARY KEY,
  ticket_code       VARCHAR(12) NOT NULL UNIQUE,      -- código de confirmación que ve el alumno
  client_request_id CHAR(36)    NOT NULL UNIQUE,      -- idempotencia: un reintento no duplica el pedido
  student_name      VARCHAR(80) NOT NULL,
  items             JSON        NOT NULL,
  status            ENUM('PENDIENTE','EN_PREPARACION','LISTO','ENTREGADO') NOT NULL DEFAULT 'PENDIENTE',
  created_at        TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at        TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
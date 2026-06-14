CREATE DATABASE IF NOT EXISTS agendapro_beauty;

USE agendapro_beauty;

CREATE TABLE usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
senha_hash VARCHAR(255) NOT NULL,
perfil VARCHAR(50) NOT NULL,
criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE areas (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
descricao TEXT
);

CREATE TABLE profissionais (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
especialidade VARCHAR(255),
telefone VARCHAR(20),
ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE status_agendamento (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
descricao VARCHAR(255)
);

CREATE TABLE servicos (
id INT AUTO_INCREMENT PRIMARY KEY,
area_id INT NOT NULL,
nome VARCHAR(255) NOT NULL,
duracao_min INT NOT NULL,
preco DECIMAL(10,2) NOT NULL,

```
FOREIGN KEY (area_id)
    REFERENCES areas(id)
```

);

CREATE TABLE horarios_trabalho (
id INT AUTO_INCREMENT PRIMARY KEY,
profissional_id INT NOT NULL,
dia_semana INT NOT NULL,
hora_inicio TIME NOT NULL,
hora_fim TIME NOT NULL,

```
FOREIGN KEY (profissional_id)
    REFERENCES profissionais(id)
```

);

CREATE TABLE horarios_bloqueados (
id INT AUTO_INCREMENT PRIMARY KEY,
profissional_id INT NOT NULL,
inicio DATETIME NOT NULL,
fim DATETIME NOT NULL,
motivo VARCHAR(255),

```
FOREIGN KEY (profissional_id)
    REFERENCES profissionais(id)
```

);

CREATE TABLE agendamentos (
id INT AUTO_INCREMENT PRIMARY KEY,
usuario_id INT NOT NULL,
profissional_id INT NOT NULL,
servico_id INT NOT NULL,
status_id INT NOT NULL,
data_hora_inicio DATETIME NOT NULL,
data_hora_fim DATETIME NOT NULL,
criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

```
FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id),

FOREIGN KEY (profissional_id)
    REFERENCES profissionais(id),

FOREIGN KEY (servico_id)
    REFERENCES servicos(id),

FOREIGN KEY (status_id)
    REFERENCES status_agendamento(id)
```

);

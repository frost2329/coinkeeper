CREATE TABLE users
(
    user_id    BIGSERIAL PRIMARY KEY,               -- Уникальный идентификатор пользователя
    username   VARCHAR(50)         NOT NULL,        -- Имя пользователя
    email      VARCHAR(100) UNIQUE NOT NULL,        -- Электронная почта
    family_id  BIGINT,                              -- Ссылка на семью (может быть NULL, если пользователь не в семье)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Дата создания записи
    FOREIGN KEY (family_id) REFERENCES families (family_id) ON DELETE SET NULL
);

CREATE TABLE families
(
    family_id   BIGSERIAL PRIMARY KEY,              -- Уникальный идентификатор семьи
    family_name VARCHAR(100) NOT NULL,              -- Название семьи
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Дата создания записи
);

CREATE TABLE purchase_types
(
    purchase_type_id BIGSERIAL PRIMARY KEY,                  -- Уникальный идентификатор типа покупки
    user_id          BIGINT,                                -- Ссылка на пользователя, который создал этот тип
    type_name        VARCHAR(100) NOT NULL,               -- Название типа покупки
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Дата создания записи
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE
);

CREATE TABLE purchases
(
    purchase_id      BIGSERIAL PRIMARY KEY,                  -- Уникальный идентификатор покупки
    user_id          BIGINT            NOT NULL,             -- Ссылка на пользователя, который совершил покупку
    purchase_type_id BIGINT            NOT NULL,             -- Ссылка на тип покупки
    amount           DOUBLE PRECISION NOT NULL,             -- Сумма покупки
    purchase_date    DATE             NOT NULL,             -- Дата покупки
    description      TEXT,                                -- Описание покупки (опционально)
    created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Дата создания записи
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE,
    FOREIGN KEY (purchase_type_id) REFERENCES purchase_types (purchase_type_id) ON DELETE CASCADE
);
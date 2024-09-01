-- +goose Up
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    anniversary TIMESTAMP,
    home_address TEXT,
    work_address TEXT,
    home_phone TEXT,
    mobile_phone TEXT,
    work_phone TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NOT NULL DEFAULT now(),
    deleted_at TIMESTAMP
);

-- +goose Down
DROP TABLE customers;
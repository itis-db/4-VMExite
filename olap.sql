CREATE TABLE dim_date (
    date_key BIGINT PRIMARY KEY,
    date DATE NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL,
    month INT NOT NULL,
    day INT NOT NULL
);

CREATE TABLE dim_product (
    product_key BIGINT PRIMARY KEY,
    product_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    valid_from DATE NOT NULL,
    valid_to DATE NOT NULL
);

CREATE TABLE dim_category (
    category_key BIGINT PRIMARY KEY,
    category_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    dept VARCHAR(255) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE dim_project(
    project_key BIGSERIAL PRIMARY KEY,
    project_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    manager VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE fact_transactions (
    transaction_id BIGSERIAL PRIMARY KEY,
    date_key BIGINT NOT NULL REFERENCES dim_date(date_key),
    product_key BIGINT NOT NULL REFERENCES dim_product(product_key),
    project_key BIGINT NOT NULL REFERENCES dim_project(project_key),
    category_key BIGINT NOT NULL REFERENCES dim_category(category_key),
    amount DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL
);
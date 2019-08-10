DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS merchants;

CREATE TABLE merchants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  transaction_time VARCHAR(255),
  transaction_date VARCHAR(255),
  tag_id INT REFERENCES tags(id),
  merchant_id INT REFERENCES merchants(id)
);

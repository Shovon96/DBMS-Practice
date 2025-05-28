# I have writen some basic interview questions of PostgreSQL

## 1. What is PostgreSQL?

### Answer:
PostgreSQL হলো একটা open-source, object-relational database system. এটা powerful এবং highly extensible, mane user নিজের custom functions, data types, এমনকি index type o define korte pare.

- It supports advanced features like:

- ACID compliance

- MVCC (Multi-Version Concurrency Control)

- Full-text search

- JSON & XML data support

## 2. What is the difference between CHAR, VARCHAR, and TEXT in PostgreSQL?

### Answer:
- `CHAR(n)` → Fixed length string. যদি value ছোট হয়, সেটা padding দিয়ে fill করে।

- `VARCHAR(n)` → Variable length string, max `n` length পর্যন্ত।

- `TEXT` → Unlimited length string.

Most of the time `TEXT` বা `VARCHAR` use করা হয়, কারণ PostgreSQL internally ওদের performance একই রকম, unless আপনি strict length validation চান।

## 3. What is a CTE (Common Table Expression)?

### Answer:
CTE মানে হল একটা temporary result set, যেটা query execution time এ define করা হয়।

এটা SQL code কে clean & readable করে তোলে, especially complex queries-এর ক্ষেত্রে।

```sql
WITH top_users AS (
  SELECT id, name FROM users WHERE score > 90
)
SELECT * FROM top_users WHERE name LIKE 'A%';
```
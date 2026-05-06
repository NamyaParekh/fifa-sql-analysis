# fifa-sql-analysis
# ⚽ FIFA Player SQL Analysis

## 📌 Overview

This project is a SQL-based analysis of football (soccer) player data.
It demonstrates how to design a relational database and perform meaningful analysis using SQL queries.

---

## 🗂️ Database Structure

The project uses **3 tables**:

### 1. PlayerStats

Stores player information:

* player_id (Primary Key)
* name
* club
* country
* age
* overall_rating

### 2. Positions

Stores position details:

* position_id (Primary Key)
* position_name (GK, ST, CM, etc.)

### 3. PlayerPositions

Bridge table for many-to-many relationship:

* player_id (Foreign Key)
* position_id (Foreign Key)

---

## 🔗 Key Concept

This project demonstrates a **many-to-many relationship**:

* One player can have multiple positions
* One position can have multiple players

---

## 🧠 Key Queries

### 🔹 Master Query (JOIN)

Combines all tables to show player + position data.

### 🔹 Top Players Analysis

* Top 5 players overall
* Top 3 players per position (using window functions)

### 🔹 Aggregations

* Average rating by club
* Average rating by country

### 🔹 Filtering

* Young talents (age ≤ 23)

---

## 🛠️ Skills Demonstrated

* SQL Joins (INNER JOIN)
* Aggregations (AVG, COUNT)
* Window Functions (RANK)
* Database Design
* Many-to-Many Relationships

---

## ▶️ How to Run

1. Run `schema.sql` to create tables
2. Run `data.sql` to insert data
3. Run `queries.sql` to perform analysis

---

## 📊 Sample Output

(Add screenshots here)

---

## 🚀 Future Improvements

* Build a "Best XI" team using SQL
* Add more player attributes (goals, assists, etc.)
* Connect to visualization tools like Power BI or Tableau

---

## 👨‍💻 Author
NAMYA PAREKH


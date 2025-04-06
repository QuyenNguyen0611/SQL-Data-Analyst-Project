🧩 **Purpose**

This project consolidates key customer metrics and behaviors to support targeted marketing, customer profiling, and strategic analysis.

---

### 🌟 **Highlights**

1. Extracts essential customer details such as names, ages, and transaction history.
2. Segments customers into meaningful categories: **VIP**, **Regular**, **New**, and age groups.
3. Aggregates customer-level metrics:
    - Total orders
    - Total sales
    - Total quantity purchased
    - Customer lifespan (in months)
4. Calculates key performance indicators (KPIs):
    - **Recency** (months since last order)
    - **Average Order Value (AOV)**
    - **Average Monthly Spend**

### 🛠 **Process Overview**

### 📥 Data Setup

To begin, I created two base tables — `dim_customer` and `fact_sales` — and loaded the necessary data into each.

![Screen Shot 2025-04-06 at 22 34 48](https://github.com/user-attachments/assets/f397c78d-3449-44a6-a0ac-baf18287ed2a)

![Screen Shot 2025-04-06 at 22 34 59](https://github.com/user-attachments/assets/e7ae1267-e405-4f6a-babe-ec62e971e0d9)

![Screen Shot 2025-04-06 at 22 36 13](https://github.com/user-attachments/assets/21f1b779-aa47-4a48-8dfb-fc679358253e)

### Step 1: Base Query

Extracted essential fields by joining sales and customer data. This included order details, customer names, and calculated **age** based on birthdate.

![Screen Shot 2025-04-06 at 22 37 29](https://github.com/user-attachments/assets/98f6db9c-33dc-4fd9-b3e4-aa4ce348a064)

### Step 2: Aggregation

Summarized key **customer-level metrics**: total sales, orders, quantity purchased, distinct products, last order date, and **lifespan.** 

![Screen Shot 2025-04-06 at 22 37 55](https://github.com/user-attachments/assets/4ba0331e-3edc-48f2-8597-60b17ada21b2)

### Step 3: Segmentation & KPI Calculation

Enhanced customer profiles by:

- Assigning **age groups** (e.g., "30–39", "50 and above")
- Segmenting customers by engagement: **New**, **VIP**, or **Regular**
- Calculating:
    - **Recency** (months since last order)
    - **Average Order Value**
    - **Average Monthly Spend**
      
![Screen Shot 2025-04-06 at 22 38 28](https://github.com/user-attachments/assets/d87d4b33-76d2-4477-a542-e1b71e81764b)

### ✅ **Final Output**

The result is a consolidated customer report in tabular form, ready for business reporting or dashboard integration.

![Screen Shot 2025-04-06 at 22 39 03](https://github.com/user-attachments/assets/dc57a1fb-08f1-44e5-8b0f-b07fe3d1d4bf)


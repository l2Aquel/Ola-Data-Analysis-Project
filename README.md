# 🚖 Ola Booking Insights Dashboard & SQL Analysis

## 1. Project Title / Headline
An end-to-end data analytics project that explores ride booking performance for Ola in Bengaluru, India. Built with Power BI for visual analytics and SQL for backend querying, this project uncovers insights on ride volume, cancellations, customer behavior, and revenue trends for over 100,000 simulated bookings.

## 2. Short Description / Purpose
The Ola Booking Insights Dashboard is a Power BI and SQL-based data analytics solution designed to simulate real-world booking operations for Ola Cabs. With over 1 lakh entries for the city of Bengaluru, the project uncovers patterns in ride performance, customer preferences, and operational gaps using SQL queries and dynamic visual dashboards.

## 3. Tech Stack
This project leverages the following technologies:

- 📊 **Power BI Desktop** – Primary visualization platform for dashboard development  
- 🧼 **Power Query** – Used to clean and transform the raw data  
- 🧠 **DAX (Data Analysis Expressions)** – For calculated KPIs and measures  
- 🧱 **Data Modeling** – Relationships between booking, customer, and metrics tables  
- 🐘 **MySQL / SQL** – For running and creating views to extract analytical insights  
- 📁 **File Types** – `.pbix`, `.sql`, `.pdf`

## 4. Data Source
**Source**: Simulated data created using ChatGPT and Excel formulas based on realistic Ola ride patterns.  
**City**: Bengaluru  
**Period**: July 2024  
**Volume**: 1,03,024 rows  
**Key Fields**:
- Booking ID, Date, Time
- Vehicle Type, Pickup & Drop Locations
- Booking Status (Success / Cancelled / Incomplete)
- VTAT, CTAT, Ratings
- Payment Method, Booking Value
- Cancellation Reasons (Customer/Driver)
- Incomplete Ride Reasons

## 5. Features / Highlights
### • Business Problem
Ride-hailing companies like Ola deal with fluctuating ride demand, high cancellation rates, and the need to improve customer and driver experiences. Understanding operational KPIs such as successful bookings, average distance, cancellations, and top customers is essential for business performance and customer satisfaction.

---

### • Goal of the Dashboard
To deliver an analytics solution that:
- Tracks ride booking behavior and status
- Analyzes cancellation trends and revenue flows
- Compares driver and customer satisfaction
- Supports business intelligence and strategy teams in decision-making

---

### • Walkthrough of Key Power BI Visuals

🔹 **Booking Status Breakdown (Pie Chart)**  
- Success: 62.09%  
- Cancelled by Driver: 17.89%  
- Cancelled by Customer: 10.19%  
- Driver Not Found: 9.83%

🔹 **Ride Volume Over Time (Line Chart)**  
Shows day-wise trends in booking volume across July 2024.

🔹 **KPIs (Cards)**  
- Total Bookings: 1,03,024  
- Total Booking Value: ₹35 Million  
- Cancellation Rate: 28.08%

🔹 **Revenue by Payment Method (Bar Chart)**  
Cash, UPI, Credit Card, and Debit Card analyzed for booking value contribution.

🔹 **Top 5 Customers (Table Visual)**  
Displays high-spending customers and their booking value.

🔹 **Cancelled Rides by Reason (Bar Charts)**  
Separate breakdown for customer and driver cancellation reasons.

🔹 **Customer vs. Driver Ratings (Line Chart)**  
Both ratings hover around 4.00 — consistent but slightly fluctuating.

6. Screenshots / Demos



### • SQL Logic & Insights

1. Retrieve all successful bookings
   create view successful_bookings as select * from bookings where Booking_Status = 'Success';
   
2. Average ride distance by vehicle type
   create view avg_distance_per_vehicle_type as select Vehicle_Type, avg(Ride_Distance) as Avg_Ride_Distance from bookings group by Vehicle_Type;
   
3. Count of bookings cancelled by customers
   create view no_cancelled_rides_by_customers as select count(*) from bookings where Booking_Status = 'Canceled by Customer';
   
4. Top 5 most frequent customers
   create view top_5_customers as select Customer_ID,count(Booking_Id) as total_rides from bookings group by Customer_ID order by total_rides desc limit 5;
   
5. Cancellations by drivers due to personal or car issues
   create view cancelled_by_driver_due_to_PnCr_issues as select count(*) from bookings where Canceled_Rides_by_Driver = 'Personal & Car related issue';
     
6. Min/Max driver rating for Prime Sedan
   create view min_max_rating_prime_sedan as select max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating from bookings where Vehicle_Type = 'Prime Sedan';
    
7. Retrieve rides with UPI payments
   create view payment_method_upi as select * from bookings where Payment_Method = 'UPI';
    
8. Average customer rating per vehicle type
   create view vehicle_type_ratings as select Vehicle_Type, round(avg(Customer_Rating),2) as avg_cust_rating_vehicle_type from bookings group by Vehicle_Type;
    
9. Total value of successful bookings
   create view total_successfull_booking_value as select sum(Booking_Value) as total_booking_value from bookings where Booking_Status = 'Success';
     
10. Incomplete rides and associated reasons
    create view incomplete_rides_reason as select  Booking_ID, Incomplete_Rides_Reason from bookings where Incomplete_Rides = 'Yes';


## 📈 Business Impact & Insights

- 🔍 **Insightful Cancellations**: Over 28% cancellations point to a need for improved driver allocation and user experience.
- 💰 **Customer Loyalty**: Top 5 customers generated nearly ₹30K+ in value, showcasing strong power-user segments.
- 📉 **Consistent Ratings**: Driver and customer ratings maintain a healthy average ~4.0, indicating moderate satisfaction levels.
- 💸 **UPI Usage**: Digital payments like UPI dominate, offering scope for fintech tie-ups or rewards.
- 📊 **Distance & Vehicle Match**: Strategic vehicle-type distribution by distance helps plan fleet allocation better.
    

USE OLA;

select * from bookings;

#Q1 Retrieve all successful bookings
create view successful_bookings as select * from bookings where Booking_Status = 'Success';
select * from successful_bookings;

#Q2 Find the average ride distance for each vehicle type
create view avg_distance_per_vehicle_type as select Vehicle_Type, avg(Ride_Distance) as Avg_Ride_Distance from bookings group by Vehicle_Type;
select * from avg_distance_per_vehicle_type;

#Q3 Get the total number of cancelled rides by customers
create view no_cancelled_rides_by_customers as select count(*) from bookings where Booking_Status = 'Canceled by Customer';
select * from no_cancelled_rides_by_customers;

#Q4 List the top 5 customers who booked the highest number of rides
create view top_5_customers as select Customer_ID,count(Booking_Id) as total_rides from bookings group by Customer_ID order by total_rides desc limit 5;
select * from top_5_customers;

#Q5 Get the number of rides cancelled by drivers due to personal and car-related issues
create view cancelled_by_driver_due_to_PnCr_issues as select count(*) from bookings where Canceled_Rides_by_Driver = 'Personal & Car related issue';
select * from cancelled_by_driver_due_to_PnCr_issues;

#Q6 Find the maximun and minimum driver ratings for Prime Sedan bookings
create view min_max_rating_prime_sedan as select max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating from bookings where Vehicle_Type = 'Prime Sedan';
select * from min_max_rating_prime_sedan;

#Q7 Retrieve all rides where payment was made using UPI
create view payment_method_upi as select * from bookings where Payment_Method = 'UPI';
select * from payment_method_upi;

#Q8 Find the average customer rating per vehicle type
create view vehicle_type_ratings as select Vehicle_Type, round(avg(Customer_Rating),2) as avg_cust_rating_vehicle_type from bookings group by Vehicle_Type;
select * from vehicle_type_ratings;

#Q9 Calculate the total booking value of rides completed successfully
create view total_successfull_booking_value as select sum(Booking_Value) as total_booking_value from bookings where Booking_Status = 'Success';
select * from total_successfull_booking_value;

#Q10 List all incomplete rides along with the reasson
create view incomplete_rides_reason as select  Booking_ID, Incomplete_Rides_Reason from bookings where Incomplete_Rides = 'Yes';
select * from incomplete_rides_reason;













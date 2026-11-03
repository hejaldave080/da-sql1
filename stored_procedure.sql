-- sp_db
-- Q1.  Create a procedure that shows all students.
-- Q2.  Create a procedure that takes a city and shows students of that city.
-- Q3.  Create a procedure that takes a course and shows its students,
--      newest joined first.
-- Q4.  Create a procedure that takes a minimum and maximum fees and shows
--      students whose fees are between them.
-- Q5.  Create a procedure that returns (OUT) the total number of students.
-- Q6.  Create a procedure that takes a student_id and returns (OUT) the
--      total amount paid by that student.
-- Q7.  Create a procedure that shows each student's name, fees, total paid
--      and pending amount (fees - paid).
-- Q8.  Create a procedure that takes a student_id and shows
--      'Fully Paid' if paid >= fees, 'Partially Paid' if paid > 0,
--      otherwise 'Not Paid'.
-- Q9.  Create a procedure that adds a new payment
--      (student_id, amount) with today's date.
-- Q10. Create a procedure that takes a course and a percentage and
--      increases the fees of that course by that percentage.

select * from payments;
select * from students;

-- Q1
delimiter //
create procedure All_Students ()
begin
select name from students ;
end //
delimiter ;

call All_students();

-- q2
delimiter //
create procedure city_data( in p_city varchar(30))
begin
select * from students where city=p_city;
end //
delimiter ;
call city_data('jaipur');

-- q3
delimiter //
create procedure student_name(in p_cousrse varchar (30))
begin
select * from students where course=p_cousrse 
order by join_date desc;
end //
delimiter ;
call student_name('data analytics');

-- q4 
delimiter //
create procedure min_max_fee(in p_min int, in p_max int)
begin 
select * from students where fees between p_min and p_max;
end //
delimiter ;
call min_max_fee(25000,40000);

-- q5
delimiter //
create procedure tot_stu(out P_COUNT int)
begin
select count(*) into P_COUNT from students;
end //
delimiter ; 
call tot_stu(@P_COUNT);
select @P_COUNT as std_count;

-- q6
delimiter //
create procedure tot_fee(in s_id int,out toto_fee int)
begin 
select sum(p.amount) into toto_fee from payments p inner join students s on s.student_id=p.student_id where p.student_id=s_id;
end //
delimiter ;
call tot_fee(2,@toto_fee);
select @toto_fee as totalFee;

-- q7
delimiter //
create procedure std_fee_detail()
begin
select s.name,s.student_id,sum(p.amount)as tot_amount, s.fees,(s.fees-sum(p.amount)) as total_pending from students s 
inner join payments p on s.student_id=p.student_id group by s.student_id,s.name;
end //
delimiter ;
call std_fee_detail();
 
-- q8
delimiter //
create procedure Fee_detail(in s_id int
)
begin
select s.name,s.student_id,sum(p.amount)as paid,s.fees,
case
when sum(p.amount)>=s.fees then 'fully paid'
when sum(p.amount)>0 then 'partially paid'
else 'not paid'
end as payment_status
from students s inner join payments p on s.student_id=p.student_id
group by s.name,s.student_id;
end //
delimiter ;
call Fee_detail(1);

-- q9
delimiter //
create procedure Add_payment(in p_student_id int, in p_amount decimal (10,2))
begin 
insert into payments(student_id,amount,payment_date)
values(p_student_id,p_amount,curdate());
end //
delimiter ;
call Add_payment(1,20000.00);
select * from payments;
-- q10
delimiter //
create procedure fee_increase(in p_course varchar (30),in p_percentage decimal (5,2))
begin
update students
set fees=fees+(fees*p_percentage/100)
where course=p_course;
end //
delimiter ;
call fee_increase('data analytics',10.00);
select * from students;







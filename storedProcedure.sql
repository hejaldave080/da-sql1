select * from products;
select * from employees;
select * from orders;
select * from customers;

delimiter //
 create procedure Product_Above_price(in product_Cat varchar(20),
            product_price int)
begin
select * from products 
where category= product_Cat
and
price>product_price;
end
// 
delimiter ;
call Product_Above_price('Electronics',2000);


delimiter //
create procedure Cus_NAme_Start(in Cus_name_letter varchar (2))
begin
select * from customers where customer_name like concat( Cus_name_letter,'%');
end //
delimiter ;
 call Cus_NAme_Start('a');
 
 
 delimiter //
 create procedure cus_date(in cus_sign date)
 begin
 select * from customers where signup_date>cus_sign;
 end//
 delimiter ;
 call cus_date('2024-01-10');
 
 
 delimiter //
 create procedure top_cost_product(in n_product int)
 begin
 select * from products
 order by price desc
 limit n_product;
 end //
 delimiter ;
 call top_cost_product(5);
 
 delimiter //
 create procedure emp_bonus(
         in emp_idd int,
         out bonus_cal int
 )
 begin
 declare dept_name varchar (30);
 select department into dept_name from employees
 where emp_id=emp_idd;
 if dept_name='sales' then set bonus_cal=5000;
 elseif dept_name='IT' then set bonus_cal=4000;
 elseif dept_name is null then  set bonus_cal=0;
 else set bonus_cal=3000;
 end if;
 end;
 //
 delimiter ;
 
 call emp_bonus(7,@bonus_calu);
 select @bonus_calu as bonus ;
 
 delimiter //
  -- - --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
 -- ecomerse_analysis
delimiter //
 create procedure Category_IDOrd(
  in id int)
 begin
 select * from products
 where Category_ID=id;
end// delimiter ;

call Category_IDOrd(10);

delimiter //
 create procedure Category_NAme(
  in cName varchar(30) )
 begin
 select * from products p inner join categories c on p.Category_ID=c.Category_ID
 where c.Category_Name=cName ;
end// delimiter ;

call Category_NAme('Category_1');
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
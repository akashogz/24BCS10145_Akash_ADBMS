Experiment 6.2:
-- MATERIALIZED VIEW :

create  materialized view emp_view_mv as 
select emp_id , emp_name from employees_krg
where emp_city = 'Delhi'
with data ;
select * from emp_view_mv

create  materialized view emp_view_mv_2 as 
select emp_id , emp_name from employees_krg
where emp_city = 'Delhi'
with no data ;
-- it keep only schema
select * from emp_view_mv_2;

refresh materialized view emp_view_mv_2;
-- now it contains rows 
select * from emp_view_mv_2;
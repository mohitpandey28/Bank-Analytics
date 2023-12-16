CREATE DATABASE BANK_ANALYTICS;
use bank_analytics;

select count(*) from finance_1;finance_1

#-----------------kpi 1------->YEAR WISE LOAN AMOUNT-------------------------------------#
select year,
sum(loan_amnt)  from finance_1
group by year
order by year;

#------------kpi 2---------->GRADE,SUBGRADE WISE REVOL_BAL---------------------------------#
select grade,sub_grade,
sum(revol_bal)
from finance_1 f1 inner join finance_2 f2
on f1.id=f2.id
group by f1.grade,f1.sub_grade
order by f1.grade,f1.sub_grade;

#----------------kpi 3------>TOTAL PAYMENT FOR VERIFIED AND NOT VERIFIED STATUS------------#

select verification_status,sum(total_pymnt) as 'total payment'
from finance_1 f1 inner join finance_2 f2
on f1.id=f2.id
where verification_status in ('verified','not verified')
group by f1.verification_status;

#-------------------kpi 4----->STATE WISE ,LAST_CREDIT_PULL_D WISE LOAN STATUS-------------#

select addr_state,last_credit_pull_d,loan_status
from finance_1 f1 inner join finance_2 f2
on f1.id=f2.id
order by f1.addr_state,f2.last_credit_pull_d;

#-------------kpi 5--------->HOME_OWNERSHIP VS LAST_PYMNT_D--------------------------------#

select home_ownership,max(last_pymnt_d)
from finance_1 f1 inner join finance_2 f2
on f1.id=f2.id
group by f1.home_ownership;


#----------------kpi 7--------------------------------->total customer--------------------#

select count(member_id)  as 'total customer' from finance_1;

#---------------------kpi 8------------------->total loan amount--------------------------#

select sum(loan_amnt) as 'total loan amount' from finance_1;


#-------------------kpi 9--------------------->total funded amount------------------------#

select sum(funded_amnt) as 'total funded amount'  from finance_1;



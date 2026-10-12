create database bank_loan;
use bank_loan;

select * from loan_approved_clean;
select count(*) from loan_approved;

alter table loan_approved_clean rename to l_approved;
select * from l_approved;

-- Overall Performance (Dashboard Overview) 
-- What is the total number of loan applications? 
select count(*) from l_approved;
 
-- How many applications were approved vs rejected?  
select loan_status, count(*) from l_approved group by loan_status;

-- What is the overall loan approval rate?

  
-- What is the average loan amount issued?  
select avg(loanamount) as avg_loanAmount from l_approved;

select round(avg(loanamount), 2) as avg_loan_amount from l_approved where Loan_Status(Approved) = 'Y';

-- What is the average applicant income?  
select round(avg(applicantincome+coapplicantincome), 2) as avg_applicant_income from l_approved;

-- What is the overall loan approval rate?
-- What is the overall loan approval rate?

SELECT 
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS loan_approval_rate
FROM l_approved;

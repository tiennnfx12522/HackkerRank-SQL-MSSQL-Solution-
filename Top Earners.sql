SELECT MAX(salary * months), COUNT(salary * months) FROM EMPLOYEE 
WHERE salary * months in (SELECT MAX(salary * months) from EMPLOYEE)
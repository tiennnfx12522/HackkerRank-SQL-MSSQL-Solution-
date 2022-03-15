SELECT c.COMPANY_CODE, c.FOUNDER, 
COUNT(DISTINCT lm.lead_manager_code) AS lead_manager, 
COUNT(DISTINCT sm.senior_manager_code) AS senior_manager,
COUNT(DISTINCT m.manager_code) AS manager,
COUNT(DISTINCT e.employee_code) AS employee FROM COMPANY as c
JOIN LEAD_MANAGER AS lm ON lm.company_code = c.company_code
JOIN SENIOR_MANAGER as sm ON sm.company_code = c.company_code
JOIN MANAGER as m ON m.company_code = c.company_code
JOIN EMPLOYEE as e ON e.company_code = c.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code ASC;


SELECT COUNT(CASE WHEN title = 'Staff' THEN 1 END) AS NumOFStaff, 
COUNT(CASE WHEN title LIKE '%Senior%' THEN 1 END) AS NumOFSeniorStaff
FROM titles

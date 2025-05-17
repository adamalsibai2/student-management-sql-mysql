SELECT 
    c.course_name, 
    COUNT(e.student_id) AS student_count
FROM 
    Courses c
LEFT JOIN 
    Enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_name;
SELECT 
    c.course_name,
    MIN(e.grade) AS min_grade,
    MAX(e.grade) AS max_grade
FROM 
    Courses c
JOIN 
    Enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_name;
SELECT 
    s.first_name, 
    s.last_name, 
    SUM(c.credits) AS total_credits
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
JOIN 
    Courses c ON e.course_id = c.course_id
GROUP BY 
    s.student_id;
SELECT 
    c.course_name,
    AVG(CASE 
            WHEN e.grade = 'A' THEN 4
            WHEN e.grade = 'B' THEN 3
            WHEN e.grade = 'C' THEN 2
            WHEN e.grade = 'D' THEN 1
            WHEN e.grade = 'F' THEN 0
        END) AS avg_grade
FROM 
    Courses c
JOIN 
    Enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_name;
SELECT 
    c.course_name,
    AVG(CASE 
            WHEN e.grade = 'A' THEN 4
            WHEN e.grade = 'B' THEN 3
            WHEN e.grade = 'C' THEN 2
            WHEN e.grade = 'D' THEN 1
            WHEN e.grade = 'F' THEN 0
        END) AS avg_grade
FROM 
    Courses c
JOIN 
    Enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_name
HAVING 
    avg_grade > 3;  -- Equivalent to a grade of 'B' or better
SELECT 
    c.course_name, 
    COUNT(e.student_id) AS student_count
FROM 
    Courses c
LEFT JOIN 
    Enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_name
ORDER BY 
    student_count DESC;
SELECT 
    d.department_name
FROM 
    Departments d
JOIN 
    Courses c ON d.department_id = c.department_id
GROUP BY 
    d.department_name
HAVING 
    COUNT(c.course_id) > 5;
SELECT 
    s.first_name,
    s.last_name,
    COUNT(e.course_id) AS total_courses
FROM 
    Students s
LEFT JOIN 
    Enrollments e ON s.student_id = e.student_id
GROUP BY 
    s.student_id
ORDER BY 
    total_courses DESC;
SELECT 
    c.course_name,
    COUNT(e.student_id) AS student_count
FROM 
    Courses c
LEFT JOIN 
    Enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_name
HAVING 
    student_count < 10;
SELECT 
    d.department_name,
    COUNT(DISTINCT e.student_id) AS total_students
FROM 
    Departments d
JOIN 
    Courses c ON d.department_id = c.department_id
JOIN 
    Enrollments e ON c.course_id = e.course_id
GROUP BY 
    d.department_name
HAVING 
    total_students > 100;
SELECT 
    s.first_name, 
    s.last_name, 
    c.course_name, 
    CONCAT(i.first_name, ' ', i.last_name) AS instructor_name
FROM 
    Enrollments e
JOIN 
    Students s ON e.student_id = s.student_id
JOIN 
    Courses c ON e.course_id = c.course_id
JOIN 
    Instructors i ON c.instructor_id = i.instructor_id;

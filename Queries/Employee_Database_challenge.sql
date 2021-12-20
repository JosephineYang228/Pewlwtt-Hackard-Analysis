-- Use Dictinct with Orderby to create retirement_titles
SELECT DISTINCT em.emp_no,
				em.first_name,
				em.last_name,
				tl.title,
				tl.from_date,
				tl.to_date
INTO retirement_titles
FROM employees AS em
LEFT JOIN titles AS tl
ON em.emp_no = tl.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;

-- Use Dictinct with Orderby to create unique_titles
SELECT DISTINCT ON (rt.emp_no)rt.emp_no, 
					rt.first_name,
					rt.last_name,
					rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no;

-- Employee count by titles
SELECT COUNT(ut.title), ut.title
FROM unique_titles AS ut
GROUP BY ut.title;

-- Use Dictinct with Orderby to create mentorship_eligibity
SELECT DISTINCT ON (em.emp_no)em.emp_no,
				em.first_name,
				em.last_name,
				em.birth_date,
                de.from_date,
                de.to_date,
                tl.title
INTO mentorship_eligibility
FROM employees AS em
INNER JOIN dept_emp AS de
ON (em.emp_no = de.emp_no)
INNER JOIN titles AS tl
ON (em.emp_no = tl.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no;
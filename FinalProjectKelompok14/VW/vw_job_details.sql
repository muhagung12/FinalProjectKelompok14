CREATE VIEW job_details AS
SELECT j.id, j.title, j.min_salary, j.max_salary FROM tbl_jobs j;
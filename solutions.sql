--Query #1

SELECT cpu_number, id, total_mem 
FROM host_info 
ORDER BY cpu_number, total_mem;

-- Query #2
SELECT	id, hostname, total_memory,
	ROUND((total_memory - (1000*avg_free_mem))/total_memory, 1)
FROM (
	SELECT host_info.id, host_info.hostname, host_info.total_mem AS total_memory, AVG(use.memory_free)
		OVER(
			PARTITION BY info.id
			ORDER BY use.timestamp
			ROWS BETWEEN 4 PRECEDING AND CURRENT ROW)
		AS avg_free_mem
	FROM host_info info INNER JOIN host_usage use ON info.id = use.host_id
	) AS sub
ORDER BY id DESC;


--psql -h localhost -U postgres host_agent -c 

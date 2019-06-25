#1. Introduction
This project acts as a internal Cluster Monitor Agents monitoring valuable information about cluster resources, including the hosts general cpu information. This project automates usage reports ofhigh value target data allowing maintance teams the ability to view how components are affected while running other jobs. This project also detects cpu discrepencies while running other jobs, detect node failures and stores all logs in a host_agent database.

## 2. Architecture and Design
1)  **Draw a cluster diagram with three Linux hosts, a DB, and agents**
2) **Table Descriptions**
	- host_info table:
			> Contains host cpu statistics
	- host_usage table:
			> Contains data on host usage logs at different timestamps with host_id as a foreign key   
3) **Script Description**
	- host_info.sh:
			> Accepts 5 command line inputs and stores them as variables
											
			>Parse through CLI commands to get high value data
															
			>Insert parsed data into host_agent.db's host_info table
																			
			>Return host_id from the host_info table and write to a host_id file to save host_id's

	- host_usage.sh:
			>Accepts 5 command line inputs and stores them as variables
																										
			>Parse through CLI commands to get high value data
																														
			>Insert parsed data into host_agents.db's host_usage table
																																		
			>runs crontab scheduler to automate this script, updating host_usage table
																																						
## Usage
1) How to init database and tables
2) `host_info.sh` usage:
3) `host_usage.sh` usage
4) crontab setup

##  Improvements	

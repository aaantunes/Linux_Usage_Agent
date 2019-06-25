# 1. Introduction

This project acts as a internal Cluster Monitor Agents monitoring valuable information about cluster resources, including the hosts general cpu information. This project automates usage reports ofhigh value target data allowing maintance teams the ability to view how components are affected while running other jobs. This project also detects cpu discrepencies while running other jobs, detect node failures and stores all logs in a host_agent database.

## 2. Architecture and Design

### **2.1 Draw a cluster diagram with three Linux hosts, a DB, and agents**

### **2.2 Table Descriptions**
`host_info table`:

Contains host cpu statistics

`host_usage table`:

Contains data on host usage logs at different timestamps with host_id as a foreign key   

### **3.3 Script Descriptions**
**host_info.sh**

> Accepts 5 command line inputs and stores them as variables
											
> Parse through CLI commands to get high value data
															
> Insert parsed data into host_agent.db's host_info table
																			
> Return host_id from the host_info table and write to a host_id file to save host_id's

**host_usage.sh** 
		
> Accepts 5 command line inputs and stores them as variables
																										
> Parse through CLI commands to get high value data
																														
> Insert parsed data into host_agents.db's host_usage table
																																		
> runs crontab scheduler to automate this script, updating host_usage table
																																						
## 3. Usage

### 3.1 Initiate database and tables
To create the database, run the init.sql script. This can be done by entering the command `psql -h localhost -U postgres -W host_agent -f init.sql`. This command initializes both the host_info and host_usage table in the host_agent database.

### 3.2 `host_info.sh` usage:
This script only needs to be run once for every host. This script can be run by entering the command `bash host_info.sh psql_host psql_port db_name psql_user psql_password`. Thus, this command expects 5 arguments to be passed including: 
- psql_host
- psql_port
- database_name
- psql user
- psql password

### 3.3 `host_usage.sh` usage
This script runs whenever a user wants to track the current resource usage information. This script expects the same arguments as in `host_info.sh` and can be run by entering the command `bash host_usage.sh psql_host psql_port db_name psql_user psql_password`.


### 3.4  Crontab Setup 
Crontab is a schedular which can automate the execution of a script. In this project, we will setup a Crontab schedular to execute the `host_usage.sh` script every minute. To do this, enter the command `crontab -e` and then edit the file by entering `* * * * * bash /host_usage.sh psql_host psql_port db_name psql_user psql_password`. 

##  Improvements	

- handle hardware updates
- create script to automate postgresql queries






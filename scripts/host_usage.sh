#!/bin/bash

#Setup args

psql_host=#1
port=$2
db_name=$3
user_name=$4
password=$5

vmstat_t=$(vmstat -t)

#timestamp, host id, memory_free, cpu_idel, cpu_kernel, disk_io, disk_available
timse=$(echo $(vmstat -t) | awk '{print $43 " " $44}')




#Step 1: Parse data and set up vars


#Step 2: Set up INSERT statement


#Step 3: Execute INSERT statement


#Step 4: Save host_id??











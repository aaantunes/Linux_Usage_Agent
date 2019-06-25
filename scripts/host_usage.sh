#!/bin/bash

#Setup args

psql_host=$1
port=$2
db_name=$3
user_name=$4
password=$5

#Step 1: Parse data and set up vars
timestamp=$(echo $(date "+%Y-%m-%d %T"))
host_id=$(cat ~/host_id)
memory_free=$(echo $(vmstat --unit M | tail -1 | awk '{print $4}'))
cpu_idel=$(echo $(sar -u | tail -1 | awk '{print $8}'))
cpu_kernel=$(echo $(sar -u | tail -1 | awk '{print $5}'))
disk_io=$(echo $(vmstat -d | tail -1 | awk '{print $8}'))
disk_available=$(echo $(df -BM / | tail -1 | awk '{print $4}' | sed s/M//g))

#DEBUGGING
echo "time: $timestamp"
echo "USERID: $host_id"
echo "mem_free:  $memory_free"
echo "cpu_idel(%): $cpu_idel"
echo "cpu_kernel(%): $cpu_kernel"
echo "disk_io: $disk_io"
echo "disk_available: $disk_available"

#Step 2: Set up INSERT statement
insert_stmt=$(cat <<-END
INSERT INTO host_usage ("timestamp", host_id, memory_free, cpu_idel, cpu_kernel, disk_io, disk_available) VALUES ('${timestamp}', ${host_id}, ${memory_free}, ${cpu_idel}, ${cpu_kernel}, ${disk_io}, ${disk_available});
END
)
echo $insert_stmt

#Step 3: Execute INSERT statement
export PGPASSWORD=$password
psql -h $psql_host -p $port -U $user_name -d $db_name -c "$insert_stmt"
sleep 1

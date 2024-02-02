#!/bin/bash

ps -ef | grep 'lttng-sessiond' | grep -v grep > /dev/null
if [ $? -ne 0 ]; then
  lttng-sessiond --daemonize
else
  echo "lttng-sessiond is runing..."
fi

lttng create em_tracing --output=$(pwd)/em_trace/$(date +%Y%m%dT%H-%M-%S)



#lttng enable-event --kernel sched_switch,sched_process_fork,kmem_mm_page_alloc,kmem_mm_page_free
#lttng enable-event --kernel sched_switch,sched_process_fork
lttng enable-event --userspace em_tracing:function_exit,em_tracing:function_enter

lttng start

# /home/dev/01_work/04_crayon-masp/02_EM_SM_crayon-masp/src/framework/em/scripts

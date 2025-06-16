function time_service_begins = time_service_begins(arrival_time, time_service_ends)
if (time_service_ends < arrival_time)
    time_service_begins = arrival_time;
else
time_service_begins = time_service_ends;
end

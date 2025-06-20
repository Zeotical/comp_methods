function [pump,serv_begins] = pump_Servtime(arrival,p1_time_service_ends,p2_time_service_ends,p3_time_service_ends,p4_time_service_ends,line, pump,serv_begins)

if (line == 1)
  if (arrival < p1_time_service_ends && arrival < p2_time_service_ends)
    if(p1_time_service_ends < p2_time_service_ends)
    pump = 1;
    serv_begins = p1_time_service_ends ;
    else
    pump = 2;
    serv_begins = p2_time_service_ends;
    endif
  else
    if (arrival > p1_time_service_ends)
     pump = 1;
     serv_begins = arrival;
    else
    pump = 2;
    serv_begins = arrival;
   endif
 endif

elseif (line == 2)
  if (arrival < p3_time_service_ends && arrival < p4_time_service_ends)
    if(p3_time_service_ends < p4_time_service_ends)
    pump = 3;
    serv_begins = p3_time_service_ends ;
    else
    pump = 4;
    serv_begins = p4_time_service_ends;
    endif
  else
    if (arrival > p3_time_service_ends)
     pump = 3;
     serv_begins = arrival;
    else
    pump = 4;
    serv_begins = arrival;
   endif
 endif
end





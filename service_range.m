function service_time = service_range(random_rn_service)
    if(1<=random_rn_service && random_rn_service <=10)
        service_time  = 1;
    elseif (11<=random_rn_service && random_rn_service <=30)
        service_time  = 2;
    elseif (31<=random_rn_service && random_rn_service <=60)
        service_time  = 3;
    elseif (61<=random_rn_service && random_rn_service <=85)
         service_time = 4;
    elseif (86<=random_rn_service && random_rn_service <=95)
         service_time = 5;
    elseif (96<=random_rn_service && random_rn_service <=100)
         service_time = 6;
    end
end

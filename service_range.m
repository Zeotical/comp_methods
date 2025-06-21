function service_time = service_range(random_rn_service)
    if(0<=random_rn_service && random_rn_service <=5)
        service_time  = 5;
    elseif (6<=random_rn_service && random_rn_service <=15)
        service_time  = 6;
    elseif (16<=random_rn_service && random_rn_service <=40)
        service_time  = 7;
    elseif (41<=random_rn_service && random_rn_service <=80)
         service_time = 8;
    elseif (81<=random_rn_service && random_rn_service <=95)
         service_time = 9;
    elseif (96<=random_rn_service && random_rn_service <=99)
         service_time = 10;

    end
end

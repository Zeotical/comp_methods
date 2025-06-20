 function inter_arriv = arrive_range(random_rn_arrive, simulation_type)
   %Peak hours
 if (simulation_type == 1)
    if(0<=random_rn_arrive && random_rn_arrive <=399)
        inter_arriv = 1;
    elseif (400<=random_rn_arrive && random_rn_arrive <=699)
        inter_arriv = 2;
    elseif (700<=random_rn_arrive && random_rn_arrive <=849)
        inter_arriv = 3;
    elseif (850<=random_rn_arrive && random_rn_arrive <=919)
        inter_arriv = 4;
    elseif (920<=random_rn_arrive && random_rn_arrive <=959)
        inter_arriv = 5;
    elseif (960<=random_rn_arrive && random_rn_arrive <=979)
        inter_arriv = 6;
    elseif (980<=random_rn_arrive && random_rn_arrive <=989)
        inter_arriv = 7;
    elseif (990<=random_rn_arrive && random_rn_arrive <=999)
       inter_arriv = 8;
    end
 elseif (simulation_type == 2)
   %Non-peak hours
    if(0<=random_rn_arrive && random_rn_arrive <=19)
        inter_arriv = 1;
    elseif (20<=random_rn_arrive && random_rn_arrive <=69)
        inter_arriv = 2;
    elseif (70<=random_rn_arrive && random_rn_arrive <=169)
        inter_arriv = 3;
    elseif (170<=random_rn_arrive && random_rn_arrive <=319)
        inter_arriv = 4;
    elseif (320<=random_rn_arrive && random_rn_arrive <=569)
        inter_arriv = 5;
    elseif (570<=random_rn_arrive && random_rn_arrive <=749)
        inter_arriv = 6;
    elseif (750<=random_rn_arrive && random_rn_arrive <=849)
        inter_arriv = 7;
    elseif (850<=random_rn_arrive && random_rn_arrive <=919)
       inter_arriv = 8;
    elseif (920<=random_rn_arrive && random_rn_arrive <=969)
       inter_arriv = 9;
    elseif (970<=random_rn_arrive && random_rn_arrive <=999)
       inter_arriv = 10;
    end
 end
end

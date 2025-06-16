 function inter_arriv = arrive_range(random_rn_arrive)
    if(1<=random_rn_arrive && random_rn_arrive <=125)
        inter_arriv = 1;
    elseif (126<=random_rn_arrive && random_rn_arrive <=250)
        inter_arriv = 2;
    elseif (251<=random_rn_arrive && random_rn_arrive <=375)
        inter_arriv = 3;
    elseif (376<=random_rn_arrive && random_rn_arrive <=500)
        inter_arriv = 4;
    elseif (501<=random_rn_arrive && random_rn_arrive <=625)
        inter_arriv = 5;
    elseif (626<=random_rn_arrive && random_rn_arrive <=750)
        inter_arriv = 6;
    elseif (751<=random_rn_arrive && random_rn_arrive <=875)
        inter_arriv = 7;
    elseif (876<=random_rn_arrive && random_rn_arrive <=1000)
       inter_arriv = 8;
    else
    inter_arriv = 0;
    end
end

function [petrol_num,petrol,price_per_litre] = petrol_type(random_rn_arrive)
    if(0<=random_rn_arrive && random_rn_arrive <=574)
        petrol_num = 1;
        petrol = "RON95";
        price_per_litre = 2.05;
    elseif (575<=random_rn_arrive && random_rn_arrive <=779)
        petrol_num = 2;
        petrol = "RON97";
        price_per_litre = 3.14;
    elseif (780<=random_rn_arrive && random_rn_arrive <=820)
        petrol_num = 3;
        petrol = "RON100";
        price_per_litre = 5.00;
    elseif (821<=random_rn_arrive && random_rn_arrive <=999)
        petrol_num = 4;
        petrol = "Diesel";
        price_per_litre = 2.81;
    end

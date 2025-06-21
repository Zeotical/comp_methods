function [petrol_num,petrol,price_per_litre] = petrol_type(rn_petrol)
    if(0<=rn_petrol && rn_petrol <=58)
        petrol_num = 1;
        petrol = "RON95";
        price_per_litre = 2.05;
    elseif (59<=rn_petrol && rn_petrol <=78)
        petrol_num = 2;
        petrol = "RON97";
        price_per_litre = 3.14;
    elseif (79<=rn_petrol && rn_petrol <=81)
        petrol_num = 3;
        petrol = "RON100";
        price_per_litre = 5.00;
    elseif (82<=rn_petrol && rn_petrol <=99)
        petrol_num = 4;
        petrol = "Diesel";
        price_per_litre = 2.81;
    end

function rn_arrive = rng_arrival(rn_arrive,numofcust,RNG)
\ % mixed lcg
 if (RNG == 1)
    a = 21 ;
    c = 53 ;
    m = 1000 ;
    if (numofcust == 1)
    rn_arrive = rn_arrive;
    else
    rn_arrive = mod((a*rn_arrive+c),m);
    end
% multiplicative lcg
elseif (RNG == 2)
    a = 11 ;
    m = 1009 ;
    if (rn_arrive != 0 && numofcust == 1)
      rn_arrive = mod(rn_arrive,1000) ;
    elseif (rn_arrive != 0)
    rn_arrive = mod((a*rn_arrive),m);
    rn_arrive = mod(rn_arrive,1000) ;
    else
     while (rn_arrive == 0)
     rn_arrive = floor(rand * 1000);
     end
    end
% additive lcg
elseif (RNG == 3)

    c = 51 ;
    m = 1000;
    if (numofcust == 1)
    rn_arrive = rn_arrive;
    else
    rn_arrive = mod((rn_arrive + c),m);
  end
end







function rn_arrive = rng_arrival(rn_arrive,numofcust,RNG)
    a = 21 ;
    c = 53 ;
    m = 1000 ;  % total num of random nums
 % mixed lcg
 if (RNG == 1)
    if (numofcust == 1)
    rn_arrive = rn_arrive;
    else
    rn_arrive = mod((a*rn_arrive+c),m);
    end
% multiplicative lcg
elseif (RNG == 2)

    if (rn_arrive != 0 && numofcust == 1)
      rn_arrive = rn_arrive;
    elseif (rn_arrive != 0)
    rn_arrive = mod((a*rn_arrive),m);
    else
    rn_arrive = floor(rand * 1000);
    end
% additive lcg
elseif (RNG == 3)

    if (numofcust == 1)
    rn_arrive = rn_arrive;
    else
    rn_arrive = mod((rn_arrive + c),m);
  end
end







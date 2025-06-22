function rn_service =  rng_service(rn_service,numofcust,RNG) % currently just using mixed lcg


% mixed lcg
 if (RNG == 1)
  a = 21 ;
  c = 53 ;
  m = 100 ;
    if (numofcust == 1)
    rn_service = rn_service;
    else
    rn_service = mod((a*rn_service+c),m);
    end
% multiplicative lcg
elseif (RNG == 2)
    a = 2 ;
    m = 101 ;
    if (rn_service != 0 && numofcust == 1)
      rn_arrive = mod(rn_service,100);
    elseif (rn_service != 0)
    rn_service = mod((a*rn_service),m);
    rn_service = mod(rn_service,100) ;
    else
    while (rn_service == 0)
    rn_service = floor(rand * 100);
    end
    end
% additive lcg
elseif (RNG == 3)
    c = 51 ;
    m = 100;
    if (numofcust == 1)
    rn_service = rn_service;
    else
    rn_service = mod((rn_service + c),m);
  end
end



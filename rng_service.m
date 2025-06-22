function rn_service =  rng_service(rn_service,numofcust,RNG) % currently just using mixed lcg
  a = 21 ;
  c = 53 ;
  m = 100 ;  % total num of random nums

% mixed lcg
 if (RNG == 1)
    if (numofcust == 1)
    rn_service = rn_service;
    else
    rn_service = mod((a*rn_service+c),m);
    end
% multiplicative lcg
elseif (RNG == 2)

    if (rn_service != 0 && numofcust == 1)
      rn_arrive = rn_service;
    elseif (rn_service != 0)
    rn_service = mod((a*rn_service),m);
    else
    rn_service = floor(rand * 1000);
    end
% additive lcg
elseif (RNG == 3)

    if (numofcust == 1)
    rn_service = rn_service;
    else
    rn_service = mod((rn_service + c),m);
  end
end



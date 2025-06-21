function rn_service =  rng_service(rn_service,numofcust) % currently just using mixed lcg
  a = 21 ;
  c = 53 ;
  m = 100 ;  % total num of random nums
  if (numofcust == 1)
  rn_service = rn_service;
  else
  rn_service = mod((a*rn_service+c),m);
  end


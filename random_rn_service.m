function rn_service =  random_rn_service(rn_service,numofcust) % currently just using mixed lcg
  a = 21 ;
  c = 53 ;
  m = 100 ;  % total num of random nums, parameter because maybe diff range
  if (numofcust == 1)
  rn_service = rn_service;
  else
  rn_service = mod((a*rn_service+c),m);
  end


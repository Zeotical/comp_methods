function rn_arrive = mixedlcg(rn_arrive,numofcust)
  a = 21 ;
  c = 53 ;
  m = 1000 ;  % total num of random nums, parameter because maybe diff range
  if (numofcust == 1)
  rn_arrive = rn_arrive;
  else
  rn_arrive = mod((a*rn_arrive+c),m);
  end


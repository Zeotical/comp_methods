function x = mixedlcg(x,numofcust)
  a = 21 ;
  c = 53 ;
  m = 1000 ;  % total num of random nums, parameter because maybe diff range
  if (numofcust == 1)
  x = x;
  else
  x = mod((a*x+c),m);
  end


function rn_petrol =  rng_petrol(rn_petrol,numofcust) % currently just using mixed lcg
  a = 21 ;
  c = 53 ;
  m = 100 ;  % total num of random nums
  if (numofcust == 1)
  rn_petrol = rn_petrol;
  else
  rn_petrol = mod((a*rn_petrol+c),m);
  end


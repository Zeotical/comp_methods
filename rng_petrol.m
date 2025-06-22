function rn_petrol =  rng_petrol(rn_petrol,numofcust,RNG)
  a = 21 ;
  c = 53 ;
  m = 100 ;  % total num of random nums
  if (numofcust == 1)
  rn_petrol = rn_petrol;
  else
  rn_petrol = mod((a*rn_petrol+c),m);
end

% mixed lcg
 if (RNG == 1)
    if (numofcust == 1)
    rn_petrol = rn_petrol;
    else
    rn_petrol = mod((a*rn_petrol+c),m);
    end
% multiplicative lcg
elseif (RNG == 2)

    if (rn_arrive != 0 && numofcust == 1)
      rn_petrol = rn_petrol;
    elseif (rn_arrive != 0)
    rn_petrol = mod((a*rn_petrol),m);
    else
    rn_petrol = floor(rand * 1000);
    end
% additive lcg
elseif (RNG == 3)

    if (numofcust == 1)
    rn_petrol = rn_petrol;
    else
    rn_petrol = mod((rn_petrol + c),m);
  end
end



function rn_petrol =  rng_petrol(rn_petrol,numofcust,RNG)

% mixed lcg
 if (RNG == 1)
   a = 21 ;
  c = 53 ;
  m = 100 ;
    if (numofcust == 1)
    rn_petrol = rn_petrol;
    else
    rn_petrol = mod((a*rn_petrol+c),m);
    end
% multiplicative lcg
elseif (RNG == 2)
    a = 2 ;
    m = 101 ;
    if (rn_petrol != 0 && numofcust == 1)
      rn_petrol = mod(rn_petrol,100) ;
    elseif (rn_petrol != 0)
    rn_petrol = mod((a*rn_petrol),m);
    rn_petrol = mod(rn_petrol,100) ;
  else
    while (rn_petrol == 0)
    rn_petrol = floor(rand * 100);
    end
    end
% additive lcg
elseif (RNG == 3)
    c = 51 ;
    m = 100;
    if (numofcust == 1)
    rn_petrol = rn_petrol;
    else
    rn_petrol = mod((rn_petrol + c),m);
  end
end



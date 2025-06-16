function x = mixedlcg(m,n)
  a = 21 ;
  c = 53 ;
  m = m ;  % total num of random nums, parameter because maybe diff range
  x0 = floor(rand*m+1) ; % seed
  n = n ; % num of random nums user wants, based on num of vehicles
  x= zeros(n,1);
  x(1) = x0;
  for i=2:(n)
    x(i) = mod((a*x(i-1)+c),m);
  endfor


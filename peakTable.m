function pt=peakTable();
  printf('Peak Hour Inter-Arrival Time Table:\n');
  inter_time = [1, 2, 3, 4, 5, 6, 7, 8];
  prob = [0.4,0.3,0.15,0.07,0.04,0.02,0.01,0.01];
  cdf = [0.4,0.7,0.85,0.92,0.96,0.98,0.99,1.00];
  random = ["0-399";"400-699";"700-849";"850-919";"920-959";"960-979";"980-989";"990-999"];

  disp("Inter-arrival | Probability |  CDF  | Random Number");
  disp("Time (mins)   |             |       | range        ");
  disp("--------------+-------------+-------+--------------");

  n = length(inter_time);

  for i=1:n
    printf("%14d|%13d|%7d|%14s\n",inter_time(i),prob(i),cdf(i),random(i,:));
  endfor
 end


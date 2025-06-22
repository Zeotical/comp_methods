function printTables

% Print Peak Hour

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

disp("")

% Print Non Peak Hour

    % Inter-arrival times and probabilities
    inter_arrival_times = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    probabilities = [0.02, 0.05, 0.10, 0.15, 0.25, 0.18, 0.10, 0.07, 0.05, 0.03];
    cdf = cumsum(probabilities);

    % Random number ranges (0-999)
    lower_bounds = [0, round(cdf(1:end-1) * 1000)];
    upper_bounds = round(cdf * 1000) - 1;

    % Print table header
    printf('Non-Peak Hour Inter-Arrival Time Table:\n');
    printf('------------------------------------------------------------\n');
    printf('| Time (min) | Prob  |  CDF  | Random Number Range (0-999) |\n');
    printf('------------------------------------------------------------\n');

    % Loop through and print each row
    for i = 1:length(inter_arrival_times)
        printf('|     %2d     | %.2f  | %.2f  |       %3d - %3d             |\n', ...
            inter_arrival_times(i), probabilities(i), cdf(i), lower_bounds(i), upper_bounds(i));
    end

    printf('------------------------------------------------------------\n');

% Print PETROL TYPE DISTRIBUTION

  fprintf('\nPETROL TYPE DISTRIBUTION:\n');
%header
fprintf('%3s %15s %15s %10s %20s %20s \n',"---","---------------","---------------","----------","--------------------","--------------------");
fprintf('%3s %15s %15s %10s %20s %20s \n',"No|","Petrol Type|","Probability|","CDF|","Random Num Range|","Price per litre(RM)|");
fprintf('%3s %15s %15s %10s %20s %20s \n',"---","---------------","---------------","----------","--------------------","--------------------");
%table
fprintf('%3s %15s %15s %10s %20s %20s \n',"1|","RON95|", "0.58|","0.58|","0-58|","2.05|");
fprintf('%3s %15s %15s %10s %20s %20s \n',"2|","RON97|", "0.20|","0.78|","59-78|","3.14|");
fprintf('%3s %15s %15s %10s %20s %20s \n',"3|","RON100|","0.03|","0.81|","79-81|","5.00|");
fprintf('%3s %15s %15s %10s %20s %20s \n',"4|","Diesel|","0.19|","1.00|","82-99|","2.81|");
fprintf('%3s %15s %15s %10s %20s %20s \n',"---","---------------","---------------","----------","--------------------","--------------------");

% Print REFUELING TIME DISTRIBUTION

  fprintf('\nREFUELING TIME DISTRIBUTION:\n');
%header
fprintf('%20s %15s %10s %20s \n',"--------------------","---------------","----------","--------------------");
fprintf('%20s %15s %10s %20s \n',"Refuel Time(min)|","Probability|","CDF|","Random Num Range|");
fprintf('%20s %15s %10s %20s \n',"--------------------","---------------","----------","--------------------");
%table
fprintf('%20s %15s %10s %20s \n',"5|","0.05|","0.05|","00-04|");
fprintf('%20s %15s %10s %20s \n',"6|","0.10|","0.15|","05-14|");
fprintf('%20s %15s %10s %20s \n',"7|","0.25|","0.40|","15-39|");
fprintf('%20s %15s %10s %20s \n',"8|","0.40|","0.80|","40-47|");
fprintf('%20s %15s %10s %20s \n',"9|","0.15|","0.95|","80-94|");
fprintf('%20s %15s %10s %20s \n',"10|","0.05|","1.00|","95-99|");
fprintf('%20s %15s %10s %20s \n',"--------------------","---------------","----------","--------------------");

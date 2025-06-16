customers = 0;
numofcust = 1;
random_num_generator = 0;
x = floor(rand*1000+1); % see
rn_arrive = 0 ; %random er-arrival first seed
rn_service = rand() ; % 101 ; %random service time first seed
%random_rn_arrive( &rn_arrive); %reduntant
%random_rn_service( &rn_service); %reduntant
%arrive_range( random_rn_arrive);
%service_range( random_rn_service); %how long service is
prev_arrival_time = 0 ;
time_service_ends = 0;
%time_service_begins( arrival_time, time_service_ends);
%Rn_arrivals, er_arrival_time , Arrival_time, Rn_service, Service_time, time_service_starts ;

% later print one by one
choices = ['1. Mixed LCG', '2. Multiplicative LCG', '3. Additive LCG'];
printf('%s\n', choices);

random_num_generator = input("Pick a random number generator: ") ;
customers = input("Enter number of customers: ") ;
disp(" ") ;
disp ('Cust no   Rn ariiv   Inter arriv   Arriv time   Rn serv   Serv begin    Serv time     Serv ends     Time in system     Waiting time');

% printing values to table + loop
for numofcust=1:customers
     x = mixedlcg(x,numofcust);

 fprintf('%2.0f %10d\n', [numofcust,x]);
end


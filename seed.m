customers = 0;
numofcust = 1;
random_num_generator = 0;
rn_arrive = floor(rand*1000+1); %random inter-arrival first seed 0 - 1000
rn_service = floor(rand*100+1) ; % 101 ; %random service time first seed 0 - 100
%random_rn_service( &rn_service); %reduntant
%service_range( random_rn_service); %how long service is
prev_arrival_time = 0 ;
time_service_ends = 0;

% later print one by one
choices = ['1. Mixed LCG', '2. Multiplicative LCG', '3. Additive LCG'];
printf('%s\n', choices);

random_num_generator = input("Pick a random number generator: ") ;
customers = input("Enter number of customers: ") ;
disp(" ") ;
disp ('Cust no   Rn ariiv   Inter arriv   Arriv time   Rn serv   Serv begin    Serv time     Serv ends     Time in system     Waiting time');

% printing values to table + l
for numofcust=1:customers
     rn_arrive = mixedlcg(rn_arrive,numofcust);
     Inter_arriv = arrive_range(rn_arrive);
     Arrival_time = Inter_arriv + prev_arrival_time ;
     rn_service = random_rn_service(rn_service,numofcust);
     time_service_starts = time_service_begins(Arrival_time,time_service_ends) ;

 fprintf('%2.0f %10d %10d %12d %14d\n', [numofcust,rn_arrive,Inter_arriv, Arrival_time, rn_service]);
end


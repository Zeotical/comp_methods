customers = 0;
numofcust = 1;
random_num_generator = 0;
rn_arrive = floor(rand*1000+1); %random inter-arrival first seed 0 - 1000
rn_service = floor(rand*100+1) ; % 101 ; %random service time first seed 0 - 100
prev_arrival_time = 0 ;
time_service_ends = 0;
pseudo = 0 ;

% later print one by one
choices = ['1. Mixed LCG ', '2. Multiplicative LCG ', '3. Additive LCG ' , 'Randi ?'];
printf('%s\n', choices);
table_values = []; %clear the matrix after each run
random_num_generator = input("Pick a random number generator doesnt do anythignyet: ") ;
customers = input("Enter number of customers: ") ;
disp(" ") ;
disp ('Vehicle      Type of   Quantity   Total Price                                          Line                                    Pump 1');
disp ('number       petrol    (litre)        (RM)       Rn ariiv   Inter arriv   Arriv time   number       Rn serv   Serv begin    Serv time     Serv ends ');


% printing values to table + l
line_num = 1 ;%floor(rand*3) ; %to be appended
for numofcust=1:customers

     rn_arrive = mixedlcg(rn_arrive,numofcust);
     Inter_arriv = arrive_range(rn_arrive);
     Arrival_time = Inter_arriv + prev_arrival_time ;
     rn_service = random_rn_service(rn_service,numofcust);
     serv_begins = time_service_begins(Arrival_time,time_service_ends) ;
     Service_time = service_range(rn_service); %how long service is
     time_service_ends = Service_time + serv_begins ;
     waiting_time = serv_begins - Arrival_time;
     time_in_system = time_service_ends - Arrival_time;
     prev_arrival_time = Inter_arriv + prev_arrival_time ;

     if (line_num==1)


     table_values (numofcust,:) =  [numofcust pseudo  pseudo pseudo  rn_arrive Inter_arriv Arrival_time line_num rn_service serv_begins Service_time time_service_ends];


 fprintf('%2.0f %13d %13d %12d %12d %12d %12d %12d %12d %10d %10d %10d\n', [numofcust,pseudo,pseudo,pseudo,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service, serv_begins, Service_time, time_service_ends]);
endif
endfor

%Dealing with second part of the table
disp(" ");

disp (' Customer                   Pump 2                                    Pump 3                                 Pump 4 ');
disp ('Vehicle No  Serv begin    Serv time     Serv ends      Serv begin    Serv time     Serv ends   Serv begin    Serv time     Serv ends   Waiting time     Time in system');


for i=1:customers
 %fprintf('%2.0f %10d %10d %12d %14d %10d %10d %14d %18d %14d\n',  table_values(i,:));
endfor

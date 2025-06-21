customers = 0;
numofcust = 1;
random_num_generator = 0;
rn_arrive = floor(rand*1000); %random inter-arrival first seed 0 - 999
rn_service = floor(rand*100) ; % 101 ; %random service time first seed 0 - 99
prev_arrival_time = 0 ;
time_service_ends = 0;
pseudo = 0 ;

% later print one by one
choices = ['1. Mixed LCG ', '2. Multiplicative LCG ', '3. Additive LCG ' , 'Randi ?'];
printf('%s\n', choices);
table_values = []; %clear the matrix after each run
random_num_generator = input("Pick a random number generator doesnt do anythignyet: ") ;
simulation_type = input("Simulate for: 1) Peak hours 2)Non-Peak hours :") ;
customers = input("Enter number of customers: ") ;
disp(" ") ;
disp ('Vehicle      Type of   Quantity   Total Price                                          Line                                    Pump 1');
disp ('number       petrol    (litre)        (RM)       Rn ariiv   Inter arriv   Arriv time   number       Rn serv   Serv begin    Serv time     Serv ends ');


% printing values to table + l

pump1_disp = "-" ;
pump2_disp = "-" ;
pump3_disp = "-" ;
pump4_disp = "-" ;

p1_time_service_ends = 0;
p2_time_service_ends = 0;
p3_time_service_ends = 0;
p4_time_service_ends = 0;
pump = 0;

for numofcust=1:customers
     line_num = line_numm(numofcust);
     rn_arrive = mixedlcg(rn_arrive,numofcust);
     Inter_arriv = arrive_range(rn_arrive,simulation_type);
     Arrival_time = Inter_arriv + prev_arrival_time ;
     rn_service = random_rn_service(rn_service,numofcust);
     [pump,serv_begins] = pump_Servtime(Arrival_time,p1_time_service_ends,p2_time_service_ends,p3_time_service_ends,p4_time_service_ends,line_num,pump,serv_begins) ;
     Service_time = service_range(rn_service); %how long service is
     time_service_ends = Service_time + serv_begins ;
     waiting_time = serv_begins - Arrival_time;
     prev_arrival_time = Inter_arriv + prev_arrival_time ;
     time_in_system = time_service_ends - Arrival_time;
     [petrol_num,petrol] = petrol_type(rn_arrive) ;

     % Line 1 pump 1
     if(pump == 1)

       p1_serv_begins = serv_begins ;
       p1_Service_time = Service_time ;
       p1_time_service_ends = time_service_ends ;

       cell = {numofcust,petrol,pseudo,pseudo,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service,p1_serv_begins, p1_Service_time, p1_time_service_ends};
       fprintf('%2.0f %13s %13d %12d %12d %12d %12d %12d %12d %10d %10d %10d\n', cell{:});

       cell2 (numofcust,:) = {num2str(numofcust),pump2_disp,pump2_disp,pump2_disp,pump3_disp,pump3_disp,pump3_disp,pump4_disp,pump4_disp,pump4_disp,num2str(waiting_time),num2str(time_in_system)} ;

       % Saving values to table matrix and cell for displaying
       table_values (numofcust,:) =  [numofcust petrol_num  pseudo pseudo rn_arrive Inter_arriv Arrival_time line_num rn_service p1_serv_begins p1_Service_time p1_time_service_ends ];
       %fprintf('%2.0f %13d %13d %12d %12d %12d %12d %12d %12d %10d %10d %10d\n', [numofcust,petrol_num,pseudo,pseudo,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service, p1_serv_begins, p1_Service_time, p1_time_service_ends]);

       table (numofcust,:) = [numofcust pseudo pseudo pseudo pseudo pseudo pseudo pseudo pseudo pseudo waiting_time time_in_system ];

      % Line 1, pump 2
     elseif(pump == 2)

       p2_serv_begins = serv_begins ;
       p2_Service_time = Service_time ;
       p2_time_service_ends = time_service_ends ;

       cell = {numofcust,petrol,pseudo,pseudo,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service,pump1_disp, pump1_disp, pump1_disp};
       fprintf('%2.0f %13s %13d %12d %12d %12d %12d %12d %12d %10s %10s %10s\n', cell{:});

       cell2 (numofcust,:) = {num2str(numofcust),num2str(p2_serv_begins),num2str(p2_Service_time),num2str(p2_time_service_ends),pump3_disp,pump3_disp,pump3_disp,pump4_disp,pump4_disp,pump4_disp,num2str(waiting_time),num2str(time_in_system)} ;

       % Saving values to table matrix and cell for displaying
       table_values (numofcust,:) =  [numofcust petrol_num  pseudo pseudo  rn_arrive Inter_arriv Arrival_time line_num rn_service pseudo pseudo pseudo];
       %fprintf('%2.0f %13d %13d %12d %12d %12d %12d %12d %12d %10d %10d %10d\n', [numofcust,petrol_num,pseudo,pseudo,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service, pseudo,pseudo,pseudo]);

      table (numofcust,:) = [numofcust p2_serv_begins p2_Service_time p2_time_service_ends pseudo pseudo pseudo pseudo pseudo pseudo waiting_time time_in_system ];

      % Line 2, pump 3
      elseif(pump == 3)

      p3_serv_begins = serv_begins ;
      p3_Service_time = Service_time ;
      p3_time_service_ends = time_service_ends ;

  %Displaying table 1 and table 2
       cell = {numofcust,petrol,pseudo,pseudo,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service,pump1_disp, pump1_disp, pump1_disp};
       fprintf('%2.0f %13s %13d %12d %12d %12d %12d %12d %12d %10s %10s %10s\n', cell{:});

       cell2 (numofcust,:) = {num2str(numofcust),pump2_disp,pump2_disp,pump2_disp,num2str(p3_serv_begins),num2str(p3_Service_time),num2str(p3_time_service_ends),pump4_disp,pump4_disp,pump4_disp,num2str(waiting_time),num2str(time_in_system)} ;
      %table (numofcust,:) = [numofcust  pump3 pump3 pump3 serv_begins Service_time time_service_ends pump4 pump4 pump4 waiting_time time_in_system ];

      % Saving values to table matrix and cell for displaying
       table_values (numofcust,:) =  [numofcust petrol_num  pseudo pseudo  rn_arrive Inter_arriv Arrival_time line_num rn_service pseudo pseudo pseudo];
       %fprintf('%2.0f %13d %13d %12d %12d %12d %12d %12d %12d %10d %10d %10d\n', [numofcust,petrol_num,pseudo,pseudo,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service, pseudo,pseudo,pseudo]);

       table (numofcust,:) = [numofcust pseudo pseudo pseudo p3_serv_begins p3_Service_time p3_time_service_ends pseudo pseudo pseudo waiting_time time_in_system ];
      % Line 2, pump 4
     elseif(pump == 4)

         p4_serv_begins = serv_begins ;
         p4_Service_time = Service_time ;
         p4_time_service_ends = time_service_ends ;

         cell = {numofcust,petrol,pseudo,pseudo,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service,pump1_disp, pump1_disp, pump1_disp};
         fprintf('%2.0f %13s %13d %12d %12d %12d %12d %12d %12d %10s %10s %10s\n', cell{:});

         cell2 (numofcust,:) = {num2str(numofcust),pump1_disp,pump1_disp,pump1_disp,pump2_disp,pump2_disp,pump2_disp,num2str(p4_serv_begins),num2str(p4_Service_time),num2str(p4_time_service_ends),num2str(waiting_time),num2str(time_in_system)} ;
       % Saving values to table matrix and cell for displaying
       table_values (numofcust,:) =  [numofcust petrol_num  pseudo pseudo  rn_arrive Inter_arriv Arrival_time line_num rn_service pseudo pseudo pseudo];
       %fprintf('%2.0f %13d %13d %12d %12d %12d %12d %12d %12d %10d %10d %10d\n', [numofcust,petrol_num,pseudo,pseudo,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service,pseudo,pseudo,pseudo]);

       table (numofcust,:) = [numofcust pseudo pseudo pseudo pseudo pseudo pseudo p4_serv_begins p4_Service_time p4_time_service_ends waiting_time time_in_system ];

endif
endfor

%Dealing with second part of the table (display)
disp(" ");

disp (' Customer                   Pump 2                                    Pump 3                                 Pump 4 ');
disp ('Vehicle No  Serv begin    Serv time     Serv ends      Serv begin    Serv time     Serv ends   Serv begin    Serv time     Serv ends   Waiting time     Time in system');

for i=1:customers
 %fprintf('%2.0f %13d %13d %14d %14d %14d %12d %14d %12d %12d %14d %14d\n',  table(i,:));
 fprintf('%2s %14s %14s %14s %12s %12s %12s %12s %12s %12s %14s %14s\n', cell2{i,:} );

endfor


customers = 0;
numofcust = 1;
random_num_generator = 0;
rn_arrive = floor(rand*1000); %random inter-arrival first seed 0 - 999
rn_service = floor(rand*100) ; %random service time first seed 0 - 99
rn_petrol = floor(rand*100) ; %random petrol type first seed 0 - 99
serv_begins = 0;
prev_arrival_time = 0 ;
time_service_ends = 0;
cell3 = {};  % resets the cell so it’s empty at the start instead of using clear in command window

% Evaluation of simulation
total_inter_arrival = 0;
total_waiting_time = 0;
total_time_in_system = 0;
prob_waiting_time = 0;
p1_total_serv = 0;
p2_total_serv = 0;
p3_total_serv = 0;
p4_total_serv = 0;

disp("")
printTables
choices = ['1.Mixed LCG\n', '2.Multiplicative LCG\n', '3.Additive LCG\n' ];
fprintf(choices);
RNG = input("Pick a random number generator from the above : ") ;
simulation_type = input("Simulate for: 1)Peak hours 2)Non-Peak hours :") ;
customers = input("Enter number of vehicles: ") ;
disp(" ") ;
disp ('Vehicle      Type of   Quantity    Total Price       Random Number     Inter       Arrival      Line         Random Number               Pump 1');
disp ('number       petrol    (litre)        (RM)         for inter-arrival  Arrival       time        number       for Refueling      Time    Refueling    Time');
disp ('                                                         time          time                                      time           begins    time       ends');



% printing values to table

pump1_disp = "-" ;
pump2_disp = "-" ;
pump3_disp = "-" ;
pump4_disp = "-" ;

p1_time_service_ends = 0;
p2_time_service_ends = 0;
p3_time_service_ends = 0;
p4_time_service_ends = 0;
pump = 0;
row=1;

for numofcust=1:customers
  if(numofcust == 1)
   line_num = line_numm(numofcust);
     rn_arrive = "-";
     rn_petrol = rng_petrol(rn_petrol,numofcust,RNG);
     Inter_arriv = 0;
     Arrival_time = Inter_arriv + prev_arrival_time ;
     rn_service = rng_service(rn_service,numofcust,RNG);
     [pump,serv_begins] = pump_Servtime(Arrival_time,-1,p2_time_service_ends,p3_time_service_ends,p4_time_service_ends,line_num,pump,serv_begins) ;
     Service_time = service_range(rn_service); %how long service is
     time_service_ends = Service_time + serv_begins ;
     waiting_time = serv_begins - Arrival_time;
     prev_arrival_time = Inter_arriv + prev_arrival_time ;
     time_in_system = time_service_ends - Arrival_time;
     [petrol_num,petrol,price_per_litre] = petrol_type(rn_petrol) ;
     Quantity = rn_petrol;
     Price = Quantity * price_per_litre;

  else
     line_num = line_numm(numofcust);
     rn_arrive = rng_arrival(rn_arrive,numofcust,RNG);
     rn_petrol = rng_petrol(rn_petrol,numofcust,RNG);
     Inter_arriv = arrive_range(rn_arrive,simulation_type);
     Arrival_time = Inter_arriv + prev_arrival_time ;
     rn_service = rng_service(rn_service,numofcust,RNG);
     [pump,serv_begins] = pump_Servtime(Arrival_time,p1_time_service_ends,p2_time_service_ends,p3_time_service_ends,p4_time_service_ends,line_num,pump,serv_begins) ;
     Service_time = service_range(rn_service); %how long service is
     time_service_ends = Service_time + serv_begins ;
     waiting_time = serv_begins - Arrival_time;
     prev_arrival_time = Inter_arriv + prev_arrival_time ;
     time_in_system = time_service_ends - Arrival_time;
     [petrol_num,petrol,price_per_litre] = petrol_type(rn_petrol) ;
     Quantity = rn_petrol;
     Price = Quantity * price_per_litre;

   endif

     % Evaluation of simulation
     total_waiting_time = waiting_time + total_waiting_time;
     total_time_in_system = time_in_system + total_time_in_system;
     total_inter_arrival = Inter_arriv + total_inter_arrival;

     if(waiting_time!=0)
     prob_waiting_time = prob_waiting_time + 1;
     endif

     % Line 1 pump 1
     if(pump == 1)

       p1_serv_begins = serv_begins ;
       p1_Service_time = Service_time ;
       p1_time_service_ends = time_service_ends ;
       p1_total_serv = serv_begins + p1_total_serv;

       % Saving values to cell for displaying

       cell = {numofcust,petrol,Quantity,Price,num2str(rn_arrive),Inter_arriv,Arrival_time, line_num,rn_service,p1_serv_begins, p1_Service_time, p1_time_service_ends};
       fprintf('%3d %15s %7d %15d %16s %12d %13d %11d %16d %13d %10d %8d\n', cell{:});

       cell2 (numofcust,:) = {num2str(numofcust),pump2_disp,pump2_disp,pump2_disp,pump3_disp,pump3_disp,pump3_disp,pump4_disp,pump4_disp,pump4_disp,num2str(waiting_time),num2str(time_in_system)} ;

       % messages saved to cell later to be sorted
       msg = sprintf("Vehicle %d arrived at minute %d and began refueling with %s at Pump Island %d", numofcust,serv_begins,petrol,pump);
       cell3 (row,:) = {row, serv_begins, msg};
       msg = sprintf("Vehicle %d finished refueling and departed at minute %d", numofcust,time_service_ends);
       cell3 (row+1,:) = {row+1, time_service_ends, msg};
       row = row + 2;

      % Line 1, pump 2
     elseif(pump == 2)

       p2_serv_begins = serv_begins ;
       p2_Service_time = Service_time ;
       p2_time_service_ends = time_service_ends ;
       p2_total_serv = serv_begins + p2_total_serv;

       % Saving values to cell for displaying

       cell = {numofcust,petrol,Quantity,Price,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service,pump1_disp, pump1_disp, pump1_disp};
       fprintf('%3d %15s %7d %15d %16d %12d %13d %11d %16d %13s %10s %8s\n', cell{:});

       cell2 (numofcust,:) = {num2str(numofcust),num2str(p2_serv_begins),num2str(p2_Service_time),num2str(p2_time_service_ends),pump3_disp,pump3_disp,pump3_disp,pump4_disp,pump4_disp,pump4_disp,num2str(waiting_time),num2str(time_in_system)} ;

       % messages saved to cell later to be sorted
       msg = sprintf("Vehicle %d arrived at minute %d and began refueling with %s at Pump Island %d", numofcust,serv_begins,petrol,pump);
       cell3 (row,:) = {row, serv_begins, msg};
       msg = sprintf("Vehicle %d finished refueling and departed at minute %d", numofcust,time_service_ends);
       cell3 (row+1,:) = {row+1, time_service_ends, msg};
       row = row + 2;

      % Line 2, pump 3
      elseif(pump == 3)

        p3_serv_begins = serv_begins ;
        p3_Service_time = Service_time ;
        p3_time_service_ends = time_service_ends ;
        p3_total_serv = serv_begins + p3_total_serv;

        % Saving values to cell for displaying
        cell = {numofcust,petrol,Quantity,Price,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service,pump1_disp, pump1_disp, pump1_disp};
        fprintf('%3d %15s %7d %15d %16d %12d %13d %11d %16d %13s %10s %8s\n', cell{:});

        cell2 (numofcust,:) = {num2str(numofcust),pump2_disp,pump2_disp,pump2_disp,num2str(p3_serv_begins),num2str(p3_Service_time),num2str(p3_time_service_ends),pump4_disp,pump4_disp,pump4_disp,num2str(waiting_time),num2str(time_in_system)} ;

        % messages saved to cell later to be sorted
        msg = sprintf("Vehicle %d arrived at minute %d and began refueling with %s at Pump Island %d", numofcust,serv_begins,petrol,pump);
        cell3 (row,:) = {row, serv_begins, msg};
        msg = sprintf("Vehicle %d finished refueling and departed at minute %d", numofcust,time_service_ends);
        cell3 (row+1,:) = {row+1, time_service_ends, msg};
        row = row + 2;

     % Line 2, pump 4
     elseif(pump == 4)

         p4_serv_begins = serv_begins ;
         p4_Service_time = Service_time ;
         p4_time_service_ends = time_service_ends ;
         p4_total_serv = serv_begins + p4_total_serv;

         % Saving values to cell for displaying
         cell = {numofcust,petrol,Quantity,Price,rn_arrive,Inter_arriv,Arrival_time, line_num, rn_service,pump1_disp, pump1_disp, pump1_disp};
         fprintf('%3d %15s %7d %15d %16d %12d %13d %11d %16d %13s %10s %8s\n', cell{:});

         cell2 (numofcust,:) = {num2str(numofcust),pump1_disp,pump1_disp,pump1_disp,pump2_disp,pump2_disp,pump2_disp,num2str(p4_serv_begins),num2str(p4_Service_time),num2str(p4_time_service_ends),num2str(waiting_time),num2str(time_in_system)} ;

         % messages saved to cell later to be sorted
         msg = sprintf("Vehicle %d arrived at minute %d and began refueling with %s at Pump Island %d", numofcust,serv_begins,petrol,pump);
         cell3 (row,:) = {row, serv_begins, msg};
         msg = sprintf("Vehicle %d finished refueling and departed at minute %d", numofcust,time_service_ends);
         cell3 (row+1,:) = {row+1, time_service_ends, msg};
         row = row + 2;

endif
if(numofcust == 1)
rn_arrive = floor(rand*1000); %random inter-arrival first seed 0 - 999
endif

endfor


%Dealing with second part of the table (display)
disp(" ");

disp (' Customer                      Pump 2                                    Pump 3                                 Pump 4 ');
disp (' Vehicle         Time        Refueling      Time              Time     Refueling      Time           Time     Refueling       Time    Waiting time     Time in system');
disp (' Number          begins        time         ends             begins      time         ends           begins     time          ends');


for i=1:customers
 fprintf('%4s %15s %13s %12s %17s %10s %12s %14s %10s %12s %14s %14s\n', cell2{i,:} );
endfor

disp(" ");
% simulation messages

[~,idx] = sort(cell2mat(cell3(:,2)), 'ascend');
cell3_sorted = cell3(idx,:) ;
cell3_sorted_col = cell3_sorted(:,3) ;

for i=1:customers*2
 fprintf('%14s\n', cell3_sorted_col{i} );
endfor
disp('')
disp('***** RESULTS OF THE SIMULATION ****')
disp('')
fprintf("Average inter-arrival time: %d mins\n",total_inter_arrival/(customers-1));
fprintf("Average waiting time: %d mins\n",total_waiting_time/customers);
fprintf("Average time spent in system: %d mins\n",total_time_in_system/customers);
fprintf("Probability that a customer has to wait: %d\n",prob_waiting_time/customers);
fprintf("Average service time at pump 1: %d mins\n",p1_total_serv/customers);
fprintf("Average service time at pump 2: %d mins\n",p2_total_serv/customers);
fprintf("Average service time at pump 3: %d mins\n",p3_total_serv/customers);
fprintf("Average service time at pump 4: %d mins\n\n",p4_total_serv/customers);










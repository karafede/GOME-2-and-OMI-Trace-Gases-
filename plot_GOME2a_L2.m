
%%%%%%%%%%%% form the R-AEA server \\alder.harwell.aeat.com\gome2 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Jan2015          

       for i=1:1  %%% days of the month   CHANGE HERE!
           str = num2str(i,'%02d');
           %path = fullfile('C:\SATELLITE_STUFF\GOME2\BEAT\matlab\Jan2015\',str) %%directory where data are stored
           path = fullfile('G:\near_real_time\2015\01',str); %%directory where data are stored
    
           Fig_NO2_WW = [str,'Jan2015 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'Jan2015 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'Jan2015 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'Jan2015_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'Jan2015_NO2_GOME2a.txt']
           READ_GOME2a_NO2(path, 'G:\processed_data\jan2015\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
             
           Fig_SO2_WW = [str,'Jan2015 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'Jan2015 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'Jan2015 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'Jan2015_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'Jan2015_SO2_GOME2a.txt']
           READ_GOME2a_SO2(path, 'G:\processed_data\jan2015\so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
        
           Fig_O3_WW = [str,'Jan2015 O3 GOME2a WW']
           Fig_O3_EU = [str,'Jan2015 O3 GOME2a EU']
           Fig_O3_UK = [str,'Jan2015 O3 GOME2a UK']
           AURUN_O3_txt = [str,'Jan2015_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'Jan2015_O3_GOME2a.txt']
           READ_GOME2a_O3(path, 'G:\processed_data\jan2015\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
         
       end
       
             %{
             %}
           
%%%% Feb2015          

       for i=27:28  %%% days of the month   CHANGE HERE!
           str = num2str(i,'%02d');
           %str = '27';
           %path = fullfile('C:\SATELLITE_STUFF\GOME2\BEAT\matlab\Feb2015\',str) %%directory where data are stored
           path = fullfile('G:\near_real_time\2015\02',str); %%directory where data are stored
     
           Fig_NO2_WW = [str,'Feb2015 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'Feb2015 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'Feb2015 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'Feb2015_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'Feb2015_NO2_GOME2a.txt']
          %READ_GOME2a_NO2(path, 'C:\SATELLITE_STUFF\GOME2\BEAT\matlab\processed_data\Feb2015\NO2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
           READ_GOME2a_NO2(path, 'G:\processed_data\feb2015\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
        
           Fig_SO2_WW = [str,'Feb2015 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'Feb2015 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'Feb2015 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'Feb2015_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'Feb2015_SO2_GOME2a.txt']
          %READ_GOME2a_SO2(path, 'C:\SATELLITE_STUFF\GOME2\BEAT\matlab\processed_data\Feb2015\SO2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
           READ_GOME2a_SO2(path, 'G:\processed_data\feb2015\so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
        
           Fig_O3_WW = [str,'Feb2015 O3 GOME2a WW']
           Fig_O3_EU = [str,'Feb2015 O3 GOME2a EU']
           Fig_O3_UK = [str,'Feb2015 O3 GOME2a UK']
           AURUN_O3_txt = [str,'Feb2015_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'Feb2015_O3_GOME2a.txt']
          %READ_GOME2a_O3(path, 'C:\SATELLITE_STUFF\GOME2\BEAT\matlab\processed_data\Feb2015\O3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
          READ_GOME2a_O3(path, 'G:\processed_data\feb2015\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
          
       end

       
       %%%% March2015          

       for i=27:31  %%% days of the month   CHANGE HERE!
           str = num2str(i,'%02d');
           %path = fullfile('C:\SATELLITE_STUFF\GOME2\BEAT\matlab\March2015\',str) %%directory where data are stored
           path = fullfile('G:\near_real_time\2015\03',str); %%directory where data are stored
    
           Fig_NO2_WW = [str,'March2015 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'March2015 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'March2015 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'March2015_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'March2015_NO2_GOME2a.txt']
           READ_GOME2a_NO2(path, 'G:\processed_data\March2015\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
             
           Fig_SO2_WW = [str,'March2015 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'March2015 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'March2015 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'March2015_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'March2015_SO2_GOME2a.txt']
           READ_GOME2a_SO2(path, 'G:\processed_data\March2015\so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
        
           Fig_O3_WW = [str,'March2015 O3 GOME2a WW']
           Fig_O3_EU = [str,'March2015 O3 GOME2a EU']
           Fig_O3_UK = [str,'March2015 O3 GOME2a UK']
           AURUN_O3_txt = [str,'March2015_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'March2015_O3_GOME2a.txt']
           READ_GOME2a_O3(path, 'G:\processed_data\March2015\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
          
       end
       
       
       
            %%%% April 2015          

       for i=30:30  %%% days of the month   CHANGE HERE!
           str = num2str(i,'%02d');
           %path = fullfile('C:\SATELLITE_STUFF\GOME2\BEAT\matlab\April2015\',str) %%directory where data are stored
           path = fullfile('G:\near_real_time\2015\04',str); %%directory where data are stored
    
           Fig_NO2_WW = [str,'April2015 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'April2015 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'April2015 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'April2015_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'April2015_NO2_GOME2a.txt']
           READ_GOME2a_NO2(path, 'G:\processed_data\April2015\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
             
           Fig_SO2_WW = [str,'April2015 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'April2015 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'April2015 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'April2015_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'April2015_SO2_GOME2a.txt']
           READ_GOME2a_SO2(path, 'G:\processed_data\April2015\so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
        
           Fig_O3_WW = [str,'April2015 O3 GOME2a WW']
           Fig_O3_EU = [str,'April2015 O3 GOME2a EU']
           Fig_O3_UK = [str,'April2015 O3 GOME2a UK']
           AURUN_O3_txt = [str,'April2015_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'April2015_O3_GOME2a.txt']
           READ_GOME2a_O3(path, 'G:\processed_data\April2015\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
          
       end
       
       
       
             %%%% May 2015          

       for i=29:31  %%% days of the month   CHANGE HERE!
           str = num2str(i,'%02d');
           path = fullfile('G:\near_real_time\2015\05',str); %%directory where data are stored
           %%%% for NO2 introduced cloud filtering %%%% CLOUD_FRACTION < 0.5;
       
           Fig_NO2_WW = [str,'May2015 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'May2015 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'May2015 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'May2015_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'May2015_NO2_GOME2a.txt']
           READ_GOME2a_NO2(path, 'G:\processed_data\May2015\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
            
           Fig_SO2_WW = [str,'May2015 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'May2015 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'May2015 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'May2015_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'May2015_SO2_GOME2a.txt']
           READ_GOME2a_SO2(path, 'G:\processed_data\May2015\so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
        
           Fig_O3_WW = [str,'May2015 O3 GOME2a WW']
           Fig_O3_EU = [str,'May2015 O3 GOME2a EU']
           Fig_O3_UK = [str,'May2015 O3 GOME2a UK']
           AURUN_O3_txt = [str,'May2015_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'May2015_O3_GOME2a.txt']
           READ_GOME2a_O3(path, 'G:\processed_data\May2015\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
          
       end
       
             %%%% June 2015          

       for i=30:30  %%% days of the month   CHANGE HERE!
           str = num2str(i,'%02d');
           path = fullfile('G:\near_real_time\2015\06',str); %%directory where data are stored
           %%%% for NO2 introduced cloud filtering %%%% CLOUD_FRACTION < 0.5;
       
           Fig_NO2_WW = [str,'June2015 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'June2015 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'June2015 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'June2015_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'June2015_NO2_GOME2a.txt']
           READ_GOME2a_NO2(path, 'G:\processed_data\June2015\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
            
           Fig_SO2_WW = [str,'June2015 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'June2015 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'June2015 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'June2015_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'June2015_SO2_GOME2a.txt']
           READ_GOME2a_SO2(path, 'G:\processed_data\June2015\so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
        
           Fig_O3_WW = [str,'June2015 O3 GOME2a WW']
           Fig_O3_EU = [str,'June2015 O3 GOME2a EU']
           Fig_O3_UK = [str,'June2015 O3 GOME2a UK']
           AURUN_O3_txt = [str,'June2015_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'June2015_O3_GOME2a.txt']
           READ_GOME2a_O3(path, 'G:\processed_data\June2015\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
         %{
           %}
       end
       
       
                  %%%% July 2015          

       for i= 30:31 %%% days of the month   CHANGE HERE!
           str = num2str(i,'%02d');
           path = fullfile('G:\near_real_time\2015\07',str); %%directory where data are stored
           %%%% for NO2 introduced cloud filtering %%%% CLOUD_FRACTION < 0.5;
       
           Fig_NO2_WW = [str,'July2015 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'July2015 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'July2015 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'July2015_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'July2015_NO2_GOME2a.txt']
           READ_GOME2a_NO2(path, 'G:\processed_data\July2015\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
            
           Fig_SO2_WW = [str,'July2015 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'July2015 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'July2015 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'July2015_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'July2015_SO2_GOME2a.txt']
           READ_GOME2a_SO2(path, 'G:\processed_data\July2015\so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
        
           Fig_O3_WW = [str,'July2015 O3 GOME2a WW']
           Fig_O3_EU = [str,'July2015 O3 GOME2a EU']
           Fig_O3_UK = [str,'July2015 O3 GOME2a UK']
           AURUN_O3_txt = [str,'July2015_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'July2015_O3_GOME2a.txt']
           READ_GOME2a_O3(path, 'G:\processed_data\July2015\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
          
       end
       
       
       
        %%%% August 2015          

       for i= 28:31 %%% days of the month   CHANGE HERE!
           str = num2str(i,'%02d');
           path = fullfile('G:\near_real_time\2015\08',str); %%directory where data are stored
           %%%% for NO2 introduced cloud filtering %%%% CLOUD_FRACTION < 0.5;
       
           Fig_NO2_WW = [str,'August2015 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'August2015 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'August2015 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'August2015_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'August2015_NO2_GOME2a.txt']
           READ_GOME2a_NO2(path, 'G:\processed_data\August2015\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
            
           Fig_SO2_WW = [str,'August2015 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'August2015 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'August2015 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'August2015_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'August2015_SO2_GOME2a.txt']
           READ_GOME2a_SO2(path, 'G:\processed_data\August2015\so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
        
           Fig_O3_WW = [str,'August2015 O3 GOME2a WW']
           Fig_O3_EU = [str,'August2015 O3 GOME2a EU']
           Fig_O3_UK = [str,'August2015 O3 GOME2a UK']
           AURUN_O3_txt = [str,'August2015_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'August2015_O3_GOME2a.txt']
           READ_GOME2a_O3(path, 'G:\processed_data\August2015\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
          
       end
       
       
       
               %%%% September 2015          

       for i= 27:30 %%% days of the month   CHANGE HERE!
           str = num2str(i,'%02d');
           path = fullfile('G:\near_real_time\2015\09',str); %%directory where data are stored
           %%%% for NO2 introduced cloud filtering %%%% CLOUD_FRACTION < 0.5;
       
           Fig_NO2_WW = [str,'Sept2015 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'Sept2015 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'Sept2015 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'Sept2015_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'Sept2015_NO2_GOME2a.txt'];
           READ_GOME2a_NO2(path, 'G:\processed_data\Sept2015\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
            
           Fig_SO2_WW = [str,'Sept2015 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'Sept2015 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'Sept2015 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'Sept2015_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'Sept2015_SO2_GOME2a.txt']
           READ_GOME2a_SO2(path, 'G:\processed_data\Sept2015\so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
        
           Fig_O3_WW = [str,'Sept2015 O3 GOME2a WW']
           Fig_O3_EU = [str,'Sept2015 O3 GOME2a EU']
           Fig_O3_UK = [str,'Sept2015 O3 GOME2a UK']
           AURUN_O3_txt = [str,'Sept2015_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'Sept2015_O3_GOME2a.txt']
           READ_GOME2a_O3(path, 'G:\processed_data\Sept2015\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
          
       end
       
       
       
         %%%% October 2015          

       for i= 23:26 %%% days of the month   CHANGE HERE!  %%%(October 3, 2015 does not have data)%%%
           str = num2str(i,'%02d');
           path = fullfile('G:\near_real_time\2015\10',str); %%directory where data are stored
           %%%% for NO2 introduced cloud filtering %%%% CLOUD_FRACTION < 0.5;
       
           Fig_NO2_WW = [str,'October2015 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'October2015 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'October2015 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'October2015_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'October2015_NO2_GOME2a.txt'];
           READ_GOME2a_NO2(path, 'G:\processed_data\October2015\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
            
           Fig_SO2_WW = [str,'October2015 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'October2015 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'October2015 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'October2015_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'October2015_SO2_GOME2a.txt']
           READ_GOME2a_SO2(path, 'G:\processed_data\October2015\so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
        
           Fig_O3_WW = [str,'October2015 O3 GOME2a WW']
           Fig_O3_EU = [str,'October2015 O3 GOME2a EU']
           Fig_O3_UK = [str,'October2015 O3 GOME2a UK']
           AURUN_O3_txt = [str,'October2015_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'October2015_O3_GOME2a.txt']
           READ_GOME2a_O3(path, 'G:\processed_data\October2015\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
          
       end
       
       
       
       %{
       
       %}
   
 %%%%% JANUARY 2015 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
      
AVERAGING_NO2_GOME('G:\processed_data\jan2015\no2','WW AVG NO2 GOME2a Jan2015','EU AVG NO2 GOME2a Jan2015','UK AVG NO2 GOME2a Jan2015',...
                   'AVG_NO2_Jan2015_GOME.txt', 'AVG_NO2_Jan2015_AURUN_GOME.txt','G:\processed_data\jan2015\no2\monthly');  %%NO2  %%January 2015
               
AVERAGING_O3_GOME('G:\processed_data\jan2015\o3','WW AVG O3 GOME2a Jan2015','EU AVG O3 GOME2a Jan2015','UK AVG O3 GOME2a Jan2015',...
                   'AVG_O3_Jan2015_GOME.txt', 'AVG_O3_Jan2015_AURUN_GOME.txt','G:\processed_data\jan2015\o3\monthly');  %%O3  %%Janauary 2015
               
AVERAGING_SO2_GOME('G:\processed_data\jan2015\so2','WW AVG SO2 GOME2a Jan2015','EU AVG SO2 GOME2a Jan2015','UK AVG SO2 GOME2a Jan2015',...
                   'AVG_SO2_Jan2015_GOME.txt', 'AVG_SO2_Jan2015_AURUN_GOME.txt','G:\processed_data\jan2015\so2\monthly');  %%SO2  %%January 2015
       
       
%%%%%% FEBRUARY 2015 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AVERAGING_NO2_GOME('G:\processed_data\feb2015\no2','WW AVG NO2 GOME2a Feb2015','EU AVG NO2 GOME2a Feb2015','UK AVG NO2 GOME2a Feb2015',...
                   'AVG_NO2_Feb2015_GOME.txt', 'AVG_NO2_Feb2015_AURUN_GOME.txt','G:\processed_data\feb2015\no2\monthly');  %%NO2  %%February 2015
               
AVERAGING_O3_GOME('G:\processed_data\feb2015\o3','WW AVG O3 GOME2a Feb2015','EU AVG O3 GOME2a Feb2015','UK AVG O3 GOME2a Feb2015',...
                   'AVG_O3_Feb2015_GOME.txt', 'AVG_O3_Feb2015_AURUN_GOME.txt','G:\processed_data\feb2015\o3\monthly');  %%O3  %%February 2015
               
AVERAGING_SO2_GOME('G:\processed_data\feb2015\so2','WW AVG SO2 GOME2a Feb2015','EU AVG SO2 GOME2a Feb2015','UK AVG SO2 GOME2a Feb2015',...
                   'AVG_SO2_Feb2015_GOME.txt', 'AVG_SO2_Feb2015_AURUN_GOME.txt','G:\processed_data\feb2015\so2\monthly');  %%SO2  %%February 2015
               
               
%%%%% MARCH 2015 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AVERAGING_NO2_GOME('G:\processed_data\march2015\no2','WW AVG NO2 GOME2a March2015','EU AVG NO2 GOME2a March2015','UK AVG NO2 GOME2a March2015',...
                   'AVG_NO2_March2015_GOME.txt', 'AVG_NO2_March2015_AURUN_GOME.txt','G:\processed_data\march2015\no2\monthly');  %%NO2  %%March 2015
               
AVERAGING_O3_GOME('G:\processed_data\march2015\o3','WW AVG O3 GOME2a March2015','EU AVG O3 GOME2a March2015','UK AVG O3 GOME2a March2015',...
                   'AVG_O3_March2015_GOME.txt', 'AVG_O3_March2015_AURUN_GOME.txt','G:\processed_data\march2015\o3\monthly');  %%O3  %%March 2015
               
AVERAGING_SO2_GOME('G:\processed_data\march2015\so2','WW AVG SO2 GOME2a March2015','EU AVG SO2 GOME2a March2015','UK AVG SO2 GOME2a March2015',...
                   'AVG_SO2_March2015_GOME.txt', 'AVG_SO2_March2015_AURUN_GOME.txt','G:\processed_data\march2015\so2\monthly');  %%SO2  %%March 2015
               

%%%%% APRIL 2015 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AVERAGING_NO2_GOME('G:\processed_data\april2015\no2','WW AVG NO2 GOME2a April2015','EU AVG NO2 GOME2a April2015','UK AVG NO2 GOME2a April2015',...
                   'AVG_NO2_April2015_GOME.txt', 'AVG_NO2_April2015_AURUN_GOME.txt','G:\processed_data\april2015\no2\monthly');  %%NO2  %%April 2015
               
AVERAGING_O3_GOME('G:\processed_data\april2015\o3','WW AVG O3 GOME2a April2015','EU AVG O3 GOME2a April2015','UK AVG O3 GOME2a April2015',...
                   'AVG_O3_April2015_GOME.txt', 'AVG_O3_April2015_AURUN_GOME.txt','G:\processed_data\april2015\o3\monthly');  %%O3  %%april 2015
               
AVERAGING_SO2_GOME('G:\processed_data\april2015\so2','WW AVG SO2 GOME2a April2015','EU AVG SO2 GOME2a April2015','UK AVG SO2 GOME2a April2015',...
                   'AVG_SO2_April2015_GOME.txt', 'AVG_SO2_April2015_AURUN_GOME.txt','G:\processed_data\april2015\so2\monthly');  %%SO2  %% April 2015
               
%%%%%% MAY 2015 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AVERAGING_NO2_GOME('G:\processed_data\may2015\no2','WW AVG NO2 GOME2a May2015','EU AVG NO2 GOME2a May2015','UK AVG NO2 GOME2a May2015',...
                   'AVG_NO2_May2015_GOME.txt', 'AVG_NO2_May2015_AURUN_GOME.txt','G:\processed_data\may2015\no2\monthly');  %%NO2  %%April 2015
               
AVERAGING_O3_GOME('G:\processed_data\may2015\o3','WW AVG O3 GOME2a May2015','EU AVG O3 GOME2a May2015','UK AVG O3 GOME2a May2015',...
                   'AVG_O3_May2015_GOME.txt', 'AVG_O3_May2015_AURUN_GOME.txt','G:\processed_data\may2015\o3\monthly');  %%O3  %%april 2015
               
AVERAGING_SO2_GOME('G:\processed_data\may2015\so2','WW AVG SO2 GOME2a May2015','EU AVG SO2 GOME2a May2015','UK AVG SO2 GOME2a May2015',...
                   'AVG_SO2_May2015_GOME.txt', 'AVG_SO2_May2015_AURUN_GOME.txt','G:\processed_data\may2015\so2\monthly');  %%SO2  %% April 2015
               
%%%%% JUNE 2015 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AVERAGING_NO2_GOME('G:\processed_data\june2015\no2','WW AVG NO2 GOME2a June2015','EU AVG NO2 GOME2a June2015','UK AVG NO2 GOME2a June2015',...
                   'AVG_NO2_June2015_GOME.txt', 'AVG_NO2_June2015_AURUN_GOME.txt','G:\processed_data\june2015\no2\monthly');  %%NO2  %%April 2015
               
AVERAGING_O3_GOME('G:\processed_data\june2015\o3','WW AVG O3 GOME2a June2015','EU AVG O3 GOME2a June2015','UK AVG O3 GOME2a June2015',...
                   'AVG_O3_June2015_GOME.txt', 'AVG_O3_June2015_AURUN_GOME.txt','G:\processed_data\june2015\o3\monthly');  %%O3  %%april 2015
               
AVERAGING_SO2_GOME('G:\processed_data\june2015\so2','WW AVG SO2 GOME2a June2015','EU AVG SO2 GOME2a June2015','UK AVG SO2 GOME2a June2015',...
                   'AVG_SO2_June2015_GOME.txt', 'AVG_SO2_June2015_AURUN_GOME.txt','G:\processed_data\june2015\so2\monthly');  %%SO2  %% April 2015
               
               
%%%%% JULY 2015 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AVERAGING_NO2_GOME('G:\processed_data\july2015\no2','WW AVG NO2 GOME2a July2015','EU AVG NO2 GOME2a July2015','UK AVG NO2 GOME2a July2015',...
                   'AVG_NO2_July2015_GOME.txt', 'AVG_NO2_July2015_AURUN_GOME.txt','G:\processed_data\july2015\no2\monthly');  %%NO2  %%July 2015
               
AVERAGING_O3_GOME('G:\processed_data\july2015\o3','WW AVG O3 GOME2a July2015','EU AVG O3 GOME2a Ju;y2015','UK AVG O3 GOME2a July2015',...
                   'AVG_O3_July2015_GOME.txt', 'AVG_O3_July2015_AURUN_GOME.txt','G:\processed_data\july2015\o3\monthly');  %%O3  %%July 2015
               
AVERAGING_SO2_GOME('G:\processed_data\july2015\so2','WW AVG SO2 GOME2a July2015','EU AVG SO2 GOME2a July2015','UK AVG SO2 GOME2a July2015',...
                   'AVG_SO2_July2015_GOME.txt', 'AVG_SO2_July2015_AURUN_GOME.txt','G:\processed_data\july2015\so2\monthly');  %%SO2  %% July 2015
               

%%%%% AUGUST 2015 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AVERAGING_NO2_GOME('G:\processed_data\august2015\no2','WW AVG NO2 GOME2a August2015','EU AVG NO2 GOME2a August2015','UK AVG NO2 GOME2a August2015',...
                   'AVG_NO2_August2015_GOME.txt', 'AVG_NO2_August2015_AURUN_GOME.txt','G:\processed_data\august2015\no2\monthly');  %%NO2  %% August 2015
               
AVERAGING_O3_GOME('G:\processed_data\august2015\o3','WW AVG O3 GOME2a August2015','EU AVG O3 GOME2a Ju;y2015','UK AVG O3 GOME2a August2015',...
                   'AVG_O3_August2015_GOME.txt', 'AVG_O3_August2015_AURUN_GOME.txt','G:\processed_data\august2015\o3\monthly');  %%O3  %% August 2015
               
AVERAGING_SO2_GOME('G:\processed_data\august2015\so2','WW AVG SO2 GOME2a August2015','EU AVG SO2 GOME2a August2015','UK AVG SO2 GOME2a August2015',...
                   'AVG_SO2_August2015_GOME.txt', 'AVG_SO2_August2015_AURUN_GOME.txt','G:\processed_data\august2015\so2\monthly');  %%SO2  %% August 2015
               

%%%%% SEPTEMBER 2015 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AVERAGING_NO2_GOME('G:\processed_data\sept2015\no2','WW AVG NO2 GOME2a Sept2015','EU AVG NO2 GOME2a Sept2015','UK AVG NO2 GOME2a Sept2015',...
                   'AVG_NO2_Sept2015_GOME.txt', 'AVG_NO2_Sept2015_AURUN_GOME.txt','G:\processed_data\sept2015\no2\monthly');  %%NO2  %% September 2015
               
AVERAGING_O3_GOME('G:\processed_data\sept2015\o3','WW AVG O3 GOME2a Sept2015','EU AVG O3 GOME2a Ju;y2015','UK AVG O3 GOME2a Sept2015',...
                   'AVG_O3_Sept2015_GOME.txt', 'AVG_O3_Sept2015_AURUN_GOME.txt','G:\processed_data\sept2015\o3\monthly');  %%O3  %% September 2015
               
AVERAGING_SO2_GOME('G:\processed_data\sept2015\so2','WW AVG SO2 GOME2a Sept2015','EU AVG SO2 GOME2a Sept2015','UK AVG SO2 GOME2a Sept2015',...
                   'AVG_SO2_Sept2015_GOME.txt', 'AVG_SO2_Sept2015_AURUN_GOME.txt','G:\processed_data\sept2015\so2\monthly');  %%SO2  %% September 2015
                                               

%%%%% OCTOBER 2015 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AVERAGING_NO2_GOME('G:\processed_data\october2015\no2','WW AVG NO2 GOME2a October2015','EU AVG NO2 GOME2a October2015','UK AVG NO2 GOME2a October2015',...
                   'AVG_NO2_October2015_GOME.txt', 'AVG_NO2_October2015_AURUN_GOME.txt','G:\processed_data\october2015\no2\monthly');  %%NO2  %% October 2015
               
AVERAGING_O3_GOME('G:\processed_data\october2015\o3','WW AVG O3 GOME2a October2015','EU AVG O3 GOME2a Ju;y2015','UK AVG O3 GOME2a October2015',...
                   'AVG_O3_October2015_GOME.txt', 'AVG_O3_October2015_AURUN_GOME.txt','G:\processed_data\october2015\o3\monthly');  %%O3  %% October 2015
               
AVERAGING_SO2_GOME('G:\processed_data\october2015\so2','WW AVG SO2 GOME2a October2015','EU AVG SO2 GOME2a October2015','UK AVG SO2 GOME2a October2015',...
                   'AVG_SO2_October2015_GOME.txt', 'AVG_SO2_October2015_AURUN_GOME.txt','G:\processed_data\october2015\so2\monthly');  %%SO2  %% October 2015
                                               
                                                                       
         
               
%%%% Apr2010   volcano Eyjafjallajoekull_Eruption

       for i=14:20  %%% days of the month   CHANGE HERE!
           str = num2str(i,'%02d');
           %path =
           path = fullfile('G:\historical\apr2010',str); %%directory where data are stored APRIL 2010
       %{     
           Fig_NO2_WW = [str,'Apr2010 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'Apr2010 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'Apr2010 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'Apr2010_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'Apr2010_NO2_GOME2a.txt']
           READ_GOME2a_NO2(path, 'G:\historical\processed_data\apr2010\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
            %}
       
  
           Fig_SO2_WW = [str,'Apr2010 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'Apr2010 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'Apr2010 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'Apr2010_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'Apr2010_SO2_GOME2a.txt']
           READ_GOME2a_SO2(path, 'G:\historical\processed_data\apr2010\so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
         
           %{ 
           Fig_O3_WW = [str,'Apr2010 O3 GOME2a WW']
           Fig_O3_EU = [str,'Apr2010 O3 GOME2a EU']
           Fig_O3_UK = [str,'Apr2010 O3 GOME2a UK']
           AURUN_O3_txt = [str,'Apr2010_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'Apr2010_O3_GOME2a.txt']
           READ_GOME2a_O3(path, 'G:\historical\processed_data\apr2010\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
                %} 
       end

%%%% May2010  volcano Eyjafjallajoekull_Eruption_May 2010

       for i=2:2  %%% days of the month   CHANGE HERE!
           str = num2str(i,'%02d');
           %path =
           path = fullfile('G:\Eyjafjallajoekull_Eruption_May 2010\may2010',str); %%directory where data are stored APRIL 2010
            %{
           Fig_NO2_WW = [str,'May2010 NO2 GOME2a WW']
           Fig_NO2_EU = [str,'May2010 NO2 GOME2a EU']
           Fig_NO2_UK = [str,'May2010 NO2 GOME2a UK']
           AURUN_NO2_txt = [str,'May2010_NO2_AURUN.txt']
           GOME2a_NO2_txt = [str,'May2010_NO2_GOME2a.txt']
           READ_GOME2a_NO2(path, 'G:\historical\processed_data\may2010\no2' ,Fig_NO2_WW ,Fig_NO2_EU, Fig_NO2_UK, AURUN_NO2_txt, GOME2a_NO2_txt)
          %}
       
  
           Fig_SO2_WW = [str,'May2010 SO2 GOME2a WW']
           Fig_SO2_EU = [str,'May2010 SO2 GOME2a EU']
           Fig_SO2_UK = [str,'May2010 SO2 GOME2a UK']
           AURUN_SO2_txt = [str,'May2010_SO2_AURUN.txt']
           GOME2a_SO2_txt = [str,'May2010_SO2_GOME2a.txt']
           READ_GOME2a_SO2(path, 'G:\Eyjafjallajoekull_Eruption_May 2010\processed_data\may2010\Eyjafjallajoekull_Eruption_May 2010_so2' ,Fig_SO2_WW ,Fig_SO2_EU, Fig_SO2_UK, AURUN_SO2_txt, GOME2a_SO2_txt)
           
           %{
           Fig_O3_WW = [str,'May2010 O3 GOME2a WW']
           Fig_O3_EU = [str,'May2010 O3 GOME2a EU']
           Fig_O3_UK = [str,'May2010 O3 GOME2a UK']
           AURUN_O3_txt = [str,'May2010_O3_AURUN.txt']
           GOME2a_O3_txt = [str,'May2010_O3_GOME2a.txt']
           READ_GOME2a_O3(path, 'G:\historical\processed_data\may2010\o3' ,Fig_O3_WW ,Fig_O3_EU, Fig_O3_UK, AURUN_O3_txt, GOME2a_O3_txt)
          %}     
       end


%%%% TOTAL NO2 COLUMN FROM OMI/AURA from December 18, 2014 to January 06 2015 %%%%%%
clear all;
for i = 7:7 %month (update)
        month = num2str(i,'%02d');
        
        %ReadNO2Path = ('Z:\Code_Todd');
        ReadNO2Path = ('G:\Code_Todd');

        %directory_name = ('Z:\omi_l3\no2\'); %update the server path
         directory_name = ('G:\omi_l3\no2\'); %update the server path
        %output_dir = strcat('Z:\omi_l3\processedNO2\',month); %update the output directory
          output_dir = strcat('G:\omi_l3\processedNO2\',month); %update the output directory
        directory_name = strcat(directory_name,month,'\');
        
        files = dir(fullfile(directory_name,'*.he5'));
        filenames = {files.name}';
        
        %%%%%%Rename Files and Execute Read_he5_NO2%%%%%%
        %matlab has to be in the directory of the files to be renamed 
        %in order to perform the movefile() operation
        %IF you want to rerun data, omit the movefile line with a comment
        for k = 23:26 %days of month you wish to run (update)
            cd(directory_name);
            FileOrig = filenames{k};
            FileNew = FileOrig(1:28);
            FileNew = strcat(FileNew,'.he5');
            movefile(FileOrig,FileNew); %comment out if re-running a day
            FileNewPath = strcat(directory_name,FileNew);
            day = num2str(k,'%02d');
            NO2_date = strcat('NO2 2015_',day,'_',month); %(update the year!)
            NO2_AURUN_text = strcat(day,'_',month,'_NO2_2015_AURUN.txt');
            NO2_OMI_text = strcat(day,'_',month,'_NO2_2015_OMI.txt');
            cd(ReadNO2Path);
            Read_he5_NO2(FileNewPath,output_dir,NO2_date,NO2_AURUN_text,NO2_OMI_text);           
        end
        clear all;
end
        
        
        
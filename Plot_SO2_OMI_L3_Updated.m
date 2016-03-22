%%%% TOTAL SO2 COLUMN FROM OMI/AURA from December 18, 2014 to January 06 2015 %%%%%%
clear all;
for i = 6:6 %month (update)
        month = num2str(i,'%02d');
        
        %path where Read_he5_SO2.m is found on server
        ReadSO2Path = ('Z:\Code_Todd');

        directory_name = ('Z:\omi_l3\so2\'); %update the server path
        output_dir = strcat('Z:\omi_l3\processedSO2\',month); %update the output directory
        directory_name = strcat(directory_name,month,'\');
        
        files = dir(fullfile(directory_name,'*.he5'));
        filenames = {files.name}';
        
        %%%%%%Rename Files and Execute Read_he5_SO2%%%%%%
        %matlab has to be in the directory of the files to be renamed 
        %in order to perform the movefile() operation
        %IF you want to rerun data, omit the movefile line with a comment
        for k = 1:8 %days of month you wish to run (update)
            cd(directory_name);
            FileOrig = filenames{k};
            FileNew = FileOrig(1:28);
            FileNew = strcat(FileNew,'.he5');
            movefile(FileOrig,FileNew); %comment out if re-running a day
            FileNewPath = strcat(directory_name,FileNew);
            day = num2str(k,'%02d');
            SO2_date = strcat('SO2 2015_',day,'_',month); %(update the year!)
            SO2_AURUN_text = strcat(day,'_',month,'_SO2_2015_AURUN.txt');
            SO2_OMI_text = strcat(day,'_',month,'_SO2_2015_OMI.txt');
            cd(ReadSO2Path);
            Read_he5_SO2(FileNewPath,output_dir,SO2_date,SO2_AURUN_text,SO2_OMI_text);          
        end
    clear all;
end
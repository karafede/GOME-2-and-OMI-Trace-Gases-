
%%%% TOTAL AEROSOL COLUMN FROM OMI/AURA for any date %%%%%%%%%%%%%%%%%%%%%%
clear all;
for i = 4:4 %month (update)
        month = num2str(i,'%02d');
        
        ReadAEROPath = ('Z:\Code_Todd');

        directory_name = ('Z:\omi_l3\aero\'); %update the server path
        output_dir = strcat('Z:\omi_l3\processedAERO\',month); %update the output directory
        directory_name = strcat(directory_name,month,'\');
        
        files = dir(fullfile(directory_name,'*.he5'));
        filenames = {files.name}';
        
        %%%%%%Rename Files and Execute Read_he5_NO2%%%%%%
        %matlab has to be in the directory of the files to be renamed 
        %in order to perform the movefile() operation
        %IF you want to rerun data, omit the movefile line with a comment
        for k = 1:1 %days of month you wish to run (update)
            cd(directory_name);
            FileOrig = filenames{k};
            FileNew = FileOrig(1:29);
            FileNew = strcat(FileNew,'.he5');
            movefile(FileOrig,FileNew); %comment out if re-running a day
            FileNewPath = strcat(directory_name,FileNew);
            day = num2str(k,'%02d');
            AERO_date = strcat('AERO 2015_',day,'_',month); %(update the year!)
            AERO_AURUN_text = strcat(day,'_',month,'_AERO_2015_AURUN.txt');
            AERO_OMI_text = strcat(day,'_',month,'_AERO_2015_OMI.txt');
            cd(ReadAEROPath);
            Read_he5_AERO(FileNewPath,output_dir,AERO_date,AERO_AURUN_text,AERO_OMI_text);           
        end
    clear all;
end
        
        
        
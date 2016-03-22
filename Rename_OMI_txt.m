directory_name = 'Z:\omi_l3\processedNO2\04';
cd(directory_name);
filelist = dir( fullfile(directory_name,'*OMI.txt') );
filenames = {filelist.name}';
for i=1:30
    oldfile = filenames{i};
    day = num2str(i,'%02d');
    newfile = strcat(day,'_04_2015_OMI.txt');
    movefile(oldfile,newfile);
end
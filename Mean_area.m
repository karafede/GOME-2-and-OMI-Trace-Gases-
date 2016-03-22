
directory_name_GOME2a = 'C:\SATELLITE_STUFF\GOME2\BEAT\matlab\Feb2015\GOME2a 27';
files_GOME2a = dir( fullfile(directory_name_GOME2a,'*.hdf5') );   %# list all *.hdf5 files

filenames_GOME2a = {files_GOME2a.name}';  %'# file names

fname_GOME2a=[];
for i=1:numel(filenames_GOME2a)
 fname1_GOME2a = fullfile(directory_name_GOME2a,filenames_GOME2a{i});  %# full path to file   %%%% make a list!!!!
 fname_GOME2a = strvcat(fname_GOME2a,fname1_GOME2a);
 count = i
end

data_NO2_GOME2a = beatl2_ingest(fname_GOME2a,'include=no2_column'); %%% need a string array of filepaths

lat_NO2 = data_NO2.latitude;
lat_NO2_GOME2a = data_NO2_GOME2a.latitude;
lon_NO2_GOME2a = data_NO2_GOME2a.longitude;
NO2_Column_GOME2a = data_NO2_GOME2a.no2_column;

[GOME2a_NO2] =[lat_NO2_GOME2a, lon_NO2_GOME2a, NO2_Column_GOME2a]; 


ddd_NO2=lon_NO2_GOME2a < 180;
LAT_NO2 = GOME2a_NO2(ddd_NO2,1); %%%%% filter
LON_NO2 = GOME2a_NO2(ddd_NO2,2); 
NO2 = GOME2a_NO2(ddd_NO2,3);
[GOME2_a_NO2] = [LAT_NO2, LON_NO2, NO2];


aaa_NO2=lon_NO2_GOME2a > 180;
LAT_aaa_NO2 = GOME2a_NO2(aaa_NO2,1);
LON_aaa_NO2= GOME2a_NO2(aaa_NO2,2);
LON_aaa_NO2=LON_aaa_NO2-360;
NO2_aaa = GOME2a_NO2(aaa_NO2,3);
[GOME2a_aaa_NO2] = [LAT_aaa_NO2, LON_aaa_NO2, NO2_aaa];

LAT_NO2 = [LAT_NO2;LAT_aaa_NO2]; %%% bind latitudes
LON_NO2 = [LON_NO2;LON_aaa_NO2]; %%% bind longitudes
NO2 = [NO2;NO2_aaa];    %%% bind NO2 columns

SEL =LAT_NO2>44.80 & LAT_NO2<100.55 & LON_NO2>8.23 & LON_NO2<8.51; %%% SEL
LAT_NO2_SEL = LAT_NO2(SEL);  %%% SEL
LON_NO2_SEL = LON_NO2(SEL);  %%% SEL
NO2_SEL = NO2(SEL); %%% SEL

MEAN = mean(NO2_SEL); %%% average value in the selected area

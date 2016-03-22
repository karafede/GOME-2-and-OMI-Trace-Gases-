
%%%%% read all data fiels with extension .hdf5  (downloaded from ftp: http://atmos.caf.dlr.de/products/

function READ_GOME2a_NO2(directory_name, output_directory, date_species_GOME_WW,date_species_GOME_EU,...
                         date_species_GOME_UK, date_species_AURUN_txt,date_species_GOME_txt) 
%{
directory_name_GOME2a = 'C:\SATELLITE_STUFF\GOME2\BEAT\matlab\Feb2015\GOME2a\27';
directory_name_GOME2b = 'C:\SATELLITE_STUFF\GOME2\BEAT\matlab\Feb2015\GOME2b\27';
 %}
                         
%directory_name = 'C:\SATELLITE_STUFF\GOME2\BEAT\matlab\Feb2015\27';   

                         
load 'AURUN_UKsites_2013.TXT'         %%%%%% all AURUN site locations in UK....just lat and long
files = dir( fullfile(directory_name,'*.hdf5') );   %# list all *.hdf5 files
  %%% files_GOME2a = dir( fullfile(directory_name_GOME2a,'*.hdf5') );   %# list all *.hdf5 files
  %%% files_GOME2b = dir( fullfile(directory_name_GOME2b,'*.hdf5') );   %# list all *.hdf5 files
filenames = {files.name}';  %'# file names
%%% filenames_GOME2a = {files_GOME2a.name}';  %'# file names
%%% filenames_GOME2b = {files_GOME2b.name}';  %'# file names

fname=[];
for i=1:numel(filenames)
 fname1 = fullfile(directory_name,filenames{i});  %# full path to file   %%%% make a list!!!!
 fname = strvcat(fname,fname1);
 count = i
end

%{

fname_GOME2a=[];
for i=1:numel(filenames_GOME2a)
 fname1_GOME2a = fullfile(directory_name_GOME2a,filenames_GOME2a{i});  %# full path to file   %%%% make a list!!!!
 fname_GOME2a = strvcat(fname_GOME2a,fname1_GOME2a);
 count = i
end

fname_GOME2b=[];
for i=1:numel(filenames_GOME2b)
 fname1_GOME2b = fullfile(directory_name_GOME2b,filenames_GOME2b{i});  %# full path to file   %%%% make a list!!!!
 fname_GOME2b = strvcat(fname_GOME2b,fname1_GOME2b);
 count = i
end
%}

%%%%% "digest" all hdf5 files
data_NO2 = beatl2_ingest(fname,'include=no2_column'); %%% need a string array of filepaths
%CLOUD = beatl2_ingest(fname,'include=cloud_fraction'); %%% clouds

%{
data_NO2_GOME2a = beatl2_ingest(fname_GOME2a,'include=no2_column'); %%% need a string array of filepaths
data_NO2_GOME2b = beatl2_ingest(fname_GOME2b,'include=no2_column'); %%% need a string array of filepaths
%}

lat_NO2 = data_NO2.latitude;
lon_NO2 = data_NO2.longitude;
NO2_Column = data_NO2.no2_column;
%CLOUD_FRACTION = CLOUD.cloud_fraction;  %%%%% clouds
Unit_NO2 = data_NO2.no2_column_unit;

[GOME_NO2] =[lat_NO2, lon_NO2, NO2_Column]; 

%{
lat_NO2_GOME2a = data_NO2_GOME2a.latitude;
lon_NO2_GOME2a = data_NO2_GOME2a.longitude;
NO2_Column_GOME2a = data_NO2_GOME2a.no2_column;
Unit_NO2_GOME2a = data_NO2_GOME2a.no2_column_unit;

lat_NO2_GOME2b = data_NO2_GOME2b.latitude;
lon_NO2_GOME2b = data_NO2_GOME2b.longitude;
NO2_Column_GOME2b = data_NO2_GOME2b.no2_column;
Unit_NO2_GOME2b = data_NO2_GOME2b.no2_column_unit;

lat_NO2 = cat(1,lat_NO2_GOME2a, lat_NO2_GOME2b);
lon_NO2 = cat(1,lon_NO2_GOME2a, lon_NO2_GOME2b);
NO2_Column = cat(1,NO2_Column_GOME2a, NO2_Column_GOME2b);

[GOME_NO2] =[lat_NO2, lon_NO2, NO2_Column]; 
%}

%%%% NO2 %%%%%%


% CLOUD_FR = CLOUD_FRACTION < 0.5; %%%% clouds
ddd_NO2=lon_NO2 < 180;
%ddd_NO2=lon_NO2 < 180 & CLOUD_FRACTION < 0.5;
LAT_NO2 = GOME_NO2(ddd_NO2,1); %%%%% filter
LON_NO2 = GOME_NO2(ddd_NO2,2); 
NO2 = GOME_NO2(ddd_NO2,3);
[GOME_a_NO2] = [LAT_NO2, LON_NO2, NO2];



 aaa_NO2=lon_NO2 > 180;
%aaa_NO2=lon_NO2 > 180 & CLOUD_FRACTION < 0.5; 
LAT_aaa_NO2 = GOME_NO2(aaa_NO2,1);
LON_aaa_NO2= GOME_NO2(aaa_NO2,2);
LON_aaa_NO2=LON_aaa_NO2-360;
NO2_aaa = GOME_NO2(aaa_NO2,3);
[GOME_aaa_NO2] = [LAT_aaa_NO2, LON_aaa_NO2, NO2_aaa];

LAT_NO2 = [LAT_NO2;LAT_aaa_NO2]; %%% bind latitudes
LON_NO2 = [LON_NO2;LON_aaa_NO2]; %%% bind longitudes
NO2 = [NO2;NO2_aaa];    %%% bind NO2 columns



%%%%% WORLD WIDE MAP %%%%%%%%%%

LATLAT_WW =-86:1:75;
LONLON_WW =-180:1:180;

LAT_GRID = repmat((-86:1:75),1,length(LONLON_WW));
LAT_GRID = LAT_GRID';
LON_GRID = repmat((-180:1:180),length(LATLAT_WW),1);
LON_GRID = reshape(LON_GRID ,length(LATLAT_WW)*length(LONLON_WW),1);

GRID_DATA_NO2=griddata(LAT_NO2,LON_NO2,(NO2)',LATLAT_WW,LONLON_WW');  %%%%% matrix
NO2_GRID = reshape(GRID_DATA_NO2,length(LATLAT_WW)*length(LONLON_WW),1);  %%%% vector


dd_WW=figure;  %%% NO2 %%%
[c,h]=contourf(LONLON_WW,LATLAT_WW,griddata(LAT_NO2,LON_NO2,(NO2)',LATLAT_WW,LONLON_WW')',32); 
grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(NO2)));
max_data=ceil(max(max(NO2)));
%granule = (max_data - min_data) / ntickmarks;
%caxis([0 max_data]); 
caxis ([0 6e+15]); 
%caxis([-14 19])
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(date_species_GOME_WW,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_NO2,'FontSize',12,'FontWeight','bold');


%%%%% EUROPE WIDE MAP %%%%%%%%%%

LATLAT_EU =30:1:75; % Europe 
LONLON_EU =-27:1:45; % Europe

EU =LAT_NO2>30 & LAT_NO2<75 & LON_NO2>-27 & LON_NO2<45; %%% EU
LAT_NO2_EU = LAT_NO2(EU);  %%% EU
LON_NO2_EU = LON_NO2(EU);  %%% EU
NO2_EU = NO2(EU); %%% EU

dd_EU=figure;  %%% NO2 %%%
[c,h]=contourf(LONLON_EU,LATLAT_EU,griddata(LAT_NO2_EU,LON_NO2_EU,(NO2_EU)',LATLAT_EU,LONLON_EU')',32); 
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat;
colormap(idlcolormap)
max_data=ceil(max(max(NO2_EU)));
%caxis([0 max_data]); 
%caxis([-14 19])
caxis ([0 7e+15]); 
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(date_species_GOME_EU,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_NO2,'FontSize',12,'FontWeight','bold');


%%%%%%%% UK map %%%%%%%%%%%%%%%%%%%%%%%%%%

LATLAT_UK=45:1:61; %%% UK
LONLON_UK=-14:1:5;  %%% UK

UK =LAT_NO2>45 & LAT_NO2<61 & LON_NO2>-14 & LON_NO2<5; %%% UK
LAT_NO2_UK = LAT_NO2(UK);  %%% UK
LON_NO2_UK = LON_NO2(UK);  %%% UK
NO2_UK = NO2(UK); %%% UK

dd_UK=figure;  %%% NO2 %%%
[c,h]=contourf(LONLON_UK,LATLAT_UK,griddata(LAT_NO2_UK,LON_NO2_UK,(NO2_UK)',LATLAT_UK,LONLON_UK')',32); 
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(NO2_UK)));
max_data=ceil(max(max(NO2_UK)));
%granule = (max_data - min_data) / ntickmarks; 
caxis([0 max_data]); 
%caxis ([0 3e+15]); 
d = colorbar;
title(date_species_GOME_UK,'FontSize',14,'FontWeight','bold');
 ylabel(d,Unit_NO2,'FontSize',12,'FontWeight','bold');
% saveas(dd, 'C:\ECMWF_MET\GOME2\BEAT\matlab\GOME_NO2.jpg');

cd(output_directory)  %%%%% use 'directory_name' when run from \C disk %%%%%%%%%%%%
saveas(dd_WW,date_species_GOME_WW, 'jpg')
saveas(dd_EU,date_species_GOME_EU, 'jpg')
saveas(dd_UK,date_species_GOME_UK, 'jpg')
close Figure 1
close Figure 2
close Figure 3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% extract data for UK sites
[NO2_GOME] =[LAT_NO2, LON_NO2, NO2];   %%%%%%%%% all global data
save(date_species_GOME_txt,'NO2_GOME','-ASCII')  

Lat_AURUN = AURUN_UKsites_2013(:,1);
Lon_AURUN = AURUN_UKsites_2013(:,2);

%test=NaN(720,6);
%test2=zeros(length(Lat_AURUN),1)
aaa= zeros(length(Lat_AURUN),1);
  NO2_NEW=NaN(length(Lat_AURUN),1);
%  counter = 1;
for i=1:length(NO2_GRID)
%for i=1:length(NO2)
      for j=1:length(Lat_AURUN)
      distance = sqrt((Lat_AURUN(j)- LAT_GRID(i))^2 + (Lon_AURUN(j)-LON_GRID(i))^2);
       %distance = sqrt((Lat_AURUN(j)- LAT_NO2(i))^2 + (Lon_AURUN(j)- LON_NO2(i))^2);
      if distance < 0.71   %0.071
       NO2_NEW(j)=NO2_GRID(i); 
       %NO2_NEW(j)=NO2(i); 
 %      counter = counter + 1; 
  %     test(counter, 1) = Lat_AURUN(j); 
   %    test(counter, 2) = Lon_AURUN(j); 
    %   test(counter, 3) = i; 
     %  test(counter, 4) = LAT(i);
      % test(counter, 5) = LAT(i); 
       %test(counter, 6) = distance; 
       %test2(j) = test2(j) + 1;
           end
      end
end

[GOME_NO2_AURUN] =[Lat_AURUN, Lon_AURUN, NO2_NEW];  %%%% GRIDDED
%save GOME_NO2_AURUN.txt GOME_NO2_AURUN -ascii
%csvwrite('GOME_NO2_AURUN.csv',GOME_NO2_AURUN)
save(date_species_AURUN_txt,'GOME_NO2_AURUN','-ASCII') %%%% txt files (GRIDDED)

cd('C:\SATELLITE_STUFF\GOME2\BEAT\matlab') %%%%% use directory where main scripts are!!!!

%{

%}
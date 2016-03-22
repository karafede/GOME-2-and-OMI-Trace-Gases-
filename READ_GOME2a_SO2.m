
%%%%% read all data fiels with extension .hdf5  (downloaded from ftp: http://atmos.caf.dlr.de/products/

function READ_GOME2a_SO2(directory_name, output_directory, date_species_GOME_WW,date_species_GOME_EU,...
                         date_species_GOME_UK, date_species_AURUN_txt,date_species_GOME_txt) 

%directory_name = 'C:\SATELLITE_STUFF\GOME2\BEAT\matlab\Jan2015\12'
 
load 'AURUN_UKsites_2013.TXT'         %%%%%% all AURUN site locations in UK....just lat and long
files = dir( fullfile(directory_name,'*.hdf5') );   %# list all *.hdf5 files
filenames = {files.name}';  %'# file names

fname=[];
for i=1:numel(filenames)
 fname1 = fullfile(directory_name,filenames{i});  %# full path to file   %%%% make a list!!!!
 fname = strvcat(fname,fname1);
 count = i

end

data_SO2 = beatl2_ingest(fname,'include=so2_column'); %%% need a string array of filepaths
%CLOUD = beatl2_ingest(fname,'include=cloud_fraction'); %%% clouds
 
lat_SO2 = data_SO2.latitude;
lon_SO2 = data_SO2.longitude;
SO2_Column = data_SO2.so2_column;
%CLOUD_FRACTION = CLOUD.cloud_fraction;  %%%%% clouds
%Unit_SO2 = data_SO2.so2_column_unit;
Unit_SO2 = 'DU';

[GOME_SO2] =[lat_SO2, lon_SO2, SO2_Column]; 


%%%% SO2 %%%%%%

ddd_SO2=lon_SO2 < 180;
%ddd_SO2=lon_SO2 < 180 & CLOUD_FRACTION < 0.5;
LAT_SO2 = GOME_SO2(ddd_SO2,1);
LON_SO2 = GOME_SO2(ddd_SO2,2);
SO2 = GOME_SO2(ddd_SO2,3);
[GOME_a_SO2] = [LAT_SO2, LON_SO2, SO2];


aaa_SO2=lon_SO2 > 180;
%aaa_SO2=lon_SO2 > 180 & CLOUD_FRACTION < 0.5; 
LAT_aaa_SO2 = GOME_SO2(aaa_SO2,1);
LON_aaa_SO2= GOME_SO2(aaa_SO2,2);
LON_aaa_SO2=LON_aaa_SO2-360;
SO2_aaa = GOME_SO2(aaa_SO2,3);
[GOME_aaa_SO2] = [LAT_aaa_SO2, LON_aaa_SO2, SO2_aaa];

LAT_SO2 = [LAT_SO2;LAT_aaa_SO2]; %%% bind latitudes
LON_SO2 = [LON_SO2;LON_aaa_SO2]; %%% bind longitudes
SO2 = [SO2;SO2_aaa];    %%% bind SO2 columns


%%%%% WORLD WIDE MAP %%%%%%%%%%

LATLAT_WW =-86:1:75;
LONLON_WW =-180:1:180;

LAT_GRID = repmat((-86:1:75),1,length(LONLON_WW));
LAT_GRID = LAT_GRID';
LON_GRID = repmat((-180:1:180),length(LATLAT_WW), 1);
LON_GRID = reshape(LON_GRID ,length(LATLAT_WW)*length(LONLON_WW),1);

GRID_DATA_SO2=griddata(LAT_SO2,LON_SO2,(SO2)',LATLAT_WW,LONLON_WW');  %%%%% matrix
SO2_GRID = reshape(GRID_DATA_SO2,length(LATLAT_WW)*length(LONLON_WW),1); %%%%vector


dd_WW=figure;  %%% SO2 %%%
[c,h]=contourf(LONLON_WW,LATLAT_WW,griddata(LAT_SO2,LON_SO2,(log(SO2))',LATLAT_WW,LONLON_WW')',32); 
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(SO2)));
max_data=ceil(max(max(log(SO2))));
%granule = (max_data - min_data) / ntickmarks;
%caxis([0 max_data]); 
caxis ([0 3]); 
%caxis([-14 19])
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(date_species_GOME_WW,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_SO2,'FontSize',12,'FontWeight','bold');



%%%%% EUROPE WIDE MAP %%%%%%%%%%

LATLAT_EU =30:1:75; % Europe 
LONLON_EU =-27:1:45; % Europe

EU =LAT_SO2>30 & LAT_SO2<75 & LON_SO2>-27 & LON_SO2<45; %%% EU
LAT_SO2_EU = LAT_SO2(EU);  %%% EU
LON_SO2_EU = LON_SO2(EU);  %%% EU
SO2_EU = SO2(EU); %%% EU

dd_EU=figure;  %%% SO2 %%%
[c,h]=contourf(LONLON_EU,LATLAT_EU,griddata(LAT_SO2_EU,LON_SO2_EU,(log(SO2_EU))',LATLAT_EU,LONLON_EU')',32); 
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat;
colormap(idlcolormap)
max_data=ceil(max(max(log(SO2_EU))));
%caxis([0 max_data]); 
caxis([0 3])
% caxis ([0 6e+15]); 
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(date_species_GOME_EU,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_SO2,'FontSize',12,'FontWeight','bold');


%%%%%%%% UK map %%%%%%%%%%%%%%%%%%%%%%%%%%

LATLAT_UK=45:1:61; %%% UK
LONLON_UK=-14:1:5;  %%% UK

UK =LAT_SO2>45 & LAT_SO2<61 & LON_SO2>-14 & LON_SO2<5; %%% UK
LAT_SO2_UK = LAT_SO2(UK);  %%% UK
LON_SO2_UK = LON_SO2(UK);  %%% UK
SO2_UK = SO2(UK); %%% UK

dd_UK=figure;  %%% SO2 %%%
[c,h]=contourf(LONLON_UK,LATLAT_UK,griddata(LAT_SO2_UK,LON_SO2_UK,(log(SO2_UK))',LATLAT_UK,LONLON_UK')',32); 
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(SO2_UK)));
max_data=ceil(max(max(log(SO2_UK))));
%granule = (max_data - min_data) / ntickmarks; 
%caxis([0 max_data]); 
caxis ([0 3]); 
d = colorbar;
title(date_species_GOME_UK,'FontSize',14,'FontWeight','bold');
 ylabel(d,Unit_SO2,'FontSize',12,'FontWeight','bold');
% saveas(dd, 'C:\ECMWF_MET\GOME2\BEAT\matlab\GOME_SO2.jpg');

cd(output_directory)  %%%%% use 'directory_name' when run from \C disk %%%%%%%%%%%%
saveas(dd_WW,date_species_GOME_WW, 'jpg')
saveas(dd_EU,date_species_GOME_EU, 'jpg')
saveas(dd_UK,date_species_GOME_UK, 'jpg')
close Figure 1
close Figure 2
close Figure 3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% extract data for UK sites
[SO2_GOME] =[LAT_SO2, LON_SO2, SO2];   %%%%%%%%% all global data
save(date_species_GOME_txt,'SO2_GOME','-ASCII')

Lat_AURUN = AURUN_UKsites_2013(:,1);
Lon_AURUN = AURUN_UKsites_2013(:,2);

%test=NaN(720,6);
%test2=zeros(length(Lat_AURUN),1)
aaa= zeros(length(Lat_AURUN),1);
  SO2_NEW=NaN(length(Lat_AURUN),1);
%  counter = 1;
for i=1:length(SO2_GRID)
      for j=1:length(Lat_AURUN)
      distance = sqrt((Lat_AURUN(j)- LAT_GRID(i))^2 + (Lon_AURUN(j)- LON_GRID(i))^2);
      if distance < 0.71   %0.071
       SO2_NEW(j)=SO2_GRID(i); 
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

[GOME_SO2_AURUN] =[Lat_AURUN, Lon_AURUN, SO2_NEW]; %%% GRIDDED
%save GOME_SO2_AURUN.txt GOME_SO2_AURUN -ascii
%csvwrite('GOME_SO2_AURUN.csv',GOME_SO2_AURUN)
save(date_species_AURUN_txt,'GOME_SO2_AURUN','-ASCII') %%%% txt files (GRIDDED)

cd('C:\SATELLITE_STUFF\GOME2\BEAT\matlab') %%%%% use directory where main scripts are!!!!
%{

%}
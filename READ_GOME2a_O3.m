
%%%%% read all data fiels with extension .hdf5  (downloaded from ftp: http://atmos.caf.dlr.de/products/

function READ_GOME2a_O3(directory_name, output_directory, date_species_GOME_WW,date_species_GOME_EU,...
                         date_species_GOME_UK, date_species_AURUN_txt,date_species_GOME_txt) 

%directory_name = 'C:\SATELLITE_STUFF\GOME2\BEAT\matlab\20Jan2015'
 
load 'AURUN_UKsites_2013.TXT'         %%%%%% all AURUN site locations in UK....just lat and long
files = dir( fullfile(directory_name,'*.hdf5') );   %# list all *.hdf5 files
filenames = {files.name}';  %'# file names

fname=[];
for i=1:numel(filenames)
 fname1 = fullfile(directory_name,filenames{i});  %# full path to file   %%%% make a list!!!!
 fname = strvcat(fname,fname1);
 count = i

end

data_O3 = beatl2_ingest(fname,'include=o3_column'); %%% need a string array of filepaths
%CLOUD = beatl2_ingest(fname,'include=cloud_fraction'); %%% clouds
 
lat_O3 = data_O3.latitude;
lon_O3 = data_O3.longitude;
O3_Column = data_O3.o3_column;
%CLOUD_FRACTION = CLOUD.cloud_fraction;  %%%%% clouds
Unit_O3 = data_O3.o3_column_unit;

[GOME_O3] =[lat_O3, lon_O3, O3_Column]; 


%%%% O3 %%%%%%

ddd_O3=lon_O3 < 180;
%ddd_O3=lon_O3 < 180 & CLOUD_FRACTION < 0.5;
LAT_O3 = GOME_O3(ddd_O3,1);
LON_O3 = GOME_O3(ddd_O3,2);
O3 = GOME_O3(ddd_O3,3);
[GOME_a_O3] = [LAT_O3, LON_O3, O3];


aaa_O3=lon_O3 > 180;
%aaa_O3=lon_O3 > 180 & CLOUD_FRACTION < 0.5;
LAT_aaa_O3 = GOME_O3(aaa_O3,1);
LON_aaa_O3= GOME_O3(aaa_O3,2);
LON_aaa_O3=LON_aaa_O3-360;
O3_aaa = GOME_O3(aaa_O3,3);
[GOME_aaa_O3] = [LAT_aaa_O3, LON_aaa_O3, O3_aaa];

LAT_O3 = [LAT_O3;LAT_aaa_O3]; %%% bind latitudes
LON_O3 = [LON_O3;LON_aaa_O3]; %%% bind longitudes
O3 = [O3;O3_aaa];    %%% bind O3 columns


%%%%% WORLD WIDE MAP %%%%%%%%%%

LATLAT_WW =-86:1:75;
LONLON_WW =-180:1:180;

LAT_GRID = repmat((-86:1:75),1,length(LONLON_WW));
LAT_GRID = LAT_GRID';
LON_GRID = repmat((-180:1:180),length(LATLAT_WW), 1);
LON_GRID = reshape(LON_GRID ,length(LATLAT_WW)*length(LONLON_WW),1);

GRID_DATA_O3=griddata(LAT_O3,LON_O3,(O3)',LATLAT_WW,LONLON_WW');  %%%%% matrix
O3_GRID = reshape(GRID_DATA_O3,length(LATLAT_WW)*length(LONLON_WW),1); %%% vector


dd_WW=figure;  %%% O3 %%%
[c,h]=contourf(LONLON_WW,LATLAT_WW,griddata(LAT_O3,LON_O3,(O3)',LATLAT_WW,LONLON_WW')',32); 
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(O3)));
    %max_data=ceil(max(max(O3)));
%granule = (max_data - min_data) / ntickmarks;
   %caxis([0 max_data]); 
caxis ([100 600]); 
%caxis([-14 19])
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(date_species_GOME_WW,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_O3,'FontSize',12,'FontWeight','bold');


%%%%% EUROPE WIDE MAP %%%%%%%%%%

LATLAT_EU =30:1:75; % Europe 
LONLON_EU =-27:1:45; % Europe

EU =LAT_O3>30 & LAT_O3<75 & LON_O3>-27 & LON_O3<45; %%% EU
LAT_O3_EU = LAT_O3(EU);  %%% EU
LON_O3_EU = LON_O3(EU);  %%% EU
O3_EU = O3(EU); %%% EU

dd_EU=figure;  %%% O3 %%%
[c,h]=contourf(LONLON_EU,LATLAT_EU,griddata(LAT_O3_EU,LON_O3_EU,(O3_EU)',LATLAT_EU,LONLON_EU')',32); 
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat;
colormap(idlcolormap)
  %max_data=ceil(max(max(O3_EU)));
  %caxis([0 max_data]); 
%caxis([-14 19])
%caxis ([100 500]); 
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(date_species_GOME_EU,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_O3,'FontSize',12,'FontWeight','bold');


%%%%%%%% UK map %%%%%%%%%%%%%%%%%%%%%%%%%%

LATLAT_UK=45:1:61; %%% UK
LONLON_UK=-14:1:5;  %%% UK

UK =LAT_O3>45 & LAT_O3<61 & LON_O3>-14 & LON_O3<5; %%% UK
LAT_O3_UK = LAT_O3(UK);  %%% UK
LON_O3_UK = LON_O3(UK);  %%% UK
O3_UK = O3(UK); %%% UK

dd_UK=figure;  %%% O3 %%%
[c,h]=contourf(LONLON_UK,LATLAT_UK,griddata(LAT_O3_UK,LON_O3_UK,(O3_UK)',LATLAT_UK,LONLON_UK')',32); 
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(O3_UK)));
    %max_data=ceil(max(max(O3_UK)));
%granule = (max_data - min_data) / ntickmarks; 
    %caxis([0 max_data]); 
%caxis ([100 400]); 
d = colorbar;
title(date_species_GOME_UK,'FontSize',14,'FontWeight','bold');
 ylabel(d,Unit_O3,'FontSize',12,'FontWeight','bold');
% saveas(dd, 'C:\ECMWF_MET\GOME2\BEAT\matlab\GOME_O3.jpg');

cd(output_directory)  %%%%% use 'directory_name' when run from \C disk %%%%%%%%%%%%
saveas(dd_WW,date_species_GOME_WW, 'jpg')
saveas(dd_EU,date_species_GOME_EU, 'jpg')
saveas(dd_UK,date_species_GOME_UK, 'jpg')
close Figure 1
close Figure 2
close Figure 3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% extract data for UK sites
[O3_GOME] =[LAT_O3, LON_O3, O3];   %%%%%%%%% all global data
save(date_species_GOME_txt,'O3_GOME','-ASCII')

Lat_AURUN = AURUN_UKsites_2013(:,1);
Lon_AURUN = AURUN_UKsites_2013(:,2);

%test=NaN(720,6);
%test2=zeros(length(Lat_AURUN),1)
aaa= zeros(length(Lat_AURUN),1);
  O3_NEW=NaN(length(Lat_AURUN),1);
%  counter = 1;
for i=1:length(O3_GRID)
      for j=1:length(Lat_AURUN)
      distance = sqrt((Lat_AURUN(j)- LAT_GRID(i))^2 + (Lon_AURUN(j)- LON_GRID(i))^2);
      if distance < 0.71   %0.071
       O3_NEW(j)=O3_GRID(i); 
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

[GOME_O3_AURUN] =[Lat_AURUN, Lon_AURUN, O3_NEW]; %%% GRIDDED
%save GOME_O3_AURUN.txt GOME_O3_AURUN -ascii
%csvwrite('GOME_O3_AURUN.csv',GOME_O3_AURUN)
save(date_species_AURUN_txt,'GOME_O3_AURUN','-ASCII') %%%% txt files (GRIDDED)

cd('C:\SATELLITE_STUFF\GOME2\BEAT\matlab') %%%%% use directory where main scripts are!!!!
%{

%}
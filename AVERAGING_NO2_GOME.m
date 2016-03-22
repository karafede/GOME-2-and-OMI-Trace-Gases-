%%%%MAKE a list of ALL *NO2_GOME2a.txt first !!!!  USE 

function AVERAGING_NO2_GOME(directory_name,AVG_NO2_GOME2a_WW, AVG_NO2_GOME2a_EU,AVG_NO2_GOME2a_UK,...
         AVG_NO2_Feb2015_GOME_txt,AVG_NO2_AURUN_GOME_txt,output_directory)  %%% filename_txt is a list of daily files (TXT file: 20Jan2015_NO2_GOME2a)

% directory_name = 'C:\SATELLITE_STUFF\GOME2\BEAT\matlab\processed_data\Feb2015\NO2';
% directory_name = 'G:\processed_data\feb2015\no2';

load 'AURUN_UKsites_2013.TXT'         %%%%%% all AURUN site locations in UK....just lat and lon

           
filelist = dir( fullfile(directory_name,'*NO2_GOME2a.txt') );
%filelist = dir('*NO2_GOME2a.txt');
filenames = {filelist.name}';  %%%% file names

 
fid = fopen(fullfile(directory_name,'LISTA_NO2.txt'),'w'); %%% write a LIST of txt. files
for i = 1:length(filenames)
  fprintf(fid,'%s\r\n',filenames{i});
end
fclose(fid);


%fid=fopen('LISTA_NO2.txt','r');   %%%% read TXT files from LISTA_NO2.txt
fid=fopen(fullfile(directory_name,'LISTA_NO2.txt'),'r');   %%%% read TXT files from LISTA_NO2.txt
filenames=textscan(fid,'%s'); filelist=filenames{1};
fclose(fid); 
nrfiles=length(filelist);


%%%%% WORLD WIDE MAP %%%%%%%%%%

LATLAT_WW =-86:1:75; % global
LONLON_WW =-180:1:180; % global
sum_GOME_NO2_WW = zeros(length(LONLON_WW),length(LATLAT_WW));
howmany=0;
Unit_NO2 = 'mol/cm2';

cd(directory_name) %%% where GOME2a txt files are stored
for j=1:nrfiles
%fud=fopen(filelist{j},'r'); %%%%% open GOME2 data
M = dlmread(filelist {j});
LAT_NO2 = M(:,1);
LON_NO2 = M(:,2);
NO2 = M(:,3);
NO2_GRID_WW = griddata(LAT_NO2,LON_NO2,(NO2)',LATLAT_WW,LONLON_WW'); %%% Matrix (gridded data WW)
NO2_GRID_WW (isnan(NO2_GRID_WW)) = 0;  %%%%% in NO2_GRID_WW omit NaN or convert NaN to 0!
sum_GOME_NO2_WW=sum_GOME_NO2_WW + NO2_GRID_WW;
howmany=howmany+1;
end

averaged_GOME_NO2_WW=sum_GOME_NO2_WW/howmany;

AVG_WW=figure;  %%% NO2 %%%
[c,h]=contourf(LONLON_WW,LATLAT_WW,averaged_GOME_NO2_WW',32);
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load C:\SATELLITE_STUFF\GOME2\BEAT\matlab\idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(NO2)));
%max_data=ceil(max(max(averaged_GOME_NO2)));
%granule = (max_data - min_data) / ntickmarks;
%caxis([0 max_data]); 
caxis ([0 5.5e+15]); 
%caxis([-14 19])
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(AVG_NO2_GOME2a_WW,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_NO2,'FontSize',12,'FontWeight','bold');



%%%%% EUROPE WIDE MAP %%%%%%%%%%

LATLAT_EU =30:1:75; % Europe 
LONLON_EU =-27:1:45; % Europe
sum_GOME_NO2_EU = zeros(length(LONLON_EU),length(LATLAT_EU));
howmany=0;

for j=1:nrfiles
%fud=fopen(filelist{j},'r'); %%%%% open GOME2 data
M = dlmread(filelist {j});
LAT_NO2 = M(:,1);
LON_NO2 = M(:,2);
NO2 = M(:,3);
EU =LAT_NO2>30 & LAT_NO2<75 & LON_NO2>-27 & LON_NO2<45; %%% EU
LAT_NO2_EU = LAT_NO2(EU);  %%% EU
LON_NO2_EU = LON_NO2(EU);  %%% EU
NO2_EU = NO2(EU); %%% EU
NO2_GRID_EU = griddata(LAT_NO2_EU,LON_NO2_EU,(NO2_EU)',LATLAT_EU,LONLON_EU'); %%% Matrix (gridded data EU)
NO2_GRID_EU (isnan(NO2_GRID_EU )) = 0;
sum_GOME_NO2_EU=sum_GOME_NO2_EU + NO2_GRID_EU;
howmany=howmany+1;
end

averaged_GOME_NO2_EU=sum_GOME_NO2_EU/howmany;

AVG_EU=figure;  %%% NO2 %%%
[c,h]=contourf(LONLON_EU,LATLAT_EU,averaged_GOME_NO2_EU',32);
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load C:\SATELLITE_STUFF\GOME2\BEAT\matlab\idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(NO2)));
%max_data=ceil(max(max(averaged_GOME_NO2_EU)));
%granule = (max_data - min_data) / ntickmarks;
%caxis([0 max_data]); 
caxis ([0 5.5e+15]); 
%caxis([-14 19])
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(AVG_NO2_GOME2a_EU,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_NO2,'FontSize',12,'FontWeight','bold');


%%%%% UK WIDE MAP %%%%%%%%%%

LATLAT_UK=45:1:61; %%% UK
LONLON_UK=-14:1:5;  %%% UK
sum_GOME_NO2_UK = zeros(length(LONLON_UK),length(LATLAT_UK));
howmany=0;

for j=1:nrfiles
%fud=fopen(filelist{j},'r'); %%%%% open GOME2 data
M = dlmread(filelist {j});
LAT_NO2 = M(:,1);
LON_NO2 = M(:,2);
NO2 = M(:,3);
UK =LAT_NO2>45 & LAT_NO2<61 & LON_NO2>-14 & LON_NO2<5; %%% UK
LAT_NO2_UK = LAT_NO2(UK);  %%% UK
LON_NO2_UK = LON_NO2(UK);  %%% UK
NO2_UK = NO2(UK); %%% UK
NO2_GRID_UK = griddata(LAT_NO2_UK,LON_NO2_UK,(NO2_UK)',LATLAT_UK,LONLON_UK'); %%% Matrix (gridded data UK)
NO2_GRID_UK (isnan(NO2_GRID_UK )) = 0;
sum_GOME_NO2_UK=sum_GOME_NO2_UK + NO2_GRID_UK;
howmany=howmany+1;
end

averaged_GOME_NO2_UK=sum_GOME_NO2_UK/howmany;

AVG_UK=figure;  %%% NO2 %%%
[c,h]=contourf(LONLON_UK,LATLAT_UK,averaged_GOME_NO2_UK',32);
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load C:\SATELLITE_STUFF\GOME2\BEAT\matlab\idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(NO2)));
%max_data=ceil(max(max(averaged_GOME_NO2_UK)));
%granule = (max_data - min_data) / ntickmarks;
%caxis([0 max_data]); 
caxis ([0 5e+15]); 
%caxis([-14 19])
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(AVG_NO2_GOME2a_UK,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_NO2,'FontSize',12,'FontWeight','bold');
cd(output_directory)  %%%%% use 'directory_name' when run from \C disk %%%%%%%%%%%%
saveas(AVG_WW,AVG_NO2_GOME2a_WW, 'jpg')
saveas(AVG_EU,AVG_NO2_GOME2a_EU, 'jpg')
saveas(AVG_UK,AVG_NO2_GOME2a_UK, 'jpg')
close Figure 1
close Figure 2
close Figure 3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% extract data for UK sites

AVG_NO2 = reshape(averaged_GOME_NO2_WW,length(LATLAT_WW)*length(LONLON_WW),1); %%% Vector
LAT_GRID = repmat((-86:1:75),1,length(LONLON_WW));
LAT_GRID = LAT_GRID';
LON_GRID = repmat((-180:1:180),length(LATLAT_WW), 1);
LON_GRID = reshape(LON_GRID ,length(LATLAT_WW)*length(LONLON_WW),1);
[NO2_GOME] =[LAT_GRID,LON_GRID, AVG_NO2];   %%%%%%%%% AVERAGED GRIDDED DATA
save(AVG_NO2_Feb2015_GOME_txt,'NO2_GOME','-ASCII')    %%%%% Save GRIDDED data


Lat_AURUN = AURUN_UKsites_2013(:,1);
Lon_AURUN = AURUN_UKsites_2013(:,2);

aaa= zeros(length(Lat_AURUN),1);
  NO2_NEW=NaN(length(Lat_AURUN),1);
for i=1:length(AVG_NO2)
      for j=1:length(Lat_AURUN)
      distance = sqrt((Lat_AURUN(j)- LAT_GRID(i))^2 + (Lon_AURUN(j)-LON_GRID(i))^2);
      if distance < 0.71   %0.071
       NO2_NEW(j)=AVG_NO2(i); 
           end
     end
end

[GOME_NO2_AURUN] =[Lat_AURUN, Lon_AURUN, NO2_NEW];  %%%% GRIDDED
save(AVG_NO2_AURUN_GOME_txt,'GOME_NO2_AURUN','-ASCII') %%%% txt files (GRIDDED)


cd('C:\SATELLITE_STUFF\GOME2\BEAT\matlab') %%%%% use directory where main scripts are!!!!



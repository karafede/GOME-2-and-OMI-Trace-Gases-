%%%%MAKE a list of ALL *SO2_GOME2a.txt first !!!!  USE 

function AVERAGING_SO2_GOME(directory_name,AVG_SO2_GOME2a_WW, AVG_SO2_GOME2a_EU,AVG_SO2_GOME2a_UK,...
         AVG_SO2_Feb2015_GOME_txt,AVG_SO2_AURUN_GOME_txt,output_directory)  %%% filename_txt is a list of daily files (TXT file: 20Jan2015_SO2_GOME2a)

% directory_name = 'C:\SATELLITE_STUFF\GOME2\BEAT\matlab\processed_data\Feb2015\SO2';
% directory_name = 'G:\processed_data\feb2015\SO2';

load 'AURUN_UKsites_2013.TXT'         %%%%%% all AURUN site locations in UK....just lat and lon

filelist = dir( fullfile(directory_name,'*SO2_GOME2a.txt') );
%filelist = dir('*SO2_GOME2a.txt'); 
filenames = {filelist.name}';  %%%% file names


fid = fopen(fullfile(directory_name,'LISTA_SO2.txt'),'w'); %%% write LIST of txt. files
for i = 1:length(filenames)
  fprintf(fid,'%s\r\n',filenames{i});
end
fclose(fid);


%fid=fopen('LISTA_SO2.txt','r');   %%%% read TXT files from LISTA_SO2.txt
fid=fopen(fullfile(directory_name,'LISTA_SO2.txt'),'r');   %%%% read TXT files from LISTA_SO2.txt
filenames=textscan(fid,'%s'); filelist=filenames{1};
fclose(fid); 
nrfiles=length(filelist);


%%%%% WORLD WIDE MAP %%%%%%%%%%

LATLAT_WW =-86:1:75; % global
LONLON_WW =-180:1:180; % global
sum_GOME_SO2_WW = zeros(length(LONLON_WW),length(LATLAT_WW));
howmany=0;
Unit_SO2 = 'DU';

cd(directory_name) %%% where GOME2a txt files are stored
for j=1:nrfiles
%fud=fopen(filelist{j},'r'); %%%%% open GOME2 data
M = dlmread(filelist {j});
LAT_SO2 = M(:,1);
LON_SO2 = M(:,2);
SO2 = M(:,3);
SO2_GRID_WW = griddata(LAT_SO2,LON_SO2,(SO2)',LATLAT_WW,LONLON_WW'); %%% Matrix (gridded data WW)
SO2_GRID_WW (isnan(SO2_GRID_WW)) = 0;
sum_GOME_SO2_WW=sum_GOME_SO2_WW + SO2_GRID_WW;
howmany=howmany+1;
end

averaged_GOME_SO2_WW=sum_GOME_SO2_WW/howmany;

AVG_WW=figure;  %%% SO2 %%%
[c,h]=contourf(LONLON_WW,LATLAT_WW,((averaged_GOME_SO2_WW))',32);
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load C:\SATELLITE_STUFF\GOME2\BEAT\matlab\idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(SO2)));
%max_data=ceil(max(max(averaged_GOME_SO2)));
%granule = (max_data - min_data) / ntickmarks;
%caxis([0 max_data]); 
caxis ([0 2]); 
%caxis([-14 19])
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(AVG_SO2_GOME2a_WW,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_SO2,'FontSize',12,'FontWeight','bold');



%%%%% EUROPE WIDE MAP %%%%%%%%%%

LATLAT_EU =30:1:75; % Europe 
LONLON_EU =-27:1:45; % Europe
sum_GOME_SO2_EU = zeros(length(LONLON_EU),length(LATLAT_EU));
howmany=0;

for j=1:nrfiles
%fud=fopen(filelist{j},'r'); %%%%% open GOME2 data
M = dlmread(filelist {j});
LAT_SO2 = M(:,1);
LON_SO2 = M(:,2);
SO2 = M(:,3);
EU =LAT_SO2>30 & LAT_SO2<75 & LON_SO2>-27 & LON_SO2<45; %%% EU
LAT_SO2_EU = LAT_SO2(EU);  %%% EU
LON_SO2_EU = LON_SO2(EU);  %%% EU
SO2_EU = SO2(EU); %%% EU
SO2_GRID_EU = griddata(LAT_SO2_EU,LON_SO2_EU,(SO2_EU)',LATLAT_EU,LONLON_EU'); %%% Matrix (gridded data EU)
SO2_GRID_EU (isnan(SO2_GRID_EU)) = 0;
sum_GOME_SO2_EU=sum_GOME_SO2_EU + SO2_GRID_EU;
howmany=howmany+1;
end

averaged_GOME_SO2_EU=sum_GOME_SO2_EU/howmany;

AVG_EU=figure;  %%% SO2 %%%
[c,h]=contourf(LONLON_EU,LATLAT_EU,((averaged_GOME_SO2_EU))',32);
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load C:\SATELLITE_STUFF\GOME2\BEAT\matlab\idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(SO2)));
%max_data=ceil(max(max(averaged_GOME_SO2)));
%granule = (max_data - min_data) / ntickmarks;
%caxis([0 max_data]); 
caxis ([0 2]); 
%caxis([-14 19])
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(AVG_SO2_GOME2a_EU,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_SO2,'FontSize',12,'FontWeight','bold');


%%%%% UK WIDE MAP %%%%%%%%%%

LATLAT_UK=45:1:61; %%% UK
LONLON_UK=-14:1:5;  %%% UK
sum_GOME_SO2_UK = zeros(length(LONLON_UK),length(LATLAT_UK));
howmany=0;

for j=1:nrfiles
%fud=fopen(filelist{j},'r'); %%%%% open GOME2 data
M = dlmread(filelist {j});
LAT_SO2 = M(:,1);
LON_SO2 = M(:,2);
SO2 = M(:,3);
UK =LAT_SO2>45 & LAT_SO2<61 & LON_SO2>-14 & LON_SO2<5; %%% UK
LAT_SO2_UK = LAT_SO2(UK);  %%% UK
LON_SO2_UK = LON_SO2(UK);  %%% UK
SO2_UK = SO2(UK); %%% UK
SO2_GRID_UK = griddata(LAT_SO2_UK,LON_SO2_UK,(SO2_UK)',LATLAT_UK,LONLON_UK'); %%% Matrix (gridded data UK)
SO2_GRID_UK (isnan(SO2_GRID_UK)) = 0;
sum_GOME_SO2_UK=sum_GOME_SO2_UK + SO2_GRID_UK;
howmany=howmany+1;
end

averaged_GOME_SO2_UK=sum_GOME_SO2_UK/howmany;

AVG_UK=figure;  %%% SO2 %%%
[c,h]=contourf(LONLON_UK,LATLAT_UK,((averaged_GOME_SO2_UK))',32);
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load C:\SATELLITE_STUFF\GOME2\BEAT\matlab\idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(SO2)));
%max_data=ceil(max(max(averaged_GOME_SO2)));
%granule = (max_data - min_data) / ntickmarks;
%caxis([0 max_data]); 
caxis ([0 2]); 
%caxis([-14 19])
%set(k,'CLim',[0, 1.5]);
d = colorbar;
title(AVG_SO2_GOME2a_UK,'FontSize',14,'FontWeight','bold');
ylabel(d,Unit_SO2,'FontSize',12,'FontWeight','bold');
cd(output_directory)  %%%%% use 'directory_name' when run from \C disk %%%%%%%%%%%%
saveas(AVG_WW,AVG_SO2_GOME2a_WW, 'jpg')
saveas(AVG_EU,AVG_SO2_GOME2a_EU, 'jpg')
saveas(AVG_UK,AVG_SO2_GOME2a_UK, 'jpg')
close Figure 1
close Figure 2
close Figure 3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% extract data for UK sites

AVG_SO2 = reshape(averaged_GOME_SO2_WW,length(LATLAT_WW)*length(LONLON_WW),1); %%% Vector
LAT_GRID = repmat((-86:1:75),1,length(LONLON_WW));
LAT_GRID = LAT_GRID';
LON_GRID = repmat((-180:1:180),length(LATLAT_WW), 1);
LON_GRID = reshape(LON_GRID ,length(LATLAT_WW)*length(LONLON_WW),1);
[SO2_GOME] =[LAT_GRID,LON_GRID, AVG_SO2];   %%%%%%%%% AVERAGED GRIDDED DATA
save(AVG_SO2_Feb2015_GOME_txt,'SO2_GOME','-ASCII')


Lat_AURUN = AURUN_UKsites_2013(:,1);
Lon_AURUN = AURUN_UKsites_2013(:,2);

aaa= zeros(length(Lat_AURUN),1);
  SO2_NEW=NaN(length(Lat_AURUN),1);
for i=1:length(AVG_SO2)
      for j=1:length(Lat_AURUN)
      distance = sqrt((Lat_AURUN(j)- LAT_GRID(i))^2 + (Lon_AURUN(j)-LON_GRID(i))^2);
      if distance < 0.71   %0.071
       SO2_NEW(j)=AVG_SO2(i); 
           end
     end
end

[GOME_SO2_AURUN] =[Lat_AURUN, Lon_AURUN, SO2_NEW];  %%%% GRIDDED
save(AVG_SO2_AURUN_GOME_txt,'GOME_SO2_AURUN','-ASCII') %%%% txt files (GRIDDED)


cd('C:\SATELLITE_STUFF\GOME2\BEAT\matlab') %%%%% use directory where main scripts are!!!!



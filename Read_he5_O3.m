%%%%%%%%%%%%%%% read he5 files from OMI/AURA %%%%%%% Ozone Level 3 (L3) %%%%%%%% 

function Read_he5_O3(FILE_NAME_a,output_directory,O3_date,O3_text,O3_OMI_text)

% Open the HDF5 File.

FILE_NAME = FILE_NAME_a;
file_id = H5F.open (FILE_NAME, 'H5F_ACC_RDONLY', 'H5P_DEFAULT');

% Open the dataset.
DATAFIELD_NAME = '/HDFEOS/GRIDS/ColumnAmountO3/Data Fields/ColumnAmountO3';
data_id = H5D.open (file_id, DATAFIELD_NAME);

% Get dataspace. 
data_space = H5D.get_space (data_id);
[data_numdims data_dims data_maxdims]= H5S.get_simple_extent_dims (data_space);
data_dims=fliplr(data_dims');

% Read the dataset.
data=H5D.read (data_id,'H5T_NATIVE_DOUBLE', 'H5S_ALL', 'H5S_ALL', 'H5P_DEFAULT');



% Transpose the data to match the map projection.

data=data';



% Release resources.
H5S.close (data_space)

% Read the units.
ATTRIBUTE = 'Units';
attr_id = H5A.open_name (data_id, ATTRIBUTE);
units = H5A.read(attr_id, 'H5ML_DEFAULT');

% Read the fill value.
ATTRIBUTE = '_FillValue';
attr_id = H5A.open_name (data_id, ATTRIBUTE);
fillvalue=H5A.read (attr_id, 'H5T_NATIVE_DOUBLE');

% Read the missing value.
ATTRIBUTE = 'MissingValue';
attr_id = H5A.open_name (data_id, ATTRIBUTE);
missingvalue=H5A.read (attr_id, 'H5T_NATIVE_DOUBLE');

% Read title attribute.
ATTRIBUTE = 'Title';
attr_id = H5A.open_name (data_id, ATTRIBUTE);
long_name=H5A.read (attr_id, 'H5ML_DEFAULT');


% Close and release resources.
H5A.close (attr_id)
H5D.close (data_id);
H5F.close (file_id);

% Since the datafile doesn't provide lat and lon, 
% we need to calculate lat and lon data using Geo projection.
offsetY = 0.5;
offsetX = 0.5;
scaleX = 360/data_dims(2);
scaleY = 180/data_dims(1);

for i = 0:(data_dims(2)-1)
  lon_value(i+1) = (i+offsetX)*(scaleX) + (-180);
end

for j = 0:(data_dims(1)-1)
  lat_value(j+1) = (j+offsetY)*(scaleY) - 90;
end

% Convert the data to double type for plot.
lon=double(lon_value);
lat=double(lat_value);



% Replace the fill value with NaN.
data(data==fillvalue) = NaN;

% Replace the missing value with NaN.
data(data==missingvalue) = NaN;

%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

latlim=[33 73.5];      %% Europe
lonlim=[-27 45];      %% Europe

LATLAT =33:0.25:73;  %%Europe
LONLON =-27:0.25:45;  %% Europe

%latlim=[-89.75 89.75];      
%lonlim=[-179.75 179.75];      

%LATLAT =-89.75:0.25:89.75;
%LONLON =-179.75:0.25:179.75;

lat = double(lat(:,:,1));
lon = double(lon(:,:,1));


vv=figure;
%tf=find(u10_1Feb==0);
%tf=find(u10_1Feb<10^-30);
%tf=find(u10_1Feb>21);
%tg=find(u10_1Feb<0);
%u10_1Feb(tf)=NaN;
%u10_1Feb(tg)=NaN;
[c,h]=contourf(LONLON,LATLAT,griddata(lat,lon,(data)',LATLAT,LONLON')',32);    %%%%logaritmic data!!!!!
grid;
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat
colormap(idlcolormap)
%caxis([-14 19])
%set(k,'CLim',[0, 1.5]);
colorbar;
title('OMI Ozone');
%set(pp,'Box','off'); set(pp,'Ycolor','white'); set(pp,'Xcolor','white');

%}
%%%%%%%%% Plot World Wide %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig_WW = figure('Name', FILE_NAME, 'visible', 'off');

if isempty(ver('map'))
    warning('Mapping Toolbox not present.')
    pcolor(lon,lat,data); shading flat;
else

        latlim=[-86,75];
        lonlim=[-180,180];

    axesm('MapProjection','eqdcylin','MapLatLimit', ...
          latlim,'MapLonLimit',lonlim,'Frame','on','Grid','off', ...
          'MeridianLabel','on','ParallelLabel','on', ...
          'MLabelParallel','south');
    surfm(lat,lon,data);

    coast = load('coast.mat');
    plotm(coast.lat,coast.long,'k')
    
end

% Change the value if you want to have more than 10 tick marks.
ntickmarks = 10;
%min_data=floor(min(min(data)));
min_data = 100;
%max_data=ceil(max(max(data)));
max_data = 600;
granule = (max_data - min_data) / ntickmarks;
load idlcolormap.mat
colormap(idlcolormap)
caxis([100 600]); 
h = colorbar('YTick', 0:granule:max_data);


% An HDF5 string attribute is an array of characters.
% Without the following conversion, the characters in unit will appear 
% in a veritcal direction.
unit = sprintf('%s', units);
name = sprintf('%s', long_name);
set(get(h, 'title'), 'string', unit, 'FontSize',16,'FontWeight', ...
                   'bold');

plotm(coast.lat,coast.long,'k')

title({O3_date; name}, ... 
      'Interpreter', 'None', 'FontSize',16,'FontWeight','bold');

scrsz = get(0,'ScreenSize');
set(fig_WW,'position',scrsz,'PaperPositionMode','auto');
%{
% Plot the data using surfm and axesm.
f = figure('Name', FILE_NAME, 'visible', 'off');

if isempty(ver('map'))
    warning('Mapping Toolbox not present.')
    pcolor(lon,lat,data); shading flat;
else
    latlim=[floor(min(min(lat))),ceil(max(max(lat)))];
    lonlim=[floor(min(min(lon))),ceil(max(max(lon)))];

    axesm('MapProjection','eqdcylin','MapLatLimit', ...
          latlim,'MapLonLimit',lonlim,'Frame','on','Grid','on', ...
          'MeridianLabel','on','ParallelLabel','on', ...
          'MLabelParallel','south');
    surfm(lat,lon,data);

    coast = load('coast.mat');
    plotm(coast.lat,coast.long,'k')
    
end

% Change the value if you want to have more than 10 tick marks.
ntickmarks = 10;
min_data=floor(min(min(data)));
max_data=ceil(max(max(data)));
granule = (max_data - min_data) / ntickmarks;
colormap('Jet');
caxis([min_data max_data]); 
h = colorbar('YTick', min_data:granule:max_data);


% An HDF5 string attribute is an array of characters.
% Without the following conversion, the characters in unit will appear 
% in a veritcal direction.
unit = sprintf('%s', units);
name = sprintf('%s', long_name);
set(get(h, 'title'), 'string', unit, 'FontSize',16,'FontWeight', ...
                   'bold');

plotm(coast.lat,coast.long,'k')

title({FILE_NAME; name}, ... 
      'Interpreter', 'None', 'FontSize',16,'FontWeight','bold');

scrsz = get(0,'ScreenSize');
set(f,'position',scrsz,'PaperPositionMode','auto');

saveas(f, 'C:\ECMWF_MET\ftp_O3_L3_OMI\OOMI-Aura_L3-OMDOAO3e_2014m1208_v003-2014m1210t015315.m.jpg');
%saveas(f,O3_date, 'png')

%}
%%%%%%%%% Plot Europe %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig_EU = figure('Name', FILE_NAME, 'visible', 'off');

if isempty(ver('map'))
    warning('Mapping Toolbox not present.')
    pcolor(lon,lat,data); shading flat;
else

        latlim=[30,75];
        lonlim=[-27,45];

    axesm('MapProjection','eqdcylin','MapLatLimit', ...
          latlim,'MapLonLimit',lonlim,'Frame','on','Grid','off', ...
          'MeridianLabel','on','ParallelLabel','on', ...
          'MLabelParallel','south');
    surfm(lat,lon,data);

    coast = load('coast.mat');
    plotm(coast.lat,coast.long,'k')
    
end

% Change the value if you want to have more than 10 tick marks.
ntickmarks = 10;
min_data=floor(min(min(data)));
%min_data = 0;
max_data=ceil(max(max(data)));
%max_data = 7e+15;
granule = (max_data - min_data) / ntickmarks;
load idlcolormap.mat
colormap(idlcolormap)
caxis([min_data max_data]); 
h = colorbar('YTick', 0:granule:max_data);


% An HDF5 string attribute is an array of characters.
% Without the following conversion, the characters in unit will appear 
% in a veritcal direction.
unit = sprintf('%s', units);
name = sprintf('%s', long_name);
set(get(h, 'title'), 'string', unit, 'FontSize',16,'FontWeight', ...
                   'bold');

plotm(coast.lat,coast.long,'k')

title({O3_date; name}, ... 
      'Interpreter', 'None', 'FontSize',16,'FontWeight','bold');

scrsz = get(0,'ScreenSize');
set(fig_EU,'position',scrsz,'PaperPositionMode','auto');



%%%%%%%%% Plot UK %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plot the data using surfm and axesm.
fig_UK = figure('Name', FILE_NAME, 'visible', 'off');

if isempty(ver('map'))
    warning('Mapping Toolbox not present.')
    pcolor(lon,lat,data); shading flat;
else
    %latlim=[floor(min(min(lat))),ceil(max(max(lat)))];
    %lonlim=[floor(min(min(lon))),ceil(max(max(lon)))];
    
        latlim=[45,61];
        lonlim=[-14,5];

    axesm('MapProjection','eqdcylin','MapLatLimit', ...
          latlim,'MapLonLimit',lonlim,'Frame','on','Grid','off', ...
          'MeridianLabel','on','ParallelLabel','on', ...
          'MLabelParallel','south');
    surfm(lat,lon,data);

    coast = load('coast.mat');
    plotm(coast.lat,coast.long,'k')
    
end

% Change the value if you want to have more than 10 tick marks.
ntickmarks = 10;
min_data=floor(min(min(data)));
%min_data = 0;
max_data=ceil(max(max(data)));
%max_data = 7e+15;
granule = (max_data - min_data) / ntickmarks;
load idlcolormap.mat
colormap(idlcolormap)
caxis([min_data max_data]); 
h = colorbar('YTick', 0:granule:max_data);

% An HDF5 string attribute is an array of characters.
% Without the following conversion, the characters in unit will appear 
% in a veritcal direction.
unit = sprintf('%s', units);
name = sprintf('%s', long_name);
set(get(h, 'title'), 'string', unit, 'FontSize',16,'FontWeight', ...
                   'bold');

plotm(coast.lat,coast.long,'k')

title({O3_date; name}, ... 
      'Interpreter', 'None', 'FontSize',16,'FontWeight','bold');

scrsz = get(0,'ScreenSize');
set(fig_UK,'position',scrsz,'PaperPositionMode','auto');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Merge data for AURUN sites (Wind Speed) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

LAT = repmat((-89.875:0.25:89.875),1,1440);
LAT = LAT';
LON = repmat((-179.875:0.25:179.875),720, 1);
LON = reshape(LON,1440*720,1);

data_Vect = reshape(data,1440*720,1);   %%% make a vector

%%%%%% all AURUN site locations in UK....just lat and long
load 'AURUN_UKsites_2013.TXT'

Lat_AURUN = AURUN_UKsites_2013(:,1);
Lon_AURUN = AURUN_UKsites_2013(:,2);

aaa= zeros(length(Lat_AURUN),1);
data_NEW=NaN(length(Lat_AURUN),1);

for i=1:length(data_Vect)
      for j=1:length(Lat_AURUN)
      distance = sqrt((Lat_AURUN(j)- LAT(i))^2 + (Lon_AURUN(j)- LON(i))^2);
        if distance < 0.17   %0.071
            data_NEW(j)=data_Vect(i);
        end
      end
end

[OMI_AURUN] = [Lat_AURUN, Lon_AURUN, data_NEW];
[O3_OMI] = [LAT,LON,data_Vect];
cd(output_directory);
WWTitle = strcat(O3_date,' WW');
EUTitle = strcat(O3_date,' EU');
UKTitle = strcat(O3_date,' UK');
saveas(fig_WW,WWTitle, 'jpg');
saveas(fig_EU,EUTitle, 'jpg');
saveas(fig_UK,UKTitle, 'jpg');
save(O3_text,'OMI_AURUN','-ASCII'); %%%% greatsaving ASCII format (AURUN MERGED data from OMI data %%% open with Textpad)
save(O3_OMI_text,'O3_OMI','-ASCII'); %%%% txt files for GLOBAL OMI data      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

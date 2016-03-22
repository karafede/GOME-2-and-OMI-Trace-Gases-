%%%%%%%%%%%%%%% read he5 files from OMI/AURA %%%%%%% AERO Level 3 (L3) %%%%%%%% 

%FILE_NAME = 'Z:\omi_l3\aero\04\OMI-Aura_L3-OMAEROe_2015m0427_v003-2015m0429t021729.he5';

function Read_he5_AERO(FILE_NAME_a,output_directory,AERO_date,AERO_text,AERO_OMI_text)

% Open the HDF5 File.
FILE_NAME = FILE_NAME_a;
file_id = H5F.open (FILE_NAME, 'H5F_ACC_RDONLY', 'H5P_DEFAULT');

% Open the dataset.
DATAFIELD_NAME = '/HDFEOS/GRIDS/ColumnAmountAerosol/Data Fields/AerosolOpticalThicknessMW';
%DATAFIELD_NAME = '/HDFEOS/GRIDS/ColumnAmountAerosol/Data Fields/AerosolModelMW';
data_id = H5D.open (file_id, DATAFIELD_NAME);

% Get dataspace. 
data_space = H5D.get_space (data_id);
[data_numdims data_dims data_maxdims]= H5S.get_simple_extent_dims (data_space);
data_dims=fliplr(data_dims');

% Read the dataset.
data=H5D.read (data_id,'H5T_NATIVE_DOUBLE', 'H5S_ALL', 'H5S_ALL', 'H5P_DEFAULT');

data = data(:,:,1);
% Transpose the data to match the map projection.
data=data';
data=data*0.001;

% Release resources.
H5S.close (data_space)

% Read the units.
ATTRIBUTE = 'Units';
attr_id = H5A.open_name (data_id, ATTRIBUTE);
units = H5A.read(attr_id, 'H5ML_DEFAULT');
units = 'no units';

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

for j = 0:(data_dims(3)-1)    %%%%% for j = 0:(data_dims(3)-1)
  lat_value(j+1) = (j+offsetY)*(scaleY) - 90;
end

% Convert the data to double type for plot.
lon=double(lon_value);
lat=double(lat_value);

% Replace the fill value with NaN.
data(data==fillvalue) = NaN;

% Replace the missing value with NaN.
data(data==missingvalue) = NaN;

%%%%% WORLD WIDE MAP %%%%%%%%%%
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
min_data = 0;
%max_data=ceil(max(max(data)));
max_data = 3;
granule = (max_data - min_data) / ntickmarks;
load idlcolormap.mat
colormap(idlcolormap)
caxis([0 3]); 
h = colorbar('YTick', 0:granule:max_data);


% An HDF5 string attribute is an array of characters.
% Without the following conversion, the characters in unit will appear 
% in a veritcal direction.
unit = sprintf('%s', units);
name = sprintf('%s', long_name);
set(get(h, 'title'), 'string', unit, 'FontSize',16,'FontWeight', ...
                   'bold');

plotm(coast.lat,coast.long,'k')

title({AERO_date; 'Spectral Aerosol Optical Thickness'}, ... 
      'Interpreter', 'None', 'FontSize',16,'FontWeight','bold');

scrsz = get(0,'ScreenSize');
set(fig_WW,'position',scrsz,'PaperPositionMode','auto');
%{
LATLAT_WW =-89.8750:0.25:89.8750;
LONLON_WW =-179.8750:0.25:179.8750;

LAT_AERO = repmat((-89.8750:0.25:89.8750),1,length(LONLON_WW));
LAT_AERO = LAT_AERO';
LON_AERO = repmat((-179.8750:0.25:179.8750),length(LATLAT_WW),1);
LON_AERO = reshape(LON_AERO ,length(lat)*length(lon),1);

data_vect = reshape(data,length(lat)*length(lon),1); 
data_vect = data_vect * 0.001;

fig_WW=figure;  %%% AERO %%%
[c,h]=contourf(LONLON_WW,LATLAT_WW,griddata(LAT_AERO,LON_AERO,(data_vect)',LATLAT_WW,LONLON_WW')',32); 
%grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat;
colormap(idlcolormap)
%ntickmarks = 10;
%min_data=floor(min(min(NO2)));
%max_data=ceil(max(max(data_vect)));
%granule = (max_data - min_data) / ntickmarks;
%caxis([0 max_data]); 
caxis ([0 3]); 
%caxis([-14 19])
%set(k,'CLim',[0, 1.5]);
d = colorbar;

title('Aerosol Optical Thickness 28 April 2015','FontSize',14,'FontWeight','bold');
ylabel(d,units,'FontSize',12,'FontWeight','bold');


%{
cd(output_directory);

title(AERO_date,'FontSize',14,'FontWeight','bold');
ylabel(d,units,'FontSize',12,'FontWeight','bold');
WWTitle = strcat(AERO_date,'WW');
saveas(fig_WW,WWTitle, 'jpg');
close Figure 1
%}

%{
%%%%% EUROPE WIDE MAP %%%%%%%%%%

LATLAT_EU =30:0.25:75; % Europe 
LONLON_EU =-27:0.25:45; % Europe

EU =LAT_AERO>30 & LAT_AERO<75 & LAT_AERO>-27 & LAT_AERO<45; %%% EU
LAT_EU = LAT_AERO(EU);  %%% EU
LON_EU = LON_AERO(EU);  %%% EU
data_vect_EU = data_vect(EU); %%% EU

fig_EU=figure;  %%% AERO %%%
[c,h]=contourf(LONLON_EU,LATLAT_EU,griddata(LAT_EU,LON_EU,(data_vect_EU)',LATLAT_EU,LONLON_EU')',32); 
grid; 
clear c; set(h,'LineStyle','none');
geoshow(shaperead('landareas.shp','UseGeoCoords',true),'FaceColor','none','EdgeColor',[0 0 0]); 
load idlcolormap.mat;
colormap(idlcolormap)
caxis ([0 1]); 
d = colorbar;

cd(output_directory);

title(AERO_date,'FontSize',14,'FontWeight','bold');
ylabel(d,units,'FontSize',12,'FontWeight','bold');
EUTitle = strcat(AERO_date,'WW');
saveas(fig_EU,EUTitle, 'jpg');
close Figure 1

%}
%}
%%%%%%%%%%%%%% Merge data for AURUN sites %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% all AURUN site locations in UK....just lat and lon
LAT = repmat((-89.875:0.25:89.875),1,1440);
LAT = LAT';
LON = repmat((-179.875:0.25:179.875),720, 1);
LON = reshape(LON,1440*720,1);

data_vect = reshape(data,1440*720,1);   %%% make a vector

%%%%%% all AURUN site locations in UK....just lat and long
load 'AURUN_UKsites_2013.TXT'

Lat_AURUN = AURUN_UKsites_2013(:,1);
Lon_AURUN = AURUN_UKsites_2013(:,2);

aaa= zeros(length(Lat_AURUN),1);
data_NEW=NaN(length(Lat_AURUN),1);

for i=1:length(data_vect)
      for j=1:length(Lat_AURUN)
      distance = sqrt((Lat_AURUN(j)- LAT(i))^2 + (Lon_AURUN(j)- LON(i))^2);
        if distance < 0.17   %0.071
            data_NEW(j)=data_vect(i);
        end
      end
end

[OMI_AURUN] =[Lat_AURUN, Lon_AURUN, data_NEW]; 
[AERO_OMI] = [LAT,LON,data_vect];

cd(output_directory);
WWTitle = strcat(AERO_date,' WW');
%EUTitle = strcat(AERO_date,' EU');
%UKTitle = strcat(AERO_date,' UK');
saveas(fig_WW,WWTitle, 'jpg');
%saveas(fig_EU,EUTitle, 'jpg');
%saveas(fig_UK,UKTitle, 'jpg');
%save('28_April_2015.txt','OMI_AERO_AURUN','-ASCII');
save(AERO_text,'OMI_AURUN','-ASCII'); %%%% greatsaving ASCII format (AURUN MERGED data from OMI data %%% open with Textpad)
save(AERO_OMI_text,'AERO_OMI','-ASCII');  %%%% txt files for GLOBAL OMI data     

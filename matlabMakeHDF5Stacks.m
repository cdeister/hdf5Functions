filterString='Ch3';
filteredFiles = dir(['*' filterString '*.tif']);
filteredFiles=resortImageFileMap(filteredFiles);


canaryImport=imread([filteredFiles(1,1).name]);
imageSize=size(canaryImport);
canaryInfo=whos('canaryImport');
bitD=canaryInfo.class;

%%
h5Path='/Users/cad/Documents/ci01_imStacks.h5';
h5Stack='/001';

h5create(h5Path,h5Stack,[imageSize(1) imageSize(2) numel(filteredFiles)],'Datatype',bitD)

%%
tic
for n=1:numel(filteredFiles)
    h5write(h5Path,h5Stack,imread([filteredFiles(n,1).name]),[1 1 n],[520 696 1]);
end
toc
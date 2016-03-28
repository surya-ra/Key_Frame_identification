clc;
close all;
countm=0;
counte=0;
counth=0;
tot=1;
avg=0;
mov = VideoReader('longvid.avi.mp4');
% movie(mov);
% Determine how many frames there are.
numberOfFrames = size(mov, 2);
numberOfFramesWritten = 0;
% Output folder
outputFolder = fullfile(cd, 'frames');
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end
outputFolder3 = fullfile(cd, 'frames3');
if ~exist(outputFolder3, 'dir')
    mkdir(outputFolder3);
end
outputFolder2 = fullfile(cd, 'frames2');
if ~exist(outputFolder2, 'dir')
    mkdir(outputFolder2);
end
outputFolder1 = fullfile(cd, 'frames1');
if ~exist(outputFolder1, 'dir')
    mkdir(outputFolder1);
end

%getting no of frames

numberOfFrames = mov.NumberOfFrames;
numberOfFramesWritten = 0;
 oldFrame = read(mov, 1);
  oldFrame1 = read(mov, 1); oldFrame2 = read(mov, 1); oldFrame3 = read(mov, 1);
 imshow(oldFrame);
ee=0;
for frame = 1 : 1000
     outputBaseFileName = sprintf('%3.3d.png', frame);
        outputFullFileName = fullfile(outputFolder, outputBaseFileName);
        imwrite(thisFrame, outputFullFileName, 'png')
    
    thisFrame = read(mov, frame);
     dd = difference3(thisFrame,oldFrame3)
     ff = int32(dd)
    % ee=ee+dd;
    % avg=ee/tot;
    % gg=int32(avg)
     %fds(frame)=ff;

         if(ff>70)
        outputBaseFileName = sprintf('%3.3d.png', frame);
        outputFullFileName = fullfile(outputFolder3, outputBaseFileName);
        imwrite(thisFrame, outputFullFileName, 'png');
        progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
        disp(progressIndication);
        numberOfFramesWritten = numberOfFramesWritten + 1;
          countm=countm+1;
            oldFrame3=thisFrame;
        % imshow(thisFrame)
    end
        
    if((difference2(thisFrame,oldFrame2))>15000)
        outputBaseFileName = sprintf('%3.3d.png', frame);
        outputFullFileName = fullfile(outputFolder2, outputBaseFileName);
        imwrite(thisFrame, outputFullFileName, 'png');
        progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
        disp(progressIndication);
        numberOfFramesWritten = numberOfFramesWritten + 1;
            oldFrame2=thisFrame;
           counte=counte+1;
            %imshow(oldFrame);
    end
    if((difference(thisFrame,oldFrame1))>45000)
        outputBaseFileName = sprintf('%3.3d.png', frame);
        outputFullFileName = fullfile(outputFolder1, outputBaseFileName);
        imwrite(thisFrame, outputFullFileName, 'png');
        progressIndication = sprintf('Wrote frame %4d of %d.', frame,numberOfFrames);
        disp(progressIndication);
        numberOfFramesWritten = numberOfFramesWritten + 1;
        counth=counth+1;   
        oldFrame1=thisFrame;
           % imshow(oldFrame);
    end
    tot=tot+1;
    oldFrame=thisFrame;
 %   'hello'
    
    [counte,counth,countm]
    
    bar([tot,counth,counte,countm])
   xlabel('technique')
      ylabel('number of frames')
    set(gca,'XTickLabel',{'total', 'Histogramic', 'Eucledian', 'Mahalanobis'})
saveas(gcf,'BarChartFile.png')

  %  imshow('BarChartFile.png')
    
      %imshow(thisFrame);
end
  
%progressIndication = sprintf('Wrote %d frames to folder "%s"',numberOfFramesWritten,outputFolder);
disp(progressIndication); bar([counth,counte,countm])

xlabel('technique')
      ylabel('number of frames')
    set(gca,'XTickLabel',{'Histogramic', 'Eucledian', 'Mahalanobis'})

saveas(gcf,'BarChartFile.png')


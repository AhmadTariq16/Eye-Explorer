% computeSIFTOnSCIENLoop
%-----------------------------------------------------------------------------
% EE368 Digital Image Processing
% Android Tutorial #3: Server-Client Communication
% Run a persistent Matlab session on SCIEN computer that waits on incoming 
% image query from phone.

% Make sure folders exist
if ~exist('output', 'dir')
    mkdir('output');
end
if ~exist('upload', 'dir')
    mkdir('upload');
end

while 1
    
    % Wait until image is ready
    imageReadyFile = '../cgi-bin/upload/image_ready';
    if ~exist(imageReadyFile, 'file')
        pause(0.5);
        disp('Waiting for image-is-ready signal');
        continue;
    end
    
    % Read input image file
    fid = fopen(imageReadyFile, 'r');
    imageFile = fscanf(fid, '%s', 1);
    [pathStr, name, ext] = fileparts(imageFile);
    disp(['Processing image: ' imageFile]);
    
    % Remove image-is-ready file
    delete(imageReadyFile);
    
    % Call SIFT keypoint extractor
    if ext(1) ~= '.'
        ext = ['.' ext];
    end
    inputImageFile = ['../cgi-bin/upload/' name ext];
    outputImageFile = ['../cgi-bin/output/processed_' name ext];
    computeSIFT(inputImageFile, outputImageFile);
    
    % Signal that result is ready
    resultReadyFile = '../cgi-bin/output/result_ready';
    fid = fopen(resultReadyFile, 'w');
    fprintf(fid, '1');
    fclose(fid);
    
end % while

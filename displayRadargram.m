function dB = displayRadargram(data)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    % function displayRadargram
    %
    % Description: Given SHARAD data (in power; preferably read in using
    % readSHARADimg, display a radargram in dB relative to the average
    % power level.
    %
    % Input:
    %   data - SHARAD IMG data [3600, N] array
    %
    % Output:
    %   Plot of the data
    %   dB - Data in dB relative to the average power level
    %
    % Usage:
    %   dB = displayRadargram(data)
    %
    % Written by: Matthew R. Perry
    % Last Update: 17 May 2019
    %
    % Please acknowledge any use of CO-SHARPS in publications that contain
    % CO-SHARPS products.
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    delT = 0.0375;
    data = data / mean(mean(data));
    dB = 10 * log10(data);
    [nrows, ncols] = size(data);
    y = (0:1:nrows-1)*delT;
    x = 0:1:ncols-1;
    figure;
    h = imagesc(x,y,dB);
    xlabel('Frame');
    ylabel('Time (\mus)');
    h = colorbar;
    ylabel(h, 'dB (relative to average power)');
end

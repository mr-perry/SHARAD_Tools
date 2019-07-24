function [data, nrows, ncols] = readSHARADmlk(filepath)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    % function readSHARADmlk
    %
    % Description: Given a .mlk file created in CO-SHARPS,
    %   determine the number of rows and columns based off
    %   the fize size and read in the SHARAD data.
    %
    % Input:
    %   filepath - Absolute or relative path the the .mlk file
    %
    % Output:
    %   data - [4096, N] array of SHARAD data
    %   nrows - Number of rows (fixed - 4096 for QDA's)
    %   ncols - Number of columns
    %
    % Usage:
    %   [data, nrows, ncols] = readSHARADmlk(filepath)
    %
    % Written by: Vanshika Gupta
    % Last Update: 24 June 2019
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
    a = fopen(filepath);
    s = dir(filepath);
    nrows = 4096;
    ncols = s.bytes / 4 / nrows;
    data = fread(a, [nrows, ncols], 'float32','ieee-le');
    imagesc(data);
    
end

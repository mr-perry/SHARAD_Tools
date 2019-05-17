function [data, nrows, ncols] = readSHARADimg(filepath)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    % function readSHARADimg
    %
    % Description: Given a .IMG file created in CO-SHARPS,
    %   determine the number of rows and columns based off
    %   the fize size and read in the SHARAD data.
    %   The .IMG files are created in IDL so the columns and
    %   rows are flipped, transposing the final results fixes
    %   this issue.
    %
    % Input:
    %   filepath - Absolute or relative path the the .IMG file
    %
    % Output:
    %   data - [3600, N] array of SHARAD data (in power)
    %   nrows - Number of rows (always 3600 for FPBs)
    %   ncols - Number of columns
    %
    % Usage:
    %   [data, nrows, ncols] = readSHARADimg(filepath)
    %
    % Written by: Matthew R. Perry
    % Last Update: 17 May 2019
    %
    % Please acknowledge any use of CO-SHARPS in publications that contain
    % CO-SHARPS products.
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a = fopen(filepath);
    s = dir(filepath);
    nrows = 3600;
    ncols = s.bytes / 4 / nrows;
    data = fread(a, [ncols, nrows], 'float32','ieee-le');
    data = data';
end
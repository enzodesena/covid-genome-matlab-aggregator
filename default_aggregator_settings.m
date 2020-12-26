% AGGREGATOR_SETTINGS = DEFAULT_SETTINGS()
%   This function returns the default settings for the
%   covid-genome-matlab-parser.
% 
%   Author: Enzo De Sena (enzodesena AT gmail DOT com)
%   Date: 8/4/2020
%   License: MIT

function aggregator_settings = default_aggregator_settings()
aggregator_settings = struct;

aggregator_settings.directories = {'gisaid-data/mat-files/', 'covid-genome-matlab-parser/mat-files/', 'cog-uk-data/mat-files/'}; % 

% If set as true, this will ignore sequences that are not complete.
aggregator_settings.ignore_sequence_if_incomplete = true;

% Only consider the fist accession in a period of time given by the
% following value. 
aggregator_settings.only_use_one_accession_per_number_of_days = 1;

% Output directory
aggregator_settings.output_directory = 'mat-files/';
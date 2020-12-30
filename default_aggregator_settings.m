% AGGREGATOR_SETTINGS = DEFAULT_SETTINGS()
%   This function returns the default settings for the
%   covid-genome-matlab-parser.
% 
%   Author: Enzo De Sena (enzodesena AT gmail DOT com)
%   Date: 8/4/2020
%   License: MIT

function aggregator_settings = default_aggregator_settings()
aggregator_settings = struct;

aggregator_settings.directories = {'gisaid-data/mat-files/', 'covid-genome-matlab-parser/mat-files/'}; % 'cog-uk-data/mat-files/'}; % 
aggregator_settings.include_only_these_accessions = {'MT019529'
'LR757998'
'MT291830'
'MT019533'
'MN988669'
'MT034054'
'LR757995'
'MT447155'
'MT259226'
'MN975262'
'MT072688'
'MW011762'
'MT246667'
'MT226610'
'MT253710'
'MT644268'
'MT447166'
'MT291831'
'MT447158'
'MT534630'
'MT745748'
'MT365030'
'MT270106'
'MT365031'
'MT755883'
'MT447162'
'MT106054'
'LC534418'
'MT844024'
'MT969352'
'MW023501'
'MW030278'
'MT890235'
'MW020075'
'MW012273'
'MT956745'
'EPI_ISL_616695'
'EPI_ISL_616402'
'EPI_ISL_615661'
'EPI_ISL_641479'
'EPI_ISL_641492'
'EPI_ISL_601443'
'EPI_ISL_606424'
'EPI_ISL_665642'
'EPI_ISL_668598'
'EPI_ISL_676373'
'EPI_ISL_668267'
'EPI_ISL_679240'
'EPI_ISL_678386'
'EPI_ISL_728566'
'EPI_ISL_733573'
'EPI_ISL_735386'
'EPI_ISL_735511'
'EPI_ISL_736784'
'EPI_ISL_700563'
'EPI_ISL_660629'
'EPI_ISL_678597'
'EPI_ISL_718682'
'EPI_ISL_615661'
'EPI_ISL_615661'
'EPI_ISL_615661'
'EPI_ISL_601443'
'EPI_ISL_601443'
'EPI_ISL_601443'
'EPI_ISL_700563'
'EPI_ISL_700563'
'EPI_ISL_700563'};

% If set as true, this will ignore sequences that are not complete.
aggregator_settings.ignore_sequence_if_incomplete = true;

% Only consider the fist accession in a period of time given by the
% following value. 
aggregator_settings.only_use_one_accession_per_number_of_days = nan;

% Output directory
aggregator_settings.output_directory = 'mat-files/';

aggregator_settings.order_chronologically = false;
% DATASETS = STEP_3_BUNDLE_DATASETS()
%   This script reads the dataset folders and returns a struct array 
%   containing all the datasets. The datasets are returned in chronological 
%   order according to the collection data.
%
%   STEP_3_BUNDLE_DATASETS(PARSER_SETTINGS)
%   This runs the same script but using your own settings 
%   (see default_settings.m for info).
%
% Author: Enzo De Sena (enzodesena AT gmail DOT com)
% Date: 17/4/2020
% License: MIT

function [pruned_datasets, pruned_collection_dates] = step_2_bundle_datasets(aggregator_settings)


%% Load settings
if nargin < 1
    aggregator_settings = default_aggregator_settings();
end

collection_dates = [];
datasets = [];


%% Run query to google maps API for each directory
N = length(aggregator_settings.directories);
for n=1:N
    [datasets_in_directory, collection_dates_in_directory] = bundle_dataset_in_directory(aggregator_settings.directories{n}, aggregator_settings);
    collection_dates = [collection_dates, collection_dates_in_directory];
    datasets = [datasets, datasets_in_directory];
end


%% Sort according to collection date
[~, sorting_indices] = sort(collection_dates);
datasets = datasets(sorting_indices);

pruned_datasets = [];
pruned_collection_dates = [];

latest_accession_date = 0;
for n=1:length(datasets)
    assert(~isempty(datasets(n).accession));
    % Prune based on date
    if ~isempty(aggregator_settings.only_use_one_accession_per_number_of_days) && ...
            datenum(datasets(n).collection_date) < datenum(latest_accession_date) + aggregator_settings.only_use_one_accession_per_number_of_days
        disp(strcat('Accession n.',datasets(n).accession, ' has a date (',datestr(datasets(n).collection_date),...
            ') which is less than only_use_one_accession_per_number_of_days (',num2str(aggregator_settings.only_use_one_accession_per_number_of_days),...
            ') from the latest accession date (',datestr(latest_accession_date),'): pruned.'));
        continue;
    end
    latest_accession_date = datasets(n).collection_date;
    
    pruned_datasets = [pruned_datasets; datasets(n)];
    pruned_collection_dates = [pruned_collection_dates; datasets(n).collection_date];
end

save (strcat(aggregator_settings.output_directory, 'datasets.mat'), 'pruned_datasets');


function [datasets, collection_dates] = bundle_dataset_in_directory(directory_name, settings)


%% Load datasets
dataset_folder_contents = dir(directory_name);
num_files = length(dataset_folder_contents);

for n=1:num_files
    filename = dataset_folder_contents(n).name;
    
    % Exclude current directory and yaml file in directory
    if startsWith(filename, '.') || endsWith(filename, '.yaml') || endsWith(filename, '.txt')
       continue; 
    end
    
    filepath = strcat(directory_name, filename);
    dataset = load(filepath);
    
    if length(dataset.collection_date) > 1 || ...
       dataset.collection_date < datetime('01-Jan-2001')
        disp(strcat('Dataset with accession n.',dataset.accession, ...
            ' was ignored because collection date is incomplete.'));
        continue;
    end
    
    assert(isfield(dataset, 'collection_date'));
    
    
    if ~isfield(dataset, 'lineage') 
        dataset.lineage = '';
    end
    
    if isfield(dataset, 'to_be_ignored') 
        if dataset.to_be_ignored
            disp(strcat('Dataset with accession n.',dataset.accession, ' was ignored.'));
            continue;
        else
            dataset = rmfield(dataset, 'to_be_ignored');
        end
    end
    
    disp(strcat('Dataset with accession n.',dataset.accession, ...
            ' was included.'));
    
    collection_dates(num_files-n+1) = dataset.collection_date;
    datasets(num_files-n+1) = dataset;
end

datasets = datasets(~isnat(collection_dates));
collection_dates = collection_dates(~isnat(collection_dates));



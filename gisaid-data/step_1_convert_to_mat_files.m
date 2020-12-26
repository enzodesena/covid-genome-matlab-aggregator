function step_1_convert_to_mat_files

%% Load data
% data = fastaread('output/cog_all.fasta');
% metadata = readtable('output/cog_metadata.csv', 'HeaderLines', 1);

% gisaid_hcov-19_2020_12_25_21_Cluster-5.fasta
% gisaid_hcov-19_2020_12_25_23_5012V2_1.fasta
% gisaid_hcov-19_2020_12_25_23_5012V2_2.fasta
% gisaid_hcov-19_2020_12_25_23_5012V2_3.fasta
% gisaid_hcov-19_2020_12_25_23_5012V2_4.fasta

dataset_directory = 'data/';
convert_fasta_to_mat(strcat(dataset_directory, 'gisaid_hcov-19_2020_12_25_21_Cluster-5.fasta'), 'Cluster-5');
convert_fasta_to_mat(strcat(dataset_directory, 'gisaid_hcov-19_2020_12_26_10_501V2.fasta'), '501.V2');


%% 

function convert_fasta_to_mat(fasta_filename, lineage)
data = fastaread(fasta_filename);

%% Write data out
[N, ~] = size(data);

for n=1:N
    header = data(n).Header;
    
    header_parts = split(header, '|');
    accession = header_parts(2);
    accession = accession{1};
    accession_parts = split(header_parts(1), '/');
    locality = accession_parts(2);
    locality = locality{1};
    
    if strcmp(locality, 'mink')
        locality = accession_parts(3);
        locality = locality{1};
        lineage = strcat('Cluster-5 (mink host)');
    end
    
	collection_date = header_parts(3);
    collection_date = datetime(collection_date{1});
	sequence = data(n).Sequence;

	filename = strcat('mat-files/', strrep(strcat(accession, '.mat'), '/','-'));
    if ~isfile(filename)
        save(filename, 'accession', 'collection_date', 'locality', 'sequence', 'lineage');
        disp(strcat('Saved accession:', filename));
    else
        disp(strcat('Ignored accession:', filename, ', because it already exists'));
    end
end

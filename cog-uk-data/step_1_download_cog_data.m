function step_1_download_cog_data()

%% Download data
disp('Downloading COVID-19 data from COG UK website');
websave('dataset/cog_all.fasta', 'https://cog-uk.s3.climb.ac.uk/phylogenetics/latest/cog_all.fasta');
disp('Download completed!');

disp('Downloading COVID-19 metadata from COG UK website');
websave('dataset/cog_metadata.csv', 'https://cog-uk.s3.climb.ac.uk/phylogenetics/latest/cog_metadata.csv');
disp('Download completed!');
    



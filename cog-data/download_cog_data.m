function download_cog_data()

%% Download data
disp('Downloading COVID-19 data from COG UK website');
websave('output/cog_data.csv', 'https://cog-uk.s3.climb.ac.uk/phylogenetics/latest/cog_all.fasta');
disp('Download completed!');

disp('Downloading COVID-19 metadata from COG UK website');
websave('output/cog_metadata.csv', 'https://cog-uk.s3.climb.ac.uk/phylogenetics/latest/cog_metadata.csv');
disp('Download completed!');
    
%% Load data
data_only = fastaread('data/cog_all.fasta');
data = readtable('data/cog_metadata.csv', 'HeaderLines', 1);

%% Bundle data
data.Properties.VariableNames{'Var1'} = 'header';
data.Properties.VariableNames{'Var2'} = 'country';
data.Properties.VariableNames{'Var3'} = 'adm1';
data.Properties.VariableNames{'Var4'} = 'sample_date';	
data.Properties.VariableNames{'Var5'} = 'epi_week';
data.Properties.VariableNames{'Var6'} = 'lineage';	
data.Properties.VariableNames{'Var7'} = 'lineage_support';	
data.Properties.VariableNames{'Var8'} = 'd614g';	
data.Properties.VariableNames{'Var9'} = 'n439k';	
data.Properties.VariableNames{'Var10'} = 'p323l';	
data.Properties.VariableNames{'Var11'} = 'a222v';	
data.Properties.VariableNames{'Var12'} = 'y453f';	
data.Properties.VariableNames{'Var13'} = 'n501y';	
data.Properties.VariableNames{'Var14'} = 't1001i';	
data.Properties.VariableNames{'Var15'} = 'p681h';	
data.Properties.VariableNames{'Var16'} = 'q27stop';	
data.Properties.VariableNames{'Var17'} = 'del_21765_6';

[N, ~] = size(data);
sequences = strings(N, 1);

for n=1:N
    sequences(n) = data_only(n).Sequence;
    assert(strcmp(data.header{n}, data_only(n).Header));
end

clear data_only

sequences = table(sequences);
data = [data, sequences];

%% Save data
save('dataset/cog_data.mat', 'data', '-v7.3'); 


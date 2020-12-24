function step_2_convert_to_mat_files

%% Load data
sequences = fastaread('output/cog_all.fasta');
metadata = readtable('output/cog_metadata.csv', 'HeaderLines', 1);

%% Fix table headers
metadata.Properties.VariableNames{'Var1'} = 'header';
metadata.Properties.VariableNames{'Var2'} = 'country';
metadata.Properties.VariableNames{'Var3'} = 'adm1';
metadata.Properties.VariableNames{'Var4'} = 'sample_date';	
metadata.Properties.VariableNames{'Var5'} = 'epi_week';
metadata.Properties.VariableNames{'Var6'} = 'lineage';	
metadata.Properties.VariableNames{'Var7'} = 'lineage_support';	
metadata.Properties.VariableNames{'Var8'} = 'd614g';	
metadata.Properties.VariableNames{'Var9'} = 'n439k';	
metadata.Properties.VariableNames{'Var10'} = 'p323l';	
metadata.Properties.VariableNames{'Var11'} = 'a222v';	
metadata.Properties.VariableNames{'Var12'} = 'y453f';	
metadata.Properties.VariableNames{'Var13'} = 'n501y';	
metadata.Properties.VariableNames{'Var14'} = 't1001i';	
metadata.Properties.VariableNames{'Var15'} = 'p681h';	
metadata.Properties.VariableNames{'Var16'} = 'q27stop';	
metadata.Properties.VariableNames{'Var17'} = 'del_21765_6';

%% Write data out
[N, ~] = size(metadata);

for n=1:N
    assert(strcmp(metadata.header{n}, sequences(n).Header));

    accession = metadata.header{n};
    
    accession_parts = split(metadata.header{n}, '/');
    locality = strcat(metadata.country{n},', ', accession_parts(1));
    locality = locality{1};
    
    collection_date = metadata.sample_date(n);
    sequence = sequences(n).Sequence;
    lineage = metadata.lineage{n};
    
    filename = strcat('dataset/', strrep(strcat(accession, '.mat'), '/','-'));
    if ~isfile(filename)
        save(filename, 'accession', 'collection_date', 'locality', 'sequence', 'lineage');
        disp(strcat('Saved accession:', filename));
    else
        disp(strcat('Ignored accession:', filename, ', because it already exists'));
    end
end

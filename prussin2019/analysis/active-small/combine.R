library(tidyverse)


original_metadata <- read_csv('/Users/harmonbhasin/Work/securebio/dataset_analysis/prussin2019/extra_processing/sample-metadata.csv')
new_metadata <- read_tsv('/Users/harmonbhasin/Work/securebio/dataset_analysis/prussin2019/extra_processing/metadata.tsv', col_name=c('library','na_type','date','sample_alias','season'))

both <- left_join(original_metadata, new_metadata)
both

write_csv(both, '/Users/harmonbhasin/Work/securebio/dataset_analysis/prussin2019/new_harmon-sample-metadata.csv')




updated_library <- both %>% select(library, sample_alias)
library(tidyverse)


original_metadata <- read_csv('/Users/harmonbhasin/work/securebio/nao-harmon/prussin2019/analysis/sample-metadata.csv')
new_metadata <- read_tsv('/Users/harmonbhasin/work/securebio/nao-harmon/prussin2019/analysis/extra_processing/metadata.tsv', col_name=c('library','na_type','date','sample_alias','season'))

both <- left_join(original_metadata, new_metadata)
both

write_csv(both, '/Users/harmonbhasin/work/securebio/nao-harmon/prussin2019/analysis/harmon-sample-metadata.csv')




updated_library <- both %>% select(library, sample_alias)

library(tidyverse)

# From european bank
bruh <- read_tsv('~/Downloads/read_experiment_study_links.txt')

asymp <- bruh %>% filter(str_detect(description, "NextSeq 500 sequencing: DNA Sequencing of Human Plasma: Asymptomatic Subject"))
asymp


# NCBI
us_bruh <- read_csv('~/Downloads/SraRunTable.txt') %>%
  rename('run_accession'='Run')


power_rangers_unite <- left_join(asymp, us_bruh) %>%
  select(run_accession, everything())

write_csv(power_rangers_unite, '/Users/harmonbhasin/work/securebio/nao-harmon/blauwkamp2019/preprocessing/sraruntable.csv')

remove_non_unique_columns <- function(tbl) {
  tbl %>%
    select(where(~n_distinct(.) > 1))
}
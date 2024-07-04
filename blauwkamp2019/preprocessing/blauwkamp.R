library(tidyverse)

bruh <- read_tsv('~/Downloads/read_experiment_study_links.txt')

bruh %>% filter(str_detect(description, "NextSeq 500 sequencing: DNA Sequencing of Human Plasma: Asymptomatic Subject"))

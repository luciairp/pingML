# Magellanic penguin density estimates in Observatorio and Goffré Islands

rm(list=ls())

# loading density estimates function 
source("http://math.hws.edu/pcqm/pcqm.txt")
library(ggplot2)

# ad hoc STRATIFIED DATA ####

# loading data

# Martillo 2021
# no parametricos
martillo_2021_alta_np <- read.csv("data_martillo_2021_alta_np.csv",header=T,sep=";",dec=".")
martillo_2021_baja_np <- read.csv("data_martillo_2021_baja_np.csv",header=T,sep=";",dec=".")
martillo_2021_media_np <- read.csv("data_martillo_2021_media_np.csv",header=T,sep=";",dec=".")

martillo_2021_total_np <- read.csv("data_martillo_2021_total_np.csv",header=T,sep=";",dec=".")


# Density estimates

dens_alta_np <- np.density.est(martillo_2021_alta_np)
dens_alta_np

dens_baja_np <- np.density.est(martillo_2021_baja_np)
dens_baja_np

dens_media_np <- np.density.est(martillo_2021_media_np)
dens_media_np

dens_total_np <- np.density.est(martillo_2021_total_np)
dens_total_np
#
# data for density plot

df <- data.frame(method= c("Plot count", "Plot count", "Plot count", "Plot count",
                           "Quarter", "Quarter", "Quarter", "Quarter"),
                 stratum= c("Low", "Medium", "High", "Unstratified"),
                 density= c(64.3, 216.7, 287.5, 142.9, 33.2, 234.0, 269.6, 167.6),
                 lci= c(46.3, 154.3, 201.5, 113.4, 14.8, 87.1, 55.3, 94.8),
                 hci= c(89.2, 304.4, 410.3, 180.1, 51.6, 360.8, 483.9, 240.4))

# Density plot
ggplot(df, aes(x=stratum, y=density, fill=method)) + 
  geom_bar(stat="identity", color="black", 
           position=position_dodge()) +
  scale_x_discrete(limits = c('Low', 'Medium', 'High', 'Unstratified')) +
  geom_errorbar(aes(ymin=lci, ymax=hci), width=.4,
                position=position_dodge(.9)) +
  labs(title="Magellanic penguin density method comparison (Ad hoc stratification)", 
       subtitle = "Martillo Island, n=92",
       x="Stratum", y = "Density (nests/ha)")+
  theme_classic() +
  scale_fill_manual(values=c('#999999','#E69F00'))

# ABUDANCE WITH AD HOC STRATIFICATION ####

# Scaling up into abundance

# areas (ha)
low_area <-  12.56
medium_area <-  9.43
high_area <- 2.01
total_area <- (low_area + medium_area + high_area)


# PQC method abundance

# unstratified
pch_total_mean <- 167.6 * total_area
pch_total_lci <- 94.8 * total_area
pch_total_hci <- 240.4 * total_area

plot_total_mean <- 142.9 * total_area
plot_total_lci <- 113.4 * total_area
plot_total_hci <- 180.1 * total_area

# stratified
# mean
pch_low_mean <- 33.2 * low_area
pch_medium_mean <- 224 * medium_area
pch_high_mean <- 269.6 * high_area

# confidende intervals
# quarters
pch_low_lci <- 14.8 * low_area
pch_medium_lci <- 87.1 * medium_area
pch_high_lci <- 55.3 * high_area

pch_low_hci <- 51.6 * low_area
pch_medium_hci <- 360.8 * medium_area
pch_high_hci <- 483.9 * high_area

pch_mean_abundance <- (pch_low_mean + pch_medium_mean + pch_high_mean)
pch_sd <- sqrt((pch_low_mean - pch_low_hci)^2 + (pch_medium_mean - pch_medium_hci)^2 + (pch_high_mean - pch_high_hci)^2)
pch_abundance_lci <- pch_mean_abundance - pch_sd
pch_abundance_hci <- pch_mean_abundance + pch_sd

#plot count
plot_low_mean <- 64.3 * low_area
plot_medium_mean <- 216.7 * medium_area
plot_high_mean <- 287.5 * high_area

plot_low_lci <- 46.3 * low_area
plot_medium_lci <- 154.3 * medium_area
plot_high_lci <- 201.5 * high_area

plot_low_hci <- 89.2 * low_area
plot_medium_hci <- 304.4 * medium_area
plot_high_hci <- 410.3 * high_area

plot_mean_abundance <- (plot_low_mean + plot_medium_mean + plot_high_mean)
plot_sd <- sqrt((plot_low_mean - plot_low_lci)^2 + (plot_medium_mean - plot_medium_lci)^2 + (plot_high_mean - plot_high_lci)^2)
plot_abundance_lci <- plot_mean_abundance - plot_sd
plot_abundance_hci <- plot_mean_abundance + plot_sd


# Abundance plot
df2 <- data.frame(method= c("Plot count", "Quarter"),
                  abundance= c("Unstratified", "Unstratified", "Stratified Ad hoc", "Stratified Ad hoc"),
                  nests= c(plot_total_mean, pch_total_mean, plot_mean_abundance, pch_mean_abundance),
                  lci= c(plot_total_lci, pch_total_lci, plot_abundance_lci, pch_abundance_lci),
                  hci= c(plot_total_hci, pch_total_hci, plot_abundance_hci, pch_abundance_hci))


ggplot(df2, aes(x=abundance, y=nests, fill=method)) + 
  geom_bar(stat="identity", color="black", 
           position=position_dodge()) +
  geom_errorbar(aes(ymin=lci, ymax=hci), width=.4,
                position=position_dodge(.9)) +
  labs(title="Magellanic penguin abundance comparison", 
       subtitle = "Martillo Island, n=92",
       x="Estimation", y = "Abundance (nests)")+
  theme_classic() +
  scale_fill_manual(values=c('#999999','#E69F00'))

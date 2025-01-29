#Some scripts for handling the output from ATLAS task=theta.
#assumes windowed theta, will probably have to modify if genome-wide theta is calculated
#First, download the output files (*theta.txt.gz) to your personal computer .

#load required package (tidyverse)

library(tidyverse)

#specify path to your output files (replace the string in quotes with the name/location of your folder)

outfiles="unogerres_beds"

#get list of filenames

files <- list.files(path=outfiles, pattern="*.txt", full.names=TRUE, recursive=FALSE)

#create a dataframe to hold your data

theta_data<-data.frame(matrix(ncol=10,nrow=length(files)))
names(theta_data)=c("file","Era","recal","avg_theta","avg_A","avg_C","avg_T","avg_G","avg_depth","avg_missing")

#populate dataframe with data
#note you may need to change the first argument to grepl() based on the site/naming conventions for your data
# you can potentially repeat this loop command if you have data in multiple folders

for(fnum in 1:length(files)) {
  t <- read.table(gzfile(files[fnum]), header=TRUE) # load file
  # apply function
  theta_data$file[fnum]<-files[fnum]
  theta_data$Era[fnum]<-ifelse(grepl("APnd",files[fnum]),"Albatross - ATLAS GERP recalibration","Contemporary - ATLAS GERP recalibration")
  theta_data$recal[fnum]<-"Recalibrated/SSL"
  theta_data$avg_theta[fnum]=mean(t$p1.0_thetaMLE)
  theta_data$avg_A[fnum]=mean(t$p1.0_piA)
  theta_data$avg_C[fnum]=mean(t$p1.0_piC)
  theta_data$avg_T[fnum]=mean(t$p1.0_piT)
  theta_data$avg_G[fnum]=mean(t$p1.0_piG)
  theta_data$avg_depth[fnum]=mean(t$p1.0_depth)
  theta_data$avg_missing[fnum]=mean(t$p1.0_fracMissing)
}

# boxplot of theta

theta_data %>% 
  ggplot(aes(x=recal, y=avg_theta, fill=Era)) +
  labs(x="Recalibration",y="Theta") +
  theme_bw() +
  geom_boxplot() 

#boxplot of depth

theta_data %>% 
  ggplot(aes(x=recal, y=avg_depth, fill=Era)) +
  labs(x="Recalibration",y="Depth") +
  theme_bw() +
  scale_y_continuous(trans='log10') +
  geom_boxplot() 

#theta vs depth

theta_data %>% 
  ggplot(aes(x=avg_depth, y=avg_theta, color=Era)) +
  labs(x="Average Depth",y="Theta") +
  ggtitle("Read Number Variation") +
  theme_bw() +
  scale_x_continuous(trans='log10') +
  geom_point() +
  geom_smooth()



## for plotting downsampled theta
# again, specify folder containing data and read data

outfiles="unogerres_beds"

files <- list.files(path="unogerres_beds", pattern="*.txt", full.names=TRUE, recursive=FALSE)

theta_data<-data.frame(matrix(ncol=16,nrow=length(files)))

names(theta_data)=c("ind","Era","d1_theta","d05_theta","d02_theta","d01_theta","d005_theta","d002_theta","d001_theta","d1_depth","d05_depth","d02_depth","d01_depth","d005_depth","d002_depth","d001_depth")

for(fnum in 1:length(files)) {
  t <- read.table(gzfile(files[fnum]), header=TRUE) # load file
  # apply function
  theta_data$ind[fnum]<-str_match(files[fnum], "Goy\\s*(.*?)\\s*_theta")[,2]
  theta_data$Era[fnum]<-ifelse(grepl("APnd",files[fnum]),"Albatross - ATLAS recalibration","Contemporary - no recalibration")
  theta_data$d1_theta[fnum]=mean(t$p1.0_thetaMLE)
  theta_data$d05_theta[fnum]=mean(t$p0.5_thetaMLE)
  theta_data$d02_theta[fnum]=mean(t$p0.2_thetaMLE)
  theta_data$d01_theta[fnum]=mean(t$p0.1_thetaMLE)
  theta_data$d005_theta[fnum]=mean(t$p0.05_thetaMLE)
  theta_data$d002_theta[fnum]=mean(t$p0.02_thetaMLE)
  theta_data$d001_theta[fnum]=mean(t$p0.01_thetaMLE)
  theta_data$d1_depth[fnum]=mean(t$p1.0_depth)
  theta_data$d05_depth[fnum]=mean(t$p0.5_depth)
  theta_data$d02_depth[fnum]=mean(t$p0.2_depth)
  theta_data$d01_depth[fnum]=mean(t$p0.1_depth)
  theta_data$d005_depth[fnum]=mean(t$p0.05_depth)
  theta_data$d002_depth[fnum]=mean(t$p0.02_depth)
  theta_data$d001_depth[fnum]=mean(t$p0.01_depth)
}

# filter to samples with depth higher than a certain value (using 3 here but may have to decrease this for other species) and pivot/group by individual

theta_data %>% 
  filter(d1_depth > 3) %>% 
  pivot_longer(-c(ind, Era),
               names_to = c("Category",".value"), 
               names_sep = "_") %>%
  group_by(ind) -> theta_downsamp_data

# plot individual downsampling curves

ggplot(theta_downsamp_data,aes(x=depth, y=theta, color=Era)) +
  labs(x="Average Depth",y="Theta") +
  ggtitle("Downsampling") +
  theme_bw() +
  scale_x_continuous(trans='log10') +
  geom_point(position=position_dodge(width=0.1)) +
  geom_line(aes(group=ind),position=position_dodge(width=0.1))

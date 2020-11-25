# Rita Beigaite 17.11.2020 - RStudio exercise #4 for the IODS course
# Updated on 25.11.2020 - for RStudio exercise #5
# Meta data sources:
# http://hdr.undp.org/en/content/human-development-index-hdi
# http://hdr.undp.org/sites/default/files/hdr2015_technical_notes.pdf
#--------------------------------------------------------------------



#PART 1
#####################################################################
#####################################################################

# Reading Human development data
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv",
               stringsAsFactors = F)

# Reading Gender inequality data
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv",
                stringsAsFactors = F, na.strings = "..")

####################################################################################################################
# Structure and dimentions of hd data set
str(hd)
#'data.frame':	195 obs. of  8 variables:
#  $ HDI.Rank                              : int  1 2 3 4 5 6 6 8 9 9 ...
#$ Country                               : chr  "Norway" "Australia" "Switzerland" "Denmark" ...
#$ Human.Development.Index..HDI.         : num  0.944 0.935 0.93 0.923 0.922 0.916 0.916 0.915 0.913 0.913 ...
#$ Life.Expectancy.at.Birth              : num  81.6 82.4 83 80.2 81.6 80.9 80.9 79.1 82 81.8 ...
#$ Expected.Years.of.Education           : num  17.5 20.2 15.8 18.7 17.9 16.5 18.6 16.5 15.9 19.2 ...
#$ Mean.Years.of.Education               : num  12.6 13 12.8 12.7 11.9 13.1 12.2 12.9 13 12.5 ...
#$ Gross.National.Income..GNI..per.Capita: chr  "64,992" "42,261" "56,431" "44,025" ...
#$ GNI.per.Capita.Rank.Minus.HDI.Rank    : int  5 17 6 11 9 11 16 3 11 23 ...

dim(hd)
#[1] 195   8

# Summary of hd variables
summary(hd)

#HDI.Rank        Country          Human.Development.Index..HDI. Life.Expectancy.at.Birth Expected.Years.of.Education
#Min.   :  1.00   Length:195         Min.   :0.3480                Min.   :49.00            Min.   : 4.10              
#1st Qu.: 47.75   Class :character   1st Qu.:0.5770                1st Qu.:65.75            1st Qu.:11.10              
#Median : 94.00   Mode  :character   Median :0.7210                Median :73.10            Median :13.10              
#Mean   : 94.31                      Mean   :0.6918                Mean   :71.07            Mean   :12.86              
#3rd Qu.:141.25                      3rd Qu.:0.8000                3rd Qu.:76.80            3rd Qu.:14.90              
#Max.   :188.00                      Max.   :0.9440                Max.   :84.00            Max.   :20.20              
#NA's   :7                                                                                                             
# Mean.Years.of.Education Gross.National.Income..GNI..per.Capita GNI.per.Capita.Rank.Minus.HDI.Rank
# Min.   : 1.400          Length:195                             Min.   :-84.0000                  
# 1st Qu.: 5.550          Class :character                       1st Qu.: -9.0000                  
# Median : 8.400          Mode  :character                       Median :  1.5000                  
# Mean   : 8.079                                                 Mean   :  0.1862                  
# 3rd Qu.:10.600                                                 3rd Qu.: 11.0000                  
# Max.   :13.100                                                 Max.   : 47.0000                  
#                                                                NA's   :7 

# Structure and dimentions of gii dataset

str(gii)

#'data.frame':	195 obs. of  10 variables:
#  $ GII.Rank                                    : int  1 2 3 4 5 6 6 8 9 9 ...
#$ Country                                     : chr  "Norway" "Australia" "Switzerland" "Denmark" ...
#$ Gender.Inequality.Index..GII.               : num  0.067 0.11 0.028 0.048 0.062 0.041 0.113 0.28 0.129 0.157 ...
#$ Maternal.Mortality.Ratio                    : int  4 6 6 5 6 7 9 28 11 8 ...
#$ Adolescent.Birth.Rate                       : num  7.8 12.1 1.9 5.1 6.2 3.8 8.2 31 14.5 25.3 ...
#$ Percent.Representation.in.Parliament        : num  39.6 30.5 28.5 38 36.9 36.9 19.9 19.4 28.2 31.4 ...
#$ Population.with.Secondary.Education..Female.: num  97.4 94.3 95 95.5 87.7 96.3 80.5 95.1 100 95 ...
#$ Population.with.Secondary.Education..Male.  : num  96.7 94.6 96.6 96.6 90.5 97 78.6 94.8 100 95.3 ...
#$ Labour.Force.Participation.Rate..Female.    : num  61.2 58.8 61.8 58.7 58.5 53.6 53.1 56.3 61.6 62 ...
#$ Labour.Force.Participation.Rate..Male.      : num  68.7 71.8 74.9 66.4 70.6 66.4 68.1 68.9 71 73.8 ...

dim(gii)

#[1] 195  10

# Summary of gii variables

summary(gii)


#GII.Rank        Country          Gender.Inequality.Index..GII. Maternal.Mortality.Ratio Adolescent.Birth.Rate
#Min.   :  1.00   Length:195         Min.   :0.0160                Min.   :   1.0           Min.   :  0.60       
#1st Qu.: 47.75   Class :character   1st Qu.:0.2030                1st Qu.:  16.0           1st Qu.: 15.45       
#Median : 94.00   Mode  :character   Median :0.3935                Median :  69.0           Median : 40.95       
#Mean   : 94.31                      Mean   :0.3695                Mean   : 163.2           Mean   : 49.55       
#3rd Qu.:141.25                      3rd Qu.:0.5272                3rd Qu.: 230.0           3rd Qu.: 71.78       
#Max.   :188.00                      Max.   :0.7440                Max.   :1100.0           Max.   :204.80       
#NA's   :7                           NA's   :33                    NA's   :10               NA's   :5            
#Percent.Representation.in.Parliament Population.with.Secondary.Education..Female. Population.with.Secondary.Education..Male.
#Min.   : 0.00                        Min.   :  0.9                                Min.   :  3.20                            
#1st Qu.:12.47                        1st Qu.: 27.8                                1st Qu.: 38.30                            
#Median :19.50                        Median : 55.7                                Median : 60.00                            
#Mean   :20.60                        Mean   : 54.8                                Mean   : 60.29                            
#3rd Qu.:27.02                        3rd Qu.: 81.8                                3rd Qu.: 85.80                            
#Max.   :57.50                        Max.   :100.0                                Max.   :100.00                            
#NA's   :3                            NA's   :26                                   NA's   :26                                
# Labour.Force.Participation.Rate..Female. Labour.Force.Participation.Rate..Male.
# Min.   :13.50                            Min.   :44.20                         
# 1st Qu.:44.50                            1st Qu.:68.88                         
# Median :53.30                            Median :75.55                         
# Mean   :52.61                            Mean   :74.74                         
# 3rd Qu.:62.62                            3rd Qu.:80.15                         
# Max.   :88.10                            Max.   :95.50                         
# NA's   :11                               NA's   :11
######################################################################################################################

# Renaming the variables

names(hd)
#[1] "HDI.Rank"                               "Country"                                "Human.Development.Index..HDI."         
#[4] "Life.Expectancy.at.Birth"               "Expected.Years.of.Education"            "Mean.Years.of.Education"               
#[7] "Gross.National.Income..GNI..per.Capita" "GNI.per.Capita.Rank.Minus.HDI.Rank"

names(hd) <- c('hdi_rank', 'country', 'hdi', 'life_exp', 'exp_edu', 'mean_edu', 'gni', 'gni_minus_hdi')


names(gii)
#[1] "GII.Rank"                                     "Country"                                     
#[3] "Gender.Inequality.Index..GII."                "Maternal.Mortality.Ratio"                    
#[5] "Adolescent.Birth.Rate"                        "Percent.Representation.in.Parliament"        
#[7] "Population.with.Secondary.Education..Female." "Population.with.Secondary.Education..Male."  
#[9] "Labour.Force.Participation.Rate..Female."     "Labour.Force.Participation.Rate..Male."

names(gii) <- c('gii_rank','country','gii','mat_mortality', 'adol_birth', 'parl_seats',
                'f_2edu', 'm_2edu', 'f_lab', 'm_lab' )


#######################################################################################################################################

#Mutating the “Gender inequality” data and creating two new variables. 
# - the ratio of Female and Male populations with secondary education in each country  edu2F / edu2M 
# - the ratio of labour force participation   labF / labM


library(dplyr)

gii <- gii %>% mutate( edu_ratio = f_2edu/m_2edu,
               lab_ratio = f_lab/m_lab)

glimpse(gii)

#Rows: 195
#Columns: 12
#$ gii_rank      <int> 1, 2, 3, 4, 5, 6, 6, 8, 9, 9, 11, 12, 13, 14, 14, 16, 17, 18,...
#$ country       <chr> "Norway", "Australia", "Switzerland", "Denmark", "Netherlands...
#$ gii           <dbl> 0.067, 0.110, 0.028, 0.048, 0.062, 0.041, 0.113, 0.280, 0.129...
#$ mat_mortality <int> 4, 6, 6, 5, 6, 7, 9, 28, 11, 8, 6, NA, NA, 4, 8, 4, 27, 2, 11...
#$ adol_birth    <dbl> 7.8, 12.1, 1.9, 5.1, 6.2, 3.8, 8.2, 31.0, 14.5, 25.3, 6.0, 3....
#$ parl_seats    <dbl> 39.6, 30.5, 28.5, 38.0, 36.9, 36.9, 19.9, 19.4, 28.2, 31.4, 2...
#$ f_2edu        <dbl> 97.4, 94.3, 95.0, 95.5, 87.7, 96.3, 80.5, 95.1, 100.0, 95.0, ...
#$ m_2edu        <dbl> 96.7, 94.6, 96.6, 96.6, 90.5, 97.0, 78.6, 94.8, 100.0, 95.3, ...
#$ f_lab         <dbl> 61.2, 58.8, 61.8, 58.7, 58.5, 53.6, 53.1, 56.3, 61.6, 62.0, 5...
#$ m_lab         <dbl> 68.7, 71.8, 74.9, 66.4, 70.6, 66.4, 68.1, 68.9, 71.0, 73.8, 7...
#$ edu_ratio     <dbl> 1.0072389, 0.9968288, 0.9834369, 0.9886128, 0.9690608, 0.9927...
#$ lab_ratio     <dbl> 0.8908297, 0.8189415, 0.8251001, 0.8840361, 0.8286119, 0.8072...


###############################################################################################
# Joining together the two datasets using the variable Country as the identifier. 



human <- inner_join(gii, hd, by = 'country', copy = FALSE)

dim(human)

#[1] 195  19

write.csv(human,file="data/human.csv", row.names = F)


###############################################################################
##############################################################################
# PART 2

# Loading the human data from the course page as my given column names from part 1
# differ from names used in task description

human <- read.table('http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt',
                    sep = ',', header =T)

str(human)

# The data has 195 observations of 19 variables
str(human)

'data.frame':	195 obs. of  19 variables:
#$ HDI.Rank      : int  1 2 3 4 5 6 6 8 9 9 ...
#$ Country       : chr  "Norway" "Australia" "Switzerland" "Denmark" ...
#$ HDI           : num  0.944 0.935 0.93 0.923 0.922 0.916 0.916 0.915 0.913 0.913 ...
#$ Life.Exp      : num  81.6 82.4 83 80.2 81.6 80.9 80.9 79.1 82 81.8 ...
#$ Edu.Exp       : num  17.5 20.2 15.8 18.7 17.9 16.5 18.6 16.5 15.9 19.2 ...
#$ Edu.Mean      : num  12.6 13 12.8 12.7 11.9 13.1 12.2 12.9 13 12.5 ...
#$ GNI           : chr  "64,992" "42,261" "56,431" "44,025" ...
#$ GNI.Minus.Rank: int  5 17 6 11 9 11 16 3 11 23 ...
#$ GII.Rank      : int  1 2 3 4 5 6 6 8 9 9 ...
#$ GII           : num  0.067 0.11 0.028 0.048 0.062 0.041 0.113 0.28 0.129 0.157 ...
#$ Mat.Mor       : int  4 6 6 5 6 7 9 28 11 8 ...
#$ Ado.Birth     : num  7.8 12.1 1.9 5.1 6.2 3.8 8.2 31 14.5 25.3 ...
#$ Parli.F       : num  39.6 30.5 28.5 38 36.9 36.9 19.9 19.4 28.2 31.4 ...
#$ Edu2.F        : num  97.4 94.3 95 95.5 87.7 96.3 80.5 95.1 100 95 ...
#$ Edu2.M        : num  96.7 94.6 96.6 96.6 90.5 97 78.6 94.8 100 95.3 ...
#$ Labo.F        : num  61.2 58.8 61.8 58.7 58.5 53.6 53.1 56.3 61.6 62 ...
#$ Labo.M        : num  68.7 71.8 74.9 66.4 70.6 66.4 68.1 68.9 71 73.8 ...
#$ Edu2.FM       : num  1.007 0.997 0.983 0.989 0.969 ...
#$ Labo.FM       : num  0.891 0.819 0.825 0.884 0.829 ...

#Transforming the Gross National Income (GNI) variable to numeric

# Accessing the stringr package
library(stringr)

# Removing the commas and converting gni variable to numeric 
human <- mutate(
  human, GNI = str_replace(GNI, pattern=",", replace ="") 
  %>% as.numeric)

str(human)

# Keeping only "Country", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F" variables
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human <- dplyr::select(human, one_of(keep))

# Now dimention of the data has changed
dim(human)
#[1] 195   9

# Removing all the rows with NA values
human <- filter(human, complete.cases(human))

dim(human)
#[1] 162   9


# Removing the observations which relate to regions instead of countries
# Looking at the names of the countries we see that last 7 observations are
# regions
human$Country
#................
#[156] "Arab States"                              
#[157] "East Asia and the Pacific"                
#[158] "Europe and Central Asia"                  
#[159] "Latin America and the Caribbean"          
#[160] "South Asia"                               
#[161] "Sub-Saharan Africa"                       
#[162] "World"


# Selecting all observations until [156] which is Arab States
human <- human[1:155, ]
dim(human)
#[1] 155   9

#Defining the row names of the data by the country names and removing the country name column from the data
rownames(human) <- human$Country
human <- dplyr::select(human, -Country)

dim(human)
#[1] 155   8

# Saving the human data in data folder
write.csv(human,file="data/human.csv", row.names = T)

test <- read.table('data/human.csv',sep = ',',header = T, row.names = 1)
glimpse(test)

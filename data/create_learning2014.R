# Rita Beigaite, 03.11.2020. Data wrangling task for exercise 2.

# Reading the full learning2014 data from http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt 

# Reading the data into memory
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# Looking at the structure and dimentions of the data
str(lrn14) 
dim(lrn14)
# Data cosists of 183 observations of 60 variables. All variables extept 'gender' are numeric.



# Create column "attitude" by scaling the column "Attitude"
lrn14$Attitude <- lrn14$Attitude / 10


# Access the dplyr library
library(dplyr)

# Making variables with questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30", "D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# Selecting the columns related to deep learning and creating a column 'deep' by averaging

deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

# Selecting the columns related to surface learning and creating a column 'surf' by averaging
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

# Selecting the columns related to strategic learning and creating a column 'stra' by averaging
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)


# Choosing which columns to keep
keep_col <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")

# Selecting the 'keep_columns' to create a new dataset
lrn2014 <- select(lrn14, one_of(keep_col))

#Changing names of new dataset
names(lrn2014) <- c("gender","age","attitude", "deep", "stra", "surf", "points")

#Excluding observations where the exam points variable is equal to zero
learning2014 <- filter(lrn2014, points > 0)

# Checking if data has 166 observations and 7 variables
dim(learning2014)

# The working directory of R session is the iods project folder
getwd()

# Saving the analysis dataset to the ‘data’ folder
write.csv(learning2014, file = 'data/learning2014.csv', row.names = F)

# Reading the saved data file
l14 <- read.table('data/learning2014.csv', sep =',', header=T)

#Making sure that the structure of the data is correct
str(l14)
head(l14)

# Deliverable 1

#add dplyr library
library(dplyr) 

#read the MechaCar_mpg.csv file
MechaCar_data <- read.csv(file = 'MechaCar_mpg.csv') 

#create linear regression to pass all six variables
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_data) 

#determine the p-value and r-squared for the linear regression
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_data))

# Deliverable 2

#read the Suspension_Coil.csv file
Suspension_Coil <- read.csv(file = 'Suspension_Coil.csv')

#creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil's PSI column.
total_summary <- Suspension_Coil %>% data.frame()%>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),)
lot_summary <- Suspension_Coil %>%group_by(Manufacturing_Lot)%>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

#Deliverable 3

#t-test for PSI across all lots
t.test(Suspension_Coil$PSI,mu=1500)

#t-test for lot 1
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot1")$PSI,mu=1500)

#t-test for lot 2
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot2")$PSI,mu=1500)

#t-test for lot 3
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot3")$PSI,mu=1500)
###############################################################################
## Stephen Maione
## Exploratory Data Analysis
## Course Project 1
## Plot1.R
###############################################################################

path = paste("C://Users/Me/Documents/OnlineEDU/Coursera//DS_Specialization/",
             "Exploratory_Data_Analysis/CP_1/ExData_Plotting1/", sep = "")
setwd(path)

file = "household_power_consumption.txt"

# read the first row to get the vector of column names
data = read.csv(file, sep = ';', nrows = 1)
col_names <- names(data)
                
# read lines 66637 to 69517 for the dates we're interested in
data = read.csv(file, sep = ';', na.strings = '?',
                stringsAsFactors = FALSE,
                skip = 66636, nrows = 69517 - 66637,
                col.names = col_names)

## open png device, and draw the histogram to it
png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power,
     col = 'red',
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()

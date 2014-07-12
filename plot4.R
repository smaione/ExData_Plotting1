###############################################################################
## Stephen Maione
## Exploratory Data Analysis
## Course Project 1
## Plot4.R
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

## Concatenate Date & Time and convert to the POSIXlt class
time_data = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## open png device, and draw the plot to it
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(time_data, data$Global_active_power, type = 'l',
     ylab = "Global Active Power (kilowatts)", xlab = "")

plot(time_data, data$Voltage, type = 'l',
     ylab = "Voltage", xlab = "datetime")

plot(time_data, data$Sub_metering_1, type = 'l',
     ylab = "Energy sub metering", xlab = "")
lines(time_data, data$Sub_metering_2, col = 'red')
lines(time_data, data$Sub_metering_3, col = 'blue')
legend('topright',
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c('black', 'red', 'blue'),
       bty = 'n', lty = c(1, 1, 1), lwd = c(1, 1, 1))

plot(time_data, data$Global_reactive_power, type = 'l',
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()

#Manipulating time series data with Xts and Zoo
#xts is the matrix assoviated with time for each observations xts is a subclass of zoo
#library(xts)
# Load xts
library(xts)

# View the structure of ex_matrix
str(ex_matrix)

# Extract the 3rd observation of the 2nd column of ex_matrix
ex_matrix[3, 2]

# Extract the 3rd observation of the 2nd column of core 
core[3,2]
#xts = matrix + times
# Create the object data using 5 random numbers
data<-rnorm(5)

# Create dates as a Date class object starting from 2016-01-01
dates <- seq(as.Date("2016-01-01"), length = 5, by = "days")

# Use xts() to create smith
smith <- xts(x = data, order.by = dates)

# Create bday (1899-05-08) using a POSIXct date class object
bday <- as.POSIXct("1899-05-08")

# Create hayek and add a new attribute called born
hayek <- xts(x = data, order.by = dates, born = bday)
# Extract the core data of hayek
hayek_core<-coredata(hayek)

# View the class of hayek_core
class(hayek_core)

# Extract the index of hayek
hayek_index<-index(hayek)

# View the class of hayek_index
class(hayek_index)

# Create dates
dates <- as.Date("2016-01-01") + 0:4

# Create ts_a
ts_a <- xts(x = 1:5, order.by = dates)

# Create ts_b
ts_b <- xts(x = 1:5, order.by = as.POSIXct(dates))

# Extract the rows of ts_a using the index of ts_b
ts_a[index(ts_b)]

# Extract the rows of ts_b using the index of ts_a
ts_b[index(ts_a)]

# Convert austres to an xts object called au
au <- as.xts(austres)

# Then convert your xts object (au) into a matrix am
am <- as.matrix(au)

# Inspect the head of am
head(am)

# Convert the original austres into a matrix am2
am2<-as.matrix(austres)

# Inspect the head of am2
head(am2)

# Create dat by reading tmp_file
dat<-read.csv(tmp_file)

# Convert dat into xts
xts(dat, order.by = as.Date(rownames(dat), "%m/%d/%Y"))

# Read tmp_file using read.zoo
dat_zoo <- read.zoo(tmp_file, index.column = 0, sep = ",", format = "%m/%d/%Y")

# Convert dat_zoo to xts
dat_xts <- as.xts(dat_zoo)

# Convert sunspots to xts using as.xts().
sunspots_xts<-as.xts(sunspots)

# Get the temporary file name
tmp <- tempfile()

# Write the xts object using zoo to tmp 
write.zoo(sunspots_xts, sep = ",", file = tmp)

# Read the tmp file. FUN = as.yearmon converts strings such as Jan 1749 into a proper time class
sun <- read.zoo(tmp, sep = ",", FUN = as.yearmon)

# Convert sun into xts. Save this as sun_xts
sun_xts<-as.xts(sun)

# ISO-8601 standard is the internationally recognized and accepted way to represent dates and times. The standard allows for a common format to not only describe dates
# Xts uses a forward slash (/) to denote ranges, so this can't be used as a separator between date columns.
A["20090825"]       ## Aug 25, 2009
A["201203/201212"]  ## Mar to Dec 2012
A["/201601"]        ## Up to and including January 2016
# Select all of 2016 from x
x_2016 <- x["2016"]

# Select January 1, 2016 to March 22, 2016
jan_march <- x["20160101/20160322"]

# Verify that jan_march contains 82 rows
82 == length(jan_march)
# intraday data, which contains both dates and times

# Extract all data from irreg between 8AM and 10AM
morn_2010 <- irreg["T08:00/T10:00"]

# Extract the observations in morn_2010 for January 13th, 2010


morn_2010["20100113"]

# Replace the values in x contained in the dates vector with NA
x[dates] <- NA

# Replace all values in x for dates starting June 9, 2016 with 0
x["2016-06-09/"] <- 0

# Verify that the value in x for June 11, 2016 is now indeed 0
x["2016-06-11"]

# Create lastweek using the last 1 week of temps
lastweek <- last(temps, "1 week")

# Print the last 2 observations in lastweek
last(lastweek, 2)

# Extract all but the first two days of lastweek
first(lastweek, "-2 days")
# Extract the first three days of the second week of temps
first(last(first(temps, '2 weeks'), '1 week'), '3 days')

# Add a and b
a+b

# Add a with the numeric value of b
a+as.numeric(b)
# Add a to b, and fill all missing rows of b with 0
a + merge(b, index(a), fill = 0)

# Add a to b and fill NAs with the last observation
a + merge(b, index(a), fill = na.locf)


library(dplyr)

#
# Note: examples only, no data!
#

mydf <- read.csv(path2csv, stringsAsFactors = FALSE)

dim(mydf)
# [1] 225468     11

# Load into tbl_df.
cran <- tbl_df(mydf)

# Pretty print
cran

# Select columns.
# note that the columns are returned to us in the order we specified, 
# even though ip_id is the rightmost column in the original dataset.
select(cran, ip_id, package, country)

# Use select(cran, r_arch:country) to select all columns starting 
# from r_arch and ending with country.
select(cran, r_arch:country)

# The negative sign in front of time tells select() that we DON'T want the 
# time column.
select(cran, -time)

#Use this knowledge to omit all columns X:size using select().
select(cran, -(X:size))

# select all rows for which the package variable is equal to "swirl".
filter(cran, package == "swirl")

# as many conditions as you want, separated by commas.
filter(cran, r_version == "3.1.1", country == "US")

# gives us all rows for which the country variable equals either "US" or "IN".
filter(cran, country == "US" | country == "IN")

# return all rows of cran for which r_version is NOT NA.
filter(cran, !is.na(r_version))

# order the ROWS of cran2 so that ip_id is in ascending order.
arrange(cran2, ip_id)

# To do the same, but in descending order.
arrange(cran2, desc(ip_id))

# first arrange by package names (ascending alphabetically), then by ip_id.
arrange(cran2, package, ip_id)

# add a column called size_mb that contains the download size in megabytes.
mutate(cran3, size_mb = size / 2^20)

# use the value computed for your second column(size_mb) to create a third column.
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)

# Change type
mutate(year = as.factor(year)) %>%
  
# summarize(), collapses the dataset to a single row.
summarize(cran, avg_bytes = mean(size))

# Group cran by the package variable.
by_package <- group_by(cran, package)

# use summarize() to apply mean(size) to the grouped data in by_package.
summarize(by_package, mean(size))

# This is a faster and more concise equivalent of length(unique(x)).
# n_distinct {dplyr} 

# In statistics, this is called the 0.99, or 99%, sample quantile.
quantile(pack_sum$count, probs = 0.99)

# ------------- Chaining --------------------

cran %>%
  select(ip_id, country, package, size) %>%
  print

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20)

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5)

  
# Filter rows.  
# http://stackoverflow.com/questions/22850026/filtering-row-which-contains-a-certain-string-using-dplyr

# Replace NA.
activity.filled <- activity  %>%
  group_by(interval) %>%
  mutate(steps = replace(steps, is.na(steps), mean(steps, na.rm=TRUE)))

---
title: "README.md"
output: html_document
---
<!---
- should describe how the script works
- In the readMe in explaining what the script does put "and then generates a tidy data text file that meets the principles of ...etc"

--->
# Step 0

I am calling all necessary libraries for my script, setting the directories, and downloading the zip file. The download of the zip file is directly done within the script to enhance reproducibility of the steps for tidying the data. In the course it was indicated that one important part of tidy data is also to make clear where the data comes from. Furthermore, not only where it was downloaded from but also when it was downloaded, is important for reproducibility and the tidyness of data. Therefore, I am implementing the date in the folder name to which the data will be downloaded.

Finally, I am unzipping the data and reading all necessary data for the project into R.
I am reading in the features.txt file with "stringsAsFactors = F" so that the second column will be read in as character and not as factor. This allows me in step 1 to set the column names of my data to the character names in features. 

# Step 1

All test files (subject_test, Y_test, X_test) can be combined by cbind since the number of rows is the same between the test files. Furthermore, from reading the documentation of the data and the ReadMe.txt in the data folder, my interpretation is that the first row in each test file belongs to each other and etc. 
As described in the accompanying ReadMe.txt to the data, subject_test contains the subject IDs, Y_test the activity labels, and X_test the actual measurements.
The same as above applies for the training files.

Finally, all data can be combined by rbind since the rows in the training and test data represent different observations from different subjects.

As a preparation for step 2, I am applying the variable names from features.txt to the data.

# Step 2

I am finding the column numbers of all column names with mean() and std() from the overall column names. I am only selecting columns with mean() and not meanFreq() since these columns with meanFreq() did not represent the mean but the weighted average of the frequency components to obtain a mean frequency.

I am using the following command to combine the column IDs for mean() and std(): as.vector(rbind(meanColumns,stdColumns)).
Let's say we have a vector a <- c(1,2,3) and a vector b <- c(4,5,6). When using as.vector and rbind in the way as in the script, it will result in the following:

a <- c(1,2,3)

b <- c(4,5,6)

as.vector(rbind(a,b))

[1] 1 4 2 5 3 6

Thus, my final dataset from step 2 will have in one column the mean of a measurement, let us say of tBodyAcc-X, and in the next column the standard deviation of this measurement, e.g., tBodyAcc-X. I prefer this ordering of the columns instead of an order where first I have all the means and then I have all the standard deviations.

# Step 3
I am creating a vector ActivityNamesData which instead of the activity numbers contains the corresponding activities in name for my data at hand. For simplicity, I have not made use of file activity_labels.txt as a dataset within R, but I am simply hard-coding the labels myself.

Finally, I am resetting column activity in my dataset to vector ActivityNamesData.

# Step 4
My dataset already has variable names. I am not further editing the variable names to make them tidier since my final dataset will be the dataset from step 5.

# Step 5
I am using group_by and summarise_each to obtain the mean of my measurements for each combination of subject and activity.

In the last steps, I am creating readable and easy to interpret variable names. I am removing all symbols like '()' and '-' from the variable names and I am writing out some of the abbreviations, i.e., acc and gyro. I choose not to write out more potential abbreviations or create even longer more descriptive names since it is also not useful if variable names become too long.
I choose to write the variable names in a combination of lowercase and capital letter since I find this more readable.

The final data set is tidy since it follows the following principles:

* each variable is in one column
* each different observation of that variable is in a different row
* there is one table for each "kind" of variable
* if you have multiple tables, they should include a column in the table that allows them to be linked

The last item does not apply since we have only one table.I believe that all variables (except the obligatory subject ID and activity identifier) are of the same kind, namely activity measurements. 

Furthermore, I have followed the following points:

* there is a row at the top of each file with variable names
* the variable names are human readable and descriptive

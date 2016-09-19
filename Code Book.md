## Code Book

This code book will describe the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

### Overview

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Explanation of each file

* `features.txt`: Shows information about the 561 variables used on the feature vector.
* `activity_labels.txt`: Links the class labels with their activity name.

* `X_train.txt`: Training set of 561 variables and 7352 obs.
* `subject_train.txt`: Each row identifies the subject who performed the activity for each window sample.
* `y_train.txt`: Training labels for each of the observations in `X_train.txt`.

* `X_test.txt`: Test set of 561 variables and 2947 obs.
* `subject_test.txt`: Each row identifies the subject who performed the activity for each window sample.
* `y_test.txt`: Test labels for each of the observations in `X_test.txt`.

All information about this files is available in `README.txt` and `features_info.txt`.

### summaries calculated

1. Download files
2. Load data into R
3. Merges data set
4. Extracts mean and std
5. Merge Descriptive activity names
6. Appropriately labels the data set with descriptive variable names
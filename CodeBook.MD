##Code Book for dataset "tidymeandata"

Attribution: the initial sections of this code book outlining the study methodology and inital measurements and calculations are from the README and features_info files provided with the inital study data. This information and the raw data can be located at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

####Study Methodology

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walkingupstairs, walkingdownstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record the raw data provides:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.




####Measurement of Raw Data

A total of 33 measurements were selected from the accelerometer and gyroscope 3-axial raw signals timeAcceleration-XYZ and timeGyroscope-XYZ (where '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions). These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some of these signals.

From these measurements, numerous variables were created in the raw data.  For our dataset, we selected only the mean and standard deviation variables of the 33 measures for a total of 66 observation variables. Other raw data variables such as "gravityMean" were excluded as our stated objective was to select the mean and standard deviation variables of the measurements, not to consider other variables created by averaging signals in a window sample.

####Variables in tidymeandata

Identification variables: Two variables provide the observational identification information:

* subject	- the identification number (1 to 30) associated with the individual performing the observation
* activity	- the activity (e.g. walking) being performed during the observation

Measurement variables:The remaining variables are the mean of all observations for each individual while performing a specific activity.  For example, the "timeBodyAccelerationMeanX" result reported for subject 1 activity laying is the average (mean) of the 50 recorded measurements of subject 1 laying down.

* timeBodyAccelerationMeanX
* timeBodyAccelerationMeanY
* timeBodyAccelerationMeanZ
* timeBodyAccelerationStandardDeviationX
* timeBodyAccelerationStandardDeviationY
* timeBodyAccelerationStandardDeviationZ
* timeGravityAccelerationMeanX
* timeGravityAccelerationMeanY
* timeGravityAccelerationMeanZ
* timeGravityAccelerationStandardDeviationX
* timeGravityAccelerationStandardDeviationY
* timeGravityAccelerationStandardDeviationZ
* timeBodyAccelerationJerkMeanX
* timeBodyAccelerationJerkMeanY
* timeBodyAccelerationJerkMeanZ
* timeBodyAccelerationJerkStandardDeviationX
* timeBodyAccelerationJerkStandardDeviationY
* timeBodyAccelerationJerkStandardDeviationZ
* timeBodyGyroscopeMeanX
* timeBodyGyroscopeMeanY
* timeBodyGyroscopeMeanZ
* timeBodyGyroscopeStandardDeviationX
* timeBodyGyroscopeStandardDeviationY
* timeBodyGyroscopeStandardDeviationZ
* timeBodyGyroscopeJerkMeanX
* timeBodyGyroscopeJerkMeanY
* timeBodyGyroscopeJerkMeanZ
* timeBodyGyroscopeJerkStandardDeviationX
* timeBodyGyroscopeJerkStandardDeviationY
* timeBodyGyroscopeJerkStandardDeviationZ
* timeBodyAccelerationMagnitudeMean
* timeBodyAccelerationMagnitudeStandardDeviation
* timeGravityAccelerationMagnitudeMean
* timeGravityAccelerationMagnitudeStandardDeviation
* timeBodyAccelerationJerkMagnitudeMean
* timeBodyAccelerationJerkMagnitudeStandardDeviation
* timeBodyGyroscopeMagnitudeMean
* timeBodyGyroscopeMagnitudeStandardDeviation
* timeBodyGyroscopeJerkMagnitudeMean
* timeBodyGyroscopeJerkMagnitudeStandardDeviation
* frequencyBodyAccelerationMeanX
* frequencyBodyAccelerationMeanY
* frequencyBodyAccelerationMeanZ
* frequencyBodyAccelerationStandardDeviationX
* frequencyBodyAccelerationStandardDeviationY
* frequencyBodyAccelerationStandardDeviationZ
* frequencyBodyAccelerationJerkMeanX
* frequencyBodyAccelerationJerkMeanY
* frequencyBodyAccelerationJerkMeanZ
* frequencyBodyAccelerationJerkStandardDeviationX
* frequencyBodyAccelerationJerkStandardDeviationY
* frequencyBodyAccelerationJerkStandardDeviationZ
* frequencyBodyGyroscopeMeanX
* frequencyBodyGyroscopeMeanY
* frequencyBodyGyroscopeMeanZ
* frequencyBodyGyroscopeStandardDeviationX
* frequencyBodyGyroscopeStandardDeviationY
* frequencyBodyGyroscopeStandardDeviationZ
* frequencyBodyAccelerationMagnitudeMean
* frequencyBodyAccelerationMagnitudeStandardDeviation
* frequencyBodyAccelerationJerkMagnitudeMean
* frequencyBodyAccelerationJerkMagnitudeStandardDeviation
* frequencyBodyGyroscopeMagnitudeMean
* frequencyBodyGyroscopeMagnitudeStandardDeviation
* frequencyBodyGyroscopeJerkMagnitudeMean
* frequencyBodyGyroscopeJerkMagnitudeStandardDeviation

Notes:
* X, Y, or Z are used to denote 3-axial signals in the X, Y and Z directions
* measurements are normalized and bounded within [-1,1], hence all of these variables are dimensionless

####Transformation in preparing tidymeandata:

* raw data files containg data relevant to our target dataset were aggregated to create a single data file.  files without any data required such as all the inertial data files were omitted.
* the data was subsetted to extract the target measurement variables described above and omitting all other variables
* the mean of multiple observation of the same activity for each subject was calculated and replaced the individual observations
* variable names were clarified, eliminating abbreviations and punctuation.  given the length of the variable names, camelCase was utilized for improved readability rather than all lower case names
* actiities were tansformed from integer codes into descriptive text strings
see the R script and README.MD file for greater detail on these data transformations

####Final data file:

* tidymeandata.txt is the final tidy data file
* it can be accessed at https://s3.amazonaws.com/coursera-uploads/user-7374ecf06cfe070c9e47fac2/972586/asst-3/e65ee1905c7e11e4a8e47ddac290dc45.txt
	note change the "https" to "http" in the address and the command read.table(url(address), header=TRUE)
* the wide form of tidy data was selected with two identifier variables and then all 66 measurement variables constituting the columns.  this data is tidy as each row summarizes one 'observation' and each column contains a single variable.

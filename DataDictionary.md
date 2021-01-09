CodeBook/Data Dictionary
================
JLR
1/8/2021

### PURPOSE

This document describes the data layout of the “tidy” data set generated
by the *run\_analysis()* R program. The data to be analyzed will be
downloaded from the [UCI Machine Learning
Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data used to generated the output dataset is stored in a .zip file
which includes the following key files:

  - ‘train/X\_train.txt’: Training set of sensor observations

  - ‘train/y\_train.txt’: Training activity indices which are mapped to
    ‘activity\_labels.txt’.

  - ‘test/X\_test.txt’: Test set of sensor observations

  - ‘test/y\_test.txt’: Test activity indices which are mapped to
    ‘activity\_labels.txt’.

  - ‘test/subject\_test.txt’: Each row identifies the subject who
    performed the activity for each window sample. Its range is from 1
    to 30.

  - ‘train/subject\_train.txt’: Each row identifies the subject who
    performed the activity for each window sample. Its range is from 1
    to 30.

The /train and /test folders provide the data to be analyzed. Each row
in the files provides:

  - Triaxial acceleration from the accelerometer (total acceleration)
    and the estimated body acceleration.
  - Triaxial Angular velocity from the gyroscope.
  - A 561-feature vector with time and frequency domain variables.
  - Numeric index to the daily activities (indexed in the
    ‘activity\_labels.txt’ dataset).
  - A numeric identifier of the subject who carried out the experiment.

The diagram below provides a high-level flow of the key input files.

![DataFlow](https://user-images.githubusercontent.com/75954319/104103205-e5c97f00-526e-11eb-9d6d-575e6478d078.png)

### DATA DEFINITIONS FOR TIDY DATA ANALYSIS DATASET (OUTPUT)

The output dataset is a summary of the detailed observations. The
observations are summarized by Test Subject (the person who was wearing
sensing device) and Activity. A mean calculation is prepared for each
variable at the summary level.

``` r
cb <- read.csv("CodeBook.csv", header=TRUE)
knitr::kable(cb
             )
```

| ï..Variable.Name                     | Type            | Description                                                                                                                                                   | Units | Domain.of.Values                                                          |
| :----------------------------------- | :-------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------ | :---- | :------------------------------------------------------------------------ |
| subject                              | Integer         | A unique number which identifies each person who participated in the experiment                                                                               | None  | An integer number \> 0                                                    |
| activity                             | Categorical     | A descriptive word or phrase that identifies the type of daily physical routine that a test subject is performing when the observation measurements are taken | None  | WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS,SITTING, STANDING, LAYING |
| tbodyaccmeanx                        | Numeric, double | A mean measurement of a time domain accelerometer in the X-axis.                                                                                              | Hz    | NA                                                                        |
| tbodyaccmeany                        | Numeric, double | A mean measurement of a time domain accelerometer in the Y-axis.                                                                                              | Hz    | NA                                                                        |
| tbodyaccmeanz                        | Numeric, double | A mean measurement of a time domain accelerometer in the Z-axis.                                                                                              | Hz    | NA                                                                        |
| tbodyaccstdx                         | Numeric, double | A standard deviation measurement of a time domain accelerometer in the X-axis.                                                                                | Hz    | NA                                                                        |
| tbodyaccstdy                         | Numeric, double | A standard deviation measurement of a time domain accelerometer in the Y-axis.                                                                                | Hz    | NA                                                                        |
| tbodyaccstdz                         | Numeric, double | A standard deviation measurement of a time domain accelerometer in the Z-axis.                                                                                | Hz    | NA                                                                        |
| tgravityaccmeanx                     | Numeric, double | A mean measurement of a time domain accelerometer in the X-axis.                                                                                              | Hz    | NA                                                                        |
| tgravityaccmeany                     | Numeric, double | A mean measurement of a time domain accelerometer in the Y-axis.                                                                                              | Hz    | NA                                                                        |
| tgravityaccmeanz                     | Numeric, double | A mean measurement of a time domain accelerometer in the Z-axis.                                                                                              | Hz    | NA                                                                        |
| tgravityaccstdx                      | Numeric, double | A standard deviation measurement of a time domain accelerometer in the X-axis.                                                                                | Hz    | NA                                                                        |
| tgravityaccstdy                      | Numeric, double | A standard deviation measurement of a time domain accelerometer in the Y-axis.                                                                                | Hz    | NA                                                                        |
| tgravityaccstdz                      | Numeric, double | A standard deviation measurement of a time domain accelerometer in the Z-axis.                                                                                | Hz    | NA                                                                        |
| tbodyaccjerkmeanx                    | Numeric, double | A mean measurement of a time domain accelerometer in the X-axis.                                                                                              | Hz    | NA                                                                        |
| tbodyaccjerkmeany                    | Numeric, double | A mean measurement of a time domain accelerometer in the Y-axis.                                                                                              | Hz    | NA                                                                        |
| tbodyaccjerkmeanz                    | Numeric, double | A mean measurement of a time domain accelerometer in the Z-axis.                                                                                              | Hz    | NA                                                                        |
| tbodyaccjerkstdx                     | Numeric, double | A standard deviation measurement of a time domain accelerometer in the X-axis.                                                                                | Hz    | NA                                                                        |
| tbodyaccjerkstdy                     | Numeric, double | A standard deviation measurement of a time domain accelerometer in the Y-axis.                                                                                | Hz    | NA                                                                        |
| tbodyaccjerkstdz                     | Numeric, double | A standard deviation measurement of a time domain accelerometer in the Z-axis.                                                                                | Hz    | NA                                                                        |
| tbodygyromeanx                       | Numeric, double | A mean measurement of a time domain gyroscope in the X-axis.                                                                                                  | Hz    | NA                                                                        |
| tbodygyromeany                       | Numeric, double | A mean measurement of a time domain gyroscope in the Y-axis.                                                                                                  | Hz    | NA                                                                        |
| tbodygyromeanz                       | Numeric, double | A mean measurement of a time domain gyroscope in the Z-axis.                                                                                                  | Hz    | NA                                                                        |
| tbodygyrostdx                        | Numeric, double | A standard deviation measurement of a time domain gyroscope in the X-axis.                                                                                    | Hz    | NA                                                                        |
| tbodygyrostdy                        | Numeric, double | A standard deviation measurement of a time domain gyroscope in the Y-axis.                                                                                    | Hz    | NA                                                                        |
| tbodygyrostdz                        | Numeric, double | A standard deviation measurement of a time domain gyroscope in the Z-axis.                                                                                    | Hz    | NA                                                                        |
| tbodygyrojerkmeanx                   | Numeric, double | A mean measurement of a time domain gyroscope in the X-axis.                                                                                                  | Hz    | NA                                                                        |
| tbodygyrojerkmeany                   | Numeric, double | A mean measurement of a time domain gyroscope in the Y-axis.                                                                                                  | Hz    | NA                                                                        |
| tbodygyrojerkmeanz                   | Numeric, double | A mean measurement of a time domain gyroscope in the Z-axis.                                                                                                  | Hz    | NA                                                                        |
| tbodygyrojerkstdx                    | Numeric, double | A standard deviation measurement of a time domain gyroscope in the X-axis.                                                                                    | Hz    | NA                                                                        |
| tbodygyrojerkstdy                    | Numeric, double | A standard deviation measurement of a time domain gyroscope in the Y-axis.                                                                                    | Hz    | NA                                                                        |
| tbodygyrojerkstdz                    | Numeric, double | A standard deviation measurement of a time domain gyroscope in the Z-axis.                                                                                    | Hz    | NA                                                                        |
| tbodyaccmagmean                      | Numeric, double | A mean measurement of a time domain accelerometer                                                                                                             | Hz    | NA                                                                        |
| tbodyaccmagstd                       | Numeric, double | A standard deviation measurement of a time domain accelerometer                                                                                               | Hz    | NA                                                                        |
| tgravityaccmagmean                   | Numeric, double | A mean measurement of a time domain accelerometer                                                                                                             | Hz    | NA                                                                        |
| tgravityaccmagstd                    | Numeric, double | A standard deviation measurement of a time domain accelerometer                                                                                               | Hz    | NA                                                                        |
| tbodyaccjerkmagmean                  | Numeric, double | A mean measurement of a time domain accelerometer                                                                                                             | Hz    | NA                                                                        |
| tbodyaccjerkmagstd                   | Numeric, double | A standard deviation measurement of a time domain accelerometer                                                                                               | Hz    | NA                                                                        |
| tbodygyromagmean                     | Numeric, double | A mean measurement of a time domain gyroscope                                                                                                                 | Hz    | NA                                                                        |
| tbodygyromagstd                      | Numeric, double | A standard deviation measurement of a time domain gyroscope                                                                                                   | Hz    | NA                                                                        |
| tbodygyrojerkmagmean                 | Numeric, double | A mean measurement of a time domain gyroscope                                                                                                                 | Hz    | NA                                                                        |
| tbodygyrojerkmagstd                  | Numeric, double | A standard deviation measurement of a time domain gyroscope                                                                                                   | Hz    | NA                                                                        |
| fbodyaccmeanx                        | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the X-axis.                                                                   | Hz    | NA                                                                        |
| fbodyaccmeany                        | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the Y-axis.                                                                   | Hz    | NA                                                                        |
| fbodyaccmeanz                        | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the Z-axis.                                                                   | Hz    | NA                                                                        |
| fbodyaccstdx                         | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to accelerometer in the X-axis.                                                     | Hz    | NA                                                                        |
| fbodyaccstdy                         | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to accelerometer in the Y-axis.                                                     | Hz    | NA                                                                        |
| fbodyaccstdz                         | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to accelerometer in the Z-axis.                                                     | Hz    | NA                                                                        |
| fbodyaccmeanfreqx                    | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the X-axis.                                                                   | Hz    | NA                                                                        |
| fbodyaccmeanfreqy                    | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the Y-axis.                                                                   | Hz    | NA                                                                        |
| fbodyaccmeanfreqz                    | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the Z-axis.                                                                   | Hz    | NA                                                                        |
| fbodyaccjerkmeanx                    | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the X-axis.                                                                   | Hz    | NA                                                                        |
| fbodyaccjerkmeany                    | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the Y-axis.                                                                   | Hz    | NA                                                                        |
| fbodyaccjerkmeanz                    | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the Z-axis.                                                                   | Hz    | NA                                                                        |
| fbodyaccjerkstdx                     | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to accelerometer in the X-axis.                                                     | Hz    | NA                                                                        |
| fbodyaccjerkstdy                     | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to accelerometer in the Y-axis.                                                     | Hz    | NA                                                                        |
| fbodyaccjerkstdz                     | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to accelerometer in the Z-axis.                                                     | Hz    | NA                                                                        |
| fbodyaccjerkmeanfreqx                | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the X-axis.                                                                   | Hz    | NA                                                                        |
| fbodyaccjerkmeanfreqy                | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the Y-axis.                                                                   | Hz    | NA                                                                        |
| fbodyaccjerkmeanfreqz                | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer in the Z-axis.                                                                   | Hz    | NA                                                                        |
| fbodygyromeanx                       | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to gyroscope in the X-axis.                                                                       | Hz    | NA                                                                        |
| fbodygyromeany                       | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to gyroscope in the Y-axis.                                                                       | Hz    | NA                                                                        |
| fbodygyromeanz                       | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to gyroscope in the Z-axis.                                                                       | Hz    | NA                                                                        |
| fbodygyrostdx                        | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to gyroscope in the X-axis.                                                         | Hz    | NA                                                                        |
| fbodygyrostdy                        | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to gyroscope in the Y-axis.                                                         | Hz    | NA                                                                        |
| fbodygyrostdz                        | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to gyroscope in the Z-axis.                                                         | Hz    | NA                                                                        |
| fbodygyromeanfreqx                   | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to gyroscope in the X-axis.                                                                       | Hz    | NA                                                                        |
| fbodygyromeanfreqy                   | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to gyroscope in the Y-axis.                                                                       | Hz    | NA                                                                        |
| fbodygyromeanfreqz                   | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to gyroscope in the Z-axis.                                                                       | Hz    | NA                                                                        |
| fbodyaccmagmean                      | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer                                                                                  | Hz    | NA                                                                        |
| fbodyaccmagstd                       | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to accelerometer                                                                    | Hz    | NA                                                                        |
| fbodyaccmagmeanfreq                  | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer                                                                                  | Hz    | NA                                                                        |
| fbodybodyaccjerkmagmean              | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to accelerometer                                                                    | Hz    | NA                                                                        |
| fbodybodyaccjerkmagstd               | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to accelerometer                                                                                  | Hz    | NA                                                                        |
| fbodybodyaccjerkmagmeanfreq          | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to accelerometer                                                                    | Hz    | NA                                                                        |
| fbodybodygyromagmean                 | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to gyroscope                                                                                      | Hz    | NA                                                                        |
| fbodybodygyromagstd                  | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to gyroscope                                                                        | Hz    | NA                                                                        |
| fbodybodygyromagmeanfreq             | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to gyroscope                                                                                      | Hz    | NA                                                                        |
| fbodybodygyrojerkmagmean             | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to gyroscope                                                                                      | Hz    | NA                                                                        |
| fbodybodygyrojerkmagstd              | Numeric, double | A standard deviation measurement of a Fast Fourier Transformation applied to gyroscope                                                                        | Hz    | NA                                                                        |
| fbodybodygyrojerkmagmeanfreq         | Numeric, double | A mean measurement of a Fast Fourier Transformation applied to gyroscope                                                                                      | Hz    | NA                                                                        |
| angle(tbodyaccmean,gravity)          | Numeric, double | Angle calculations based on mean                                                                                                                              | Hz    | NA                                                                        |
| angle(tbodyaccjerkmean),gravitymean) | Numeric, double | Angle calculations based on mean                                                                                                                              | Hz    | NA                                                                        |
| angle(tbodygyromean,gravitymean)     | Numeric, double | Angle calculations based on mean                                                                                                                              | Hz    | NA                                                                        |
| angle(tbodygyrojerkmean,gravitymean) | Numeric, double | Angle calculations based on mean                                                                                                                              | Hz    | NA                                                                        |
| angle(x,gravitymean)                 | Numeric, double | Angle calculations based on mean                                                                                                                              | Hz    | NA                                                                        |
| angle(y,gravitymean)                 | Numeric, double | Angle calculations based on mean                                                                                                                              | Hz    | NA                                                                        |
| angle(z,gravitymean)                 | Numeric, double | Angle calculations based on mean                                                                                                                              | Hz    | NA                                                                        |

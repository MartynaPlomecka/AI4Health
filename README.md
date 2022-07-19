# AI4Health
This repository contains baselines and data prepropcessing code for the Benchmark “A benchmark for prediction of psychiatric multimorbidity from resting EEG data in a large pediatric sample” [Langer et al, 2022](https://www.sciencedirect.com/science/article/pii/S1053811922004670)
## 
We provide an intuitive interface to reproduce our results and to use the methods presented here as a starting point for further research. All Multi-Output Classifiers were implemented using the Scikit-learn software (Pedregosa et al. 2011).

##  Model Fitting
We randomly split the data set into a 75% training set and a 25% test set. For the data split, we normalized the features using scikit-learn standard scaling method that scales each feature and label individually such that the values are in the given range ( i.e. between 0 and 1) on the training set. Subsequently, we applied these parameters for feature normalization of the training and test sets. Parameter estimation was based only on the training set to prevent data leakage from the training to test set. The normalization of features was followed by dimensionality reduction, which served to avoid overfitting of classifiers. Dimensionality reduction for the analyses reported in the manuscript was performed using principal component analysis (PCA). Thereby, we used the number of components that explained 95% of the variance. Again, PCA projections were calculated on the training data only and subsequently applied to both training and test sets.<br />

## Random Baselines
In order to check the performance of the proposed baseline methods, we implemented dummy models and evaluations to represent random baselines. <br />
In the case of the classification task, we obtained a null distribution by comparing the classifier outputs on the test data to randomly shuffled test label vectors (i.e. shuffling baseline). Two further dummy classifiers were considered. First, a model predicting exactly zero for all samples and diagnoses was included (i.e. always zero baseline). Second, a more refined dummy model
was constructed, which constantly predicted the proportion of positive labels for each diagnosis (i.e. label proportion baseline). These proportions were calculated from the training data. Thus, assuming that the proportion of positive cases for a diagnosis in the training set was 0.3, this model would constantly predict the probability of the same diagnosis to occur to be 0.3 as well for each new test sample. To avoid degeneracy when evaluating performance metrics on these dummy classifier outputs, a tiny amount of random noise was added, though. For all three dummy models/evaluations, a distribution of performance scores was obtained across 100 random shufflings/noise realizations. For the regression task, we used similar baselines, including shuffled label vectors (i.e. shuffled baseline). As dummy regressors, we used models that always predict the mean (i.e. mean baseline) or median (i.e. median baseline) of each individual score as estimated on the training set. <br />
Additionally, to obtain more robust estimates, we assessed the performance of our models on a bootstrapped pseudo-test dataset, sampling 100 times with replacement, and using a sample size equal to the original data. Below, we describe the models used and report the average performance obtained on the pseudo-test dataset across the bootstrap repetitions as well as 95% confidence intervals. All models are compared to the random baselines described above.









## Dataset
Dataset can be found [here](https://osf.io/2vw6j/)


 * __train_features_sensor.csv__: <br />
 1440 rows (subjects) x 8508 columns (ID, demographics and features)
   * Columns 1-3 contain ID, gender and age.<br />
   * Columns 4-8298 contain power values of each electrode for the frequencies 1 to 40 Hz in steps of 0.5 Hz.
   * Columns 8299 – 8508 contain the aperiodic intercept and slope parameter for each electrode.
 * __test_features_sensor_classification.csv__: <br />
   *  This table contains test features that are used for the classification task.
   *  The structure is identical to train_features_sensor.csv
   *  Here, 481 rows (subjects) x 8508 columns (ID, demographics and features) are
provided
 * __test_features_sensor_regression.csv__: <br />
275 rows (subjects) x 8508 columns (ID, demographics and features) are
provided
   * This table contains test features that are used for the regression task.
   * The structure is identical to train_features_sensor.csv
 * __Chanlocs105.mat__ provides channel locations (3D coordinates) for the 105 electrodes.
 * __EGI_hcgsn_128.pdf__ visualizes channel locations of the full EEG cap (128 electrodes). For the
feature extraction, channels in the outermost circumference (chin and neck) and channels predominantly measuring oculomotor activity were excluded.

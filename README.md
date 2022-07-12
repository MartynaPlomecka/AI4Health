# AI4Health
This repository contains baselines and data prepropcessing code for the Benchmark “A benchmark for prediction of psychiatric multimorbidity from resting EEG data in a large pediatric sample” [Langer et al, 2022](https://www.sciencedirect.com/science/article/pii/S1053811922004670)
## 
We provide an intuitive interface to reproduce our results and to use the methods presented here as a starting point for further research. All Multi-Output Classifiers were implemented using the Scikit-learn software (Pedregosa et al. 2011).
## Performance metrics for the multi-task multi-label classification challenge


The overarching goal of this challenge is to derive accurate predictions of the existence of one or more psychiatric conditions in the presence of multimorbidities. <br />
 We included 7 different diagnoses <br />
 * Attention-Deficit/Hyperactivity Disorder,
 * Anxiety Disorders,
 * Specific Learning Disorder,
 * Autism Spectrum Disorder,
 * Disruptive, 
 * Communication Disorder,
 * Depressive Disorders, <br />
As diagnoses are not mutually exclusive, this constitutes a multi-task multi-label classification problem, where several related binary classification rules need to be derived from the same data. <br />
Performance metrics will be calculated and documented for individual disease tasks. <br />

The primary performance measure, which we use to rank contributions, is the area under the precision recall curve (AUPRC). Assuming continuous classifier outputs, the PRC for a single binary disease prediction task is a plot of the classifier’s precision (fraction of true positives among all positively predictions) as a function of its recall/sensitivity (fraction of true positives among all positive cases in the sample) for all possible thresholds of the decision function. The AUPRC is defined as the area under that curve, and takes values between 0 (perfect misclassification) and 1 (perfect classification). <br />
This metric is well suited for imbalanced data as present here. In addition to AUPRC, the area under the receiver operating curve (AUROC) will be used as a secondary metric. The ROC is a plot of sensitivity of a binary classifier as a function of its false positive rate (fraction of false positives among all negative cases in the sample). The area under the ROC curve is more commonly used than AUPRC but slightly less suitable for imbalanced data. It takes values between 0 (perfect misclassification) and 1 (perfect classification), where a value of 0.5 denotes chance-level performance. Both AUPRC and AUROC are aggregated across diagnoses by taking the arithmetic mean (macro average).<br />
Further secondary classification performance metrics are derived from binarized model outputs. <br />
Performance metrics include the Hamming loss (fraction of misclassified labels) as well as the F1 score, defined as the harmonic mean of precision and recall. Both metrics are normalized between 0 and 1, where higher F1 scores indicate better performance while higher Hamming losses indicate worse performance. To obtain aggregate scores, both metrics are calculated across the pooled predictions corresponding to all diagnoses (micro average).
Finally, the calibration of continuous probabilistic outputs is assessed using the Brier score. The Brier score is defined as the mean squared difference between the predicted probability and the actual outcome. The Brier score takes values between 0 and 1, where smaller Brier scores indicate better calibration. A 100% confident correct classification does not incur any loss in the Brier score, while a misclassification with 100% confidence assigned to the wrong class incurs the maximal loss of 1. Predictions with low confidence do incur intermediate losses even if they lead to correct classifications. To compute the Brier score, the provided continuous classifier outputs will be cropped to the interval [0, 1] in order to be interpreted as probabilities. Aggregate Brier scores are obtained by taking the mean squared difference jointly across all classes (micro=macro average). <br />

## Multi-target regression challenge
Dimensional labels were obtained from cognitive and behavioral data of each subject. <br /> The following seven measures were selected:  <br />
 * General anxiety (measured by the SCARED GAD scale)
 * Inattention (SWAN IN scale)
 * Hyperactivity (SWAN HY scale)
 * Social communication index (SRS-2 SCI scale);
 * Restricted interests and repetitive behaviour (SRS-2 RRB scale)
 * Verbal comprehension index (WISC VCI, scale) 
 * Working memory index (WISC WMI scale).

## Performance metrics for the multi-target regression challenge
The success in predicting continuous dimensional measures of symptom severity and cognitive performance in the second challenge is measured using the coefficient of determination (R2), the mean squared error (MSE), and the mean absolute error (MAE).<br />
 MSE and MAE are unnormalized quantities that measure the averaged squared or absolute deviation between true and predicted scores. Our primary performance metric is R2, which is defined as 1 minus the ratio between the MSE and the MSE of a constant model predicting the mean across the dataset for each sample. As such, the maximal R2 value is 1, indicating perfect correlation between true and predicted values, while models performing worse than a model predicting the mean can yield negative R2 values. While MSE and MAE are averaged across all samples and disorders (micro=macro average), R2 values are calculated per disorder using the individual mean severity for each individual disorder, and then averaged across disorders (macro average). <br />

##  Model Fitting
We randomly split the data set into a 75% training set and a 25% test set. For the data split, we normalized the features using scikit-learn standard scaling method that scales each feature and label individually such that the values are in the given range ( i.e. between 0 and 1) on the training set. Subsequently, we applied these parameters for feature normalization of the training and test sets. Parameter estimation was based only on the training set to prevent data leakage from the training to test set. The normalization of features was followed by dimensionality reduction, which served to avoid overfitting of classifiers. Dimensionality reduction for the analyses reported in the manuscript was performed using principal component analysis (PCA). Thereby, we used the number of components that explained 95% of the variance. Again, PCA projections were calculated on the training data only and subsequently applied to both training and test sets.<br />


## Random Baselines
In order to check the performance of the proposed baseline methods, we implemented dummy models and evaluations to represent random baselines. <br />
In the case of the classification task, we obtained a null distribution by comparing the classifier outputs on the test data to randomly shuffled test label vectors (i.e. shuffling baseline). Two further dummy classifiers were considered. First, a model predicting exactly zero for all samples and diagnoses was included (i.e. always zero baseline). Second, a more refined dummy model
was constructed, which constantly predicted the proportion of positive labels for each diagnosis (i.e. label proportion baseline). These proportions were calculated from the training data. Thus, assuming that the proportion of positive cases for a diagnosis in the training set was 0.3, this model would constantly predict the probability of the same diagnosis to occur to be 0.3 as well for each new test sample. To avoid degeneracy when evaluating performance metrics on these dummy classifier outputs, a tiny amount of random noise was added, though. For all three dummy models/evaluations, a distribution of performance scores was obtained across 100 random shufflings/noise realizations. For the regression task, we used similar baselines, including shuffled label vectors (i.e. shuffled baseline). As dummy regressors, we used models that always predict the mean (i.e. mean baseline) or median (i.e. median baseline) of each individual score as estimated on the training set. <br />
Additionally, to obtain more robust estimates, we assessed the performance of our models on a bootstrapped pseudo-test dataset, sampling 100 times with replacement, and using a sample size equal to the original data. Below, we describe the models used and report the average performance obtained on the pseudo-test dataset across the bootstrap repetitions as well as 95% confidence intervals. All models are compared to the random baselines described above.









## Dataset
Dataset can be found [here](https://osf.io/2vw6j/)


 * train_features_sensor.csv :
 1440rows(subjects)x8508columns(ID,demographicsandfeatures)
⋅⋅* Columns 1-3 contain ID, gender and age.
⋅⋅* Columns 4-8298 contain power values of each electrode for the frequencies 1 to 40
Hz in steps of 0.5 Hz. E.g., Column 4 “Electrode1_1_0_Hz” represents power of electrode 1 at 1.0 Hz. Column 5 “Electrode1_1_5_Hz” represents power of electrode 1 at 1.5 Hz.
⋅⋅* Columns 8299 – 8508 contain the aperiodic intercept and slope parameter for each electrode. E.g., Column 8299 “Electrode1_Intercept” represents the aperiodic intercept of electrode 1. Column 8300 “Electrode1_Slope” represents the aperiodic slope of electrode 1.
 * test_features_sensor_classification.csv:
⋅⋅* This table contains test features that are used for the classification task.
⋅⋅* The structure is identical to train_features_sensor.csv.
⋅⋅* Here, 481 rows (subjects) x 8508 columns (ID, demographics and features) are
provided
 * test_features_sensor_regression.csv:
 ⋅⋅*This table contains test features that are used for the regression task.
 ⋅⋅*The structure is identical to train_features_sensor.csv
 ⋅⋅*Here, 275 rows (subjects) x 8508 columns (ID, demographics and features) are
provided
 * Chanlocs105.mat provides channel locations (3D coordinates) for the 105 electrodes.
 * EGI_hcgsn_128.pdf visualizes channel locations of the full EEG cap (128 electrodes). For the
feature extraction, channels in the outermost circumference (chin and neck) and channels predominantly measuring oculomotor activity were excluded.

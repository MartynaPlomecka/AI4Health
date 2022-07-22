## Psychiatric Symptom Severity: a Multi-target regression challenge

TODO:
- say sth about the getting started ipynbs
- link to the challenge https://health.aiaudit.org/web/challenges/challenge-page/338/overview
- needed info about this challenge

---

### Getting started:
- download the python [notebook](https://github.com/MartynaPlomecka/AI4Health/blob/challenge/Multi%20Target%20Regression/MultiTargetRegression_GettingStarted.ipynb)
- download the prepared [dataset](https://osf.io/2vw6j/)
- the paper describing the benchmark's goals and challenge can be found here [Langer et al, 2022](https://www.sciencedirect.com/science/article/pii/S1053811922004670)
- you can submit your predictions [here](https://health.aiaudit.org/web/challenges/challenge-page/338/overview)

---

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

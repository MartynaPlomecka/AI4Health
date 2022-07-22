## Multi-task Multi-label Classification Challenge

---

### Getting started:
- download the python [notebook](https://github.com/MartynaPlomecka/AI4Health/blob/challenge/Multi%20Label%20Classification/MultiLabelClassification_GettingStarted.ipynb)
- download the prepared [dataset](https://osf.io/2vw6j/)
- the paper describing the benchmark's goals and challenge can be found here [Langer et al, 2022](https://www.sciencedirect.com/science/article/pii/S1053811922004670)
- you can submit your predictions [here](https://health.aiaudit.org/web/challenges/challenge-page/337/overview)

---
The overarching goal of this challenge is to derive accurate predictions of the existence of one or more psychiatric conditions in the presence of multimorbidities.<br />

 In our benchmark, we included 7 different diagnoses:
 * Attention-Deficit/Hyperactivity Disorder
 * Anxiety Disorders
 * Specific Learning Disorder
 * Autism Spectrum Disorder
 * Disruptive
 * Communication Disorder
 * Depressive Disorders <br />
As diagnoses are not mutually exclusive, this constitutes a multi-task multi-label classification problem, where several related binary classification rules need to be derived from the same data. <br />
Performance metrics will be calculated and documented for individual disease tasks. <br />

## Performance metrics for the multi-task multi-label classification challenge

### The primary performance measure (used to rank contributions):<br />
- **Area under the precision recall curve (AUPRC)**
Assuming continuous classifier outputs, the PRC for a single binary disease prediction task is a plot of the classifier’s precision (fraction of true positives among all positively predictions) as a function of its recall/sensitivity (fraction of true positives among all positive cases in the sample) for all possible thresholds of the decision function. The AUPRC is defined as the area under that curve, and takes values between 0 (perfect misclassification) and 1 (perfect classification). <br />
This metric is well suited for imbalanced data as present here. <br />

### Secondary classification performance metric  <br />

-  **Area under the receiver operating curve (AUROC)** will be used as a secondary metric. <br />
-   The ROC is a plot of sensitivity of a binary classifier as a function of its false positive rate (fraction of false positives among all negative cases in the sample). The area under the ROC curve is more commonly used than AUPRC but slightly less suitable for imbalanced data. It takes values between 0 (perfect misclassification) and 1 (perfect classification), where a value of 0.5 denotes chance-level performance. Both AUPRC and AUROC are aggregated across diagnoses by taking the arithmetic mean (macro average).<br />

### Further secondary classification performance metrics  <br />
(Derived from binarized model outputs) <br />
- **Hamming loss** *(fraction of misclassified labels)* 
-  **F1 score**, defined as the *harmonic mean of precision and recall*.<br />
Both metrics are normalized between 0 and 1, where higher F1 scores indicate better performance while higher Hamming losses indicate worse performance. To obtain aggregate scores, both metrics are calculated across the pooled predictions corresponding to all diagnoses (micro average).  <br /> 
-  **Brier score**. The Brier score is defined as *the mean squared difference between the predicted probability and the actual outcome*. 
The Brier score takes values between 0 and 1, where smaller Brier scores indicate better calibration. A 100% confident correct classification does not incur any loss in the Brier score, while a misclassification with 100% confidence assigned to the wrong class incurs the maximal loss of 1. Predictions with low confidence do incur intermediate losses even if they lead to correct classifications. To compute the Brier score, the provided continuous classifier outputs will be cropped to the interval [0, 1] in order to be interpreted as probabilities.<br /> Aggregate Brier scores are obtained by taking the mean squared difference jointly across all classes. <br />

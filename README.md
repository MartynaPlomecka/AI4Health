# AI4Health
## Multiclass and Multilabel Classification problem
 set of labels - 7 different diagnoses (classes)<br />
 * 'Attention-Deficit/Hyperactivity Disorder',
 * 'Anxiety Disorders',
 * 'Specific Learning Disorder',
 * 'Autism Spectrum Disorder',
 * 'Disruptive, 
 * 'Communication Disorder',
 * 'Depressive Disorders', <br />
 

<br /><br /><br />
## Metrics:
In our scripts, we provide the following metrics:
* #### Hamming loss <br />
* #### precision, recall and F1 score for each class <br />
With the 3 different types of averaging:
     * micro (calculate metrics globally by counting the total true positives, false negatives and false positives)
    * macro (calculate metrics for each label, and find their unweighted mean. This does not take label imbalance into account)
    * weighted (calculate metrics for each label, and find their average weighted by support - the number of true instances for each label). 
<br /><br />
 This alters ‘macro’ to account for label imbalance; it can result in an F-score that is not between precision and recall.)<br />

* #### Additionally, tradictional accuracy and confusion matrixes are reported.



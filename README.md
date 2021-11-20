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
## precision, recall and F1 score for each class
With the 3 different types of averaging:
 * micro (calculate metrics globally by counting the total true positives, false negatives and false positives)
 * macro (calculate metrics for each label, and find their unweighted mean. This does not take label imbalance into account)
 * weighted (calculate metrics for each label, and find their average weighted by support <br />(the number of true instances for each label). 
 This alters ‘macro’ to account for label imbalance; it can result in an F-score that is not between precision and recall.)




Now, coming back to multi-label case, we need to be little lean to find the accuracy lets say the actual labels for a record having 3 target labels is [2,4,3] and predicted is [2,1,3]. Our prediction is neither fully correct nor fully wrong. Using traditional accuracy measure ment techniques on such data is harsh. In multi-label classification, a misclassification is no longer a hard wrong or right. A prediction containing a subset of the actual classes should be considered better than a prediction that contains none of them

Hence, we use Hamming loss/Hamming score metrics. does that by exclusive or (XOR) between the actual and predicted labels and then average across the dataset. In above example 2 out of 3 labels have been preicted correctly hence Hamming Loss would be 0.33.


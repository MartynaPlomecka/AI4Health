import pandas as pd
import numpy as np
from sklearn.linear_model import SGDClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import cross_val_score


df = pd.read_csv("dataSpectra.csv")
#print(df)
print(df['DX_01_Cat'].value_counts()[:5].index.tolist())

categories = 5
df2 = df.loc[df['DX_01_Cat'].isin(df['DX_01_Cat'].value_counts()[:categories].index.tolist())]
print(df2['DX_01_Cat'])

print(list(df2.columns[171: 201]))

X = df2.iloc[:, 171: 201].to_numpy()
y = df2['DX_01_Cat'].to_numpy()

clf = SGDClassifier(loss="hinge", penalty="l2", max_iter=10000)
print(X.shape)
clf.fit(X, y)
print(y[0:5])
scores = cross_val_score(clf, X, y, cv=10)
print(scores)

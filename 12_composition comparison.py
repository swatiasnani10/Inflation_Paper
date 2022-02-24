import pandas as pd
import os
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.feature_extraction.text import CountVectorizer
import matplotlib.pyplot as plt
import numpy as np
from sklearn.decomposition import LatentDirichletAllocation as LDA
from wordcloud import WordCloud, ImageColorGenerator
import statsmodels.api as sm
from scipy import stats

os.chdir('/media/abhinav/OS1/Acads/Employment/ISB_RA/Inflation Anchoring Project/Regression_Rerun_2020Data/Raw Data')

df=pd.read_stata('exp_data_hh.dta')

df['COUNT']=[1]*len(df)
df=df[~(df['AGE'].isin(['60 years and above','Up to 25 years']))]
df=df[~(df['CATEGORY'].isin(['RETIRED PERSONS','OTHER CATEGORY']))]
df['ROUND']=pd.to_numeric(df['ROUND'])
df=df[df.eval("ROUND>26 and ROUND<58")]
df['dummy_it']=np.where(df['ROUND']<39, 0, 1)

df['MED_AGE']=np.where(df['AGE']=='25 to 30 years',27.5,0)
df['MED_AGE']=np.where(df['AGE']=='30 to 35 years',32.5,df['MED_AGE'])
df['MED_AGE']=np.where(df['AGE']=='35 to 40 years',37.5,df['MED_AGE'])
df['MED_AGE']=np.where(df['AGE']=='40 to 45 years',42.5,df['MED_AGE'])
df['MED_AGE']=np.where(df['AGE']=='45 to 50 years',47.5,df['MED_AGE'])
df['MED_AGE']=np.where(df['AGE']=='50 to 55 years',52.5,df['MED_AGE'])
df['MED_AGE']=np.where(df['AGE']=='55 to 60 years',57.5,df['MED_AGE'])

df['IND_GENDER']=np.where(df['GENDER']=='Female',1,0)
df['CATEGORY']=np.where(df['CATEGORY']=='HOMEMAKER','HOUSEWIFE',df['CATEGORY'])

groupby=df.groupby(['ROUND','PERIOD','dummy_it'])
df_cagteg=groupby.mean()['MED_AGE']
df_cagteg=df_cagteg.reset_index()
X=df_cagteg[df_cagteg['dummy_it']==0].MED_AGE
Y=df_cagteg[df_cagteg['dummy_it']==1].MED_AGE
print(stats.ttest_ind(X,Y))
print(df_cagteg[df_cagteg['dummy_it']==0].MED_AGE.mean())
print(df_cagteg[df_cagteg['dummy_it']==1].MED_AGE.mean())

groupby=df.groupby(['ROUND','PERIOD','dummy_it'])
df_cagteg=groupby.mean()['IND_GENDER']
df_cagteg=df_cagteg.reset_index()
X=df_cagteg[df_cagteg['dummy_it']==0].IND_GENDER
Y=df_cagteg[df_cagteg['dummy_it']==1].IND_GENDER
print(stats.ttest_ind(X,Y))
print(df_cagteg[df_cagteg['dummy_it']==0].IND_GENDER.mean())
print(df_cagteg[df_cagteg['dummy_it']==1].IND_GENDER.mean())

groupby=df.groupby(['ROUND','PERIOD','dummy_it','CATEGORY'])
df_cagteg=groupby.sum()['COUNT']
df_cagteg=df_cagteg.reset_index()
groupby=df_cagteg.groupby(['ROUND','PERIOD','dummy_it'])
df_cagteg2=groupby.sum()['COUNT']
df_cagteg=df_cagteg.merge(df_cagteg2, on='ROUND', how='left')
df_cagteg['PCT']=df_cagteg['COUNT_x']/df_cagteg['COUNT_y']

for i in df_cagteg.CATEGORY.unique():
    X=df_cagteg[np.logical_and(df_cagteg['dummy_it']==0,df_cagteg['CATEGORY']==i)].PCT
    Y=df_cagteg[np.logical_and(df_cagteg['dummy_it']==1,df_cagteg['CATEGORY']==i)].PCT
    print(i)
    print(stats.ttest_ind(X,Y))
    print(df_cagteg[np.logical_and(df_cagteg['dummy_it']==0,df_cagteg['CATEGORY']==i)].PCT.mean())
    print(df_cagteg[np.logical_and(df_cagteg['dummy_it']==1,df_cagteg['CATEGORY']==i)].PCT.mean())

os.chdir('/media/abhinav/OS1/Acads/Employment/ISB_RA/Inflation Anchoring Project/Regression_Rerun_2020Data/Results_2021_04_29')
df_cagteg.to_csv('x.csv')

stats.ttest_ind(df_cagteg[df_cagteg.eval("dummy_it==0")].IND_GENDER,df_cagteg[df_cagteg.eval("dummy_it==1")].IND_GENDER)

groupby=df.groupby(['ROUND','PERIOD','dummy_it'])
df_cagteg=groupby.sum()['COUNT']
df_cagteg=df_cagteg.reset_index()
X=df_cagteg[df_cagteg['dummy_it']==0].COUNT
Y=df_cagteg[df_cagteg['dummy_it']==1].COUNT
print(stats.ttest_ind(X,Y))
print(df_cagteg[df_cagteg['dummy_it']==0].COUNT.mean())
print(df_cagteg[df_cagteg['dummy_it']==1].COUNT.mean())

###########################################################################

os.chdir('/media/abhinav/OS1/Acads/Employment/ISB_RA/Inflation Anchoring Project/Regression_Rerun_2020Data/Text_Analysis/LDA/Results_06Oct2020')

df_1=pd.read_csv('y1_30top_newspapers.csv')
df_2=pd.read_csv('y1_all_across_topics.csv')

df_1['dummy_it']=np.where(df_1.index<30, 0, 1)
df_2['dummy_it']=np.where(df_2.index<30, 0, 1)

df_1.drop(['DATE'],axis=1,inplace=True)
df_2.drop(['DATE'],axis=1,inplace=True)

for clm in df_1.columns:
    X1=df_1[df_1['dummy_it']==0][clm]
    Y1=df_1[df_1['dummy_it']==1][clm]
    X2=df_1[df_1['dummy_it']==0][clm]
    Y2=df_1[np.logical_and(df_1['dummy_it']==1,df_1.index>=33)][clm]
    
    print("\n\n", clm)
    print("With Spike T-Test: ", stats.ttest_ind(X1,Y1))
    print("With Spike pre mean: ",X1.mean())
    print("With Spike post mean: ",Y1.mean())
    print("Without Spike T-Test: ", stats.ttest_ind(X2,Y2))
    print("Without Spike pre mean: ",X2.mean())
    print("Without Spike post mean: ",Y2.mean())

for clm in df_2.columns:
    X1=df_2[df_2['dummy_it']==0][clm]
    Y1=df_2[df_2['dummy_it']==1][clm]
    X2=df_2[df_2['dummy_it']==0][clm]
    Y2=df_2[np.logical_and(df_2['dummy_it']==1,df_2.index>=33)][clm]
    
    print("\n\n", clm)
    print("With Spike T-Test: ", stats.ttest_ind(X1,Y1))
    print("With Spike pre mean: ",X1.mean())
    print("With Spike post mean: ",Y1.mean())
    print("Without Spike T-Test: ", stats.ttest_ind(X2,Y2))
    print("Without Spike pre mean: ",X2.mean())
    print("Without Spike post mean: ",Y2.mean())

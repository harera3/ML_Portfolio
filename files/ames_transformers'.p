
from sklearn.base import BaseEstimator, TransformerMixin

class ContMissFiller(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        miss_cols = ['BsmtFin SF 1', 'BsmtFin SF 2', 'Bsmt Unf SF',
                 'Total Bsmt SF', 'Garage Area', 'Mas Vnr Area']
        for col in miss_cols:
            df[col] = df[col].fillna(df[col].mean())        
        return df    
    
class LotFrontFiller(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        mean = df['Lot Frontage'].mean()
        df['Lot Frontage'] = df.groupby(['MS SubClass'])['Lot Frontage'].apply(
            lambda x:x.fillna(x.mean()))
        df['Lot Frontage'] = df['Lot Frontage'].fillna(mean)
        return df
    
class DiscMissFiller(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        miss_cols = ['Garage Cars', 'Bsmt Full Bath', 'Bsmt Half Bath']
        for col in miss_cols:
            df[col] = df[col].fillna(df[col].median()) 
            df[col] = df[col].astype(int)
        return df
    
class GYBFiller(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):          
        df = df.copy()
        df['Garage Yr Blt'] = ames.groupby(['MS SubClass'])['Garage Yr Blt'].apply(
            lambda x:x.fillna(x.median()))
        df['Garage Yr Blt'] = df['Garage Yr Blt'].fillna(
            df['Garage Yr Blt'].median())
        df['Garage Yr Blt'] = df['Garage Yr Blt'].astype(int)
        return df
    
class NaNExEncoder(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        likert_cols = ['Exter Qual', 'Exter Cond', 'Bsmt Qual', 'Bsmt Cond', 
                       'Heating QC', 'Kitchen Qual', 'Fireplace Qu', 'Garage Qual', 
                       'Garage Cond', 'Pool QC']
        likert_dict = {'Ex': 9, 'Gd': 7, 'TA': 5, 'Fa': 3, 'Po': 2, np.nan: 0}
        for col in likert_cols:
            df[col] = [likert_dict[item] for item in df[col]]
            df[col] = df[col].astype(int)
        return df
    
class Ord2Encoder(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        ord2_cols = ['Lot Shape', 'Land Slope', 'Bsmt Exposure', 'BsmtFin Type 1',             
             'BsmtFin Type 2', 'Central Air', 'Fence', 'Sale Condition']

        ord2_dict = {'Reg':8, 'IR1':6, 'IR2':4, 'IR3':2, 'Gtl':9, 'Mod':6, 'Sev':3,
                     'Gd':8, 'Av':6, 'Mn':4, 'No':2, 'GLQ':7, 'ALQ':6, 'BLQ':5, 
                     'Rec':4, 'LwQ':3, 'Unf':2, 'Y':10, 'N':5, 'GdPrv':8, 'MnPrv':6, 
                     'GdWo':4, 'MnWw':2, 'Normal':8, 'Abnorml':6, 'AdjLand':5, 'Alloca':4, 
                     'Family':3, 'Partial':2, np.nan:0
                    }
        for col2 in ord2_cols:
            df[col2] = [ord2_dict[item] for item in df[col2]]
        return df
    
class Ord3Encoder(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        ord3_cols = ['Functional', 'Garage Finish', 'Paved Drive']

        ord3_dict = {'Typ':8, 'Min1':7, 'Min2':6, 'Mod':5, 'Maj1':4, 'Maj2':3, 'Sev':2, 
                     'Sal':1, 'Fin':9, 'RFn':6, 'Unf':3, 'Y':9, 'P':6, 'N':3, np.nan:0
                    }        
        for col3 in ord3_cols:
            df[col3] = [ord3_dict[item] for item in df[col3]]
        return df
    
class NominalFiller(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        nom_cols = ['Mas Vnr Type', 'Garage Type', 'Alley', 'Misc Feature']              
        for col in nom_cols:
            df[col] = df[col].fillna('None')
        return df
    
class YrsRemodeler(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        df['Yrs_until_Remod'] = df['Year Remod/Add'] - df['Year Built']
        return df
    
class ColDropper(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        drop_cols = ['Garage Area', '1st Flr SF', 'Garage Yr Blt', 
                     'TotRms AbvGrd']
        for col in drop_cols:
            df = df.drop(col, axis=1)        
        return df
    
class DummyMaker(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        dumb_cols = ['MS SubClass', 'MS Zoning', 'Street', 'Alley', 'Land Contour', 
                     'Utilities', 'Lot Config', 'Neighborhood', 'Condition 1', 
                     'Condition 2', 'Bldg Type', 'House Style', 'Roof Style', 
                     'Roof Matl', 'Exterior 1st', 'Exterior 2nd', 'Mas Vnr Type', 
                     'Foundation', 'Heating', 'Electrical', 'Garage Type', 
                     'Misc Feature', 'Sale Type']
        for col in dumb_cols:
            dummies = pd.get_dummies(df[col], prefix=col)
            df = pd.concat([df, dummies], axis=1)
            df = df.drop([col], axis=1)      
        return df
    
class OutlierCapper(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        cont_cols = ['Lot Frontage', 'Lot Area', 'Mas Vnr Area', 'BsmtFin SF 1', 
                     'BsmtFin SF 2', 'Bsmt Unf SF', 'Total Bsmt SF', '1st Flr SF',
                     '2nd Flr SF', 'Gr Liv Area', 'Garage Area', 'Wood Deck SF', 
                     'Open Porch SF', 'Low Qual Fin SF', 'Enclosed Porch', 
                     '3Ssn Porch', 'Screen Porch', 'Pool Area', 'Misc Val']
        for col in cont_cols:
            Q1 = df[col].quantile(0.25)
            Q3 = df[col].quantile(0.75)
            IQR = Q3 - Q1
            LB = Q1 - (IQR * 1.5)
            UB = Q3 + (IQR * 1.5)
            df.loc[df[col] > UB, col] = UB
            df.loc[df[col] < LB, col] = LB
        return df
    
from sklearn.preprocessing import StandardScaler

class DfStdScaler(BaseEstimator, TransformerMixin):    
    def __init__(self):
        self    
        
    def fit(self, df, y = None):               
        return self

    def transform(self, df):        
        df = df.copy()
        stdizer = StandardScaler()
        std_cols = ['Lot Frontage', 'Lot Area', 'Mas Vnr Area', 'BsmtFin SF 1', 
                     'BsmtFin SF 2', 'Bsmt Unf SF', 'Total Bsmt SF', '1st Flr SF',
                     '2nd Flr SF', 'Gr Liv Area', 'Garage Area', 'Wood Deck SF', 
                     'Open Porch SF', 'Low Qual Fin SF', 'Enclosed Porch', 
                     '3Ssn Porch', 'Screen Porch', 'Pool Area', 'Misc Val',
                   'Year Remod/Add', 'Yrs_until_Remod', 'Year Built']
        df[std_cols] = stdizer.fit_transform(df[std_cols])
        return df

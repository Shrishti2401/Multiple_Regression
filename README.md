
# Multiple Regression Analysis – Predictive Modeling

## 📌 Project Overview
This project applies **Multiple Linear Regression** to predict a continuous outcome using statistical techniques for validation and optimization. The work demonstrates knowledge of **probability distributions, regression assumptions, and model diagnostics**, aligning with real-world data science workflows.

## 🎯 Objectives
- Build and validate a multiple regression model on a dataset of 1,000+ samples (Kaggle).  
- Ensure core regression assumptions are satisfied (normality, linearity, homoscedasticity, independence).  
- Apply transformations and statistical tests to improve model fit and accuracy.  
- Detect and handle outliers/multicollinearity for robust predictions.  

## 🛠️ Methodology
1. **Exploratory Data Analysis (EDA)**  
   - Visualized feature relationships and distribution patterns.  
   - Detected potential outliers and multicollinearity.  

2. **Model Building**  
   - Implemented Multiple Linear Regression with multiple predictors.  
   - Checked residuals for normality and homoscedasticity.  

3. **Statistical Adjustments**  
   - Applied **Box-Cox transformation** for stabilizing variance.  
   - Performed **multicollinearity checks (VIF)** to ensure predictor independence.  
   - Conducted outlier detection using influence plots.  

4. **Evaluation Metrics**  
   - R² (Coefficient of Determination)  
   - Adjusted R²  
   - RMSE (Root Mean Squared Error)  
   - AIC (Akaike Information Criterion)

#### [See Presentation](https://docs.google.com/presentation/d/12w11ItBG3AdIjIeW9VxKuxLMR6geuUwx/edit?usp=sharing&ouid=117700732220450204389&rtpof=true&sd=true)

## 📊 Results
- **Baseline R²**: ~0.61 (before adjustments)  
- **Final R²**: ~0.75 (after adjustments & corrections) → **~23% improvement in explanatory power**  
- **RMSE**: Reduced significantly, indicating better prediction accuracy.  
- **AIC**: Dropped from 4832 → 4015, showing improved model fit.  

## 🔑 Key Learnings
- Importance of checking **assumptions** in regression before model interpretation.  
- Effectiveness of transformations (Box-Cox) in stabilizing variance.  
- Handling **outliers and multicollinearity** improves both interpretability and predictive performance.  
- Balancing statistical rigor with practical prediction metrics (R², RMSE).  

## 🚀 Tech Stack
- **Python** (NumPy, Pandas, Statsmodels, Scikit-learn, Matplotlib, Seaborn)  
- **Statistical Techniques**: Probability Distributions, Box-Cox Transformations, Outlier Detection, Multicollinearity Tests  




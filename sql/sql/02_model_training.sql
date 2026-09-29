-- Train the BQML Logistic Regression Model
CREATE OR REPLACE MODEL `kaggle_banking.bank_churn_model`
OPTIONS(
  model_type = 'logistic_reg',
  input_label_cols = ['exited'],
  auto_class_weights = TRUE
) AS
SELECT * FROM `kaggle_banking.model_features`;

--Evaluate Model Metrics
SELECT * FROM ML.EVALUATE(MODEL `kaggle_banking.bank_churn_model`);

--Check Confusion Matrix and Feature Importances
SELECT * 
FROM ML.CONFUSION_MATRIX(MODEL `kaggle_banking.bank_churn_model`);

--To see which customer features drive churn decisions most heavily
SELECT
  processed_input,
  weight
FROM ML.WEIGHTS(MODEL `kaggle_banking.bank_churn_model`)
ORDER BY ABS(weight) DESC;

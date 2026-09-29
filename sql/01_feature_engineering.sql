CREATE OR REPLACE TABLE `kaggle_banking.model_features` AS
SELECT
  -- Numerical Features
  CreditScore AS credit_score,
  Age AS age,
  Tenure AS tenure,
  Balance AS balance,
  NumOfProducts AS num_of_products,
  HasCrCard AS has_cr_card,
  IsActiveMember AS is_active_member,
  EstimatedSalary AS estimated_salary,
  
  -- Categorical Features (BQML auto-one-hot encodes strings)

  Geography AS geography,
  Gender AS gender,
  
  -- Binary Target Label
  Exited AS exited
FROM `kaggle_banking.bank_churn_raw`;

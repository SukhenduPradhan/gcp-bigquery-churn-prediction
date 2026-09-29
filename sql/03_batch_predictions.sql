WITH source_data AS (
  SELECT
    CustomerId,
    Surname,
    CreditScore AS credit_score,
    Age AS age,
    Tenure AS tenure,
    Balance AS balance,
    NumOfProducts AS num_of_products,
    HasCrCard AS has_cr_card,
    IsActiveMember AS is_active_member,
    EstimatedSalary AS estimated_salary,
    Geography AS geography,
    Gender AS gender,
    Exited AS exited
  FROM `kaggle_banking.bank_churn_raw`
  WHERE Exited = 0
)

SELECT
  CustomerId AS customer_id,
  Surname AS surname,
  geography,
  age,
  balance,
  -- Extract probability score for churn (label = 1)
  (SELECT prob FROM UNNEST(predicted_exited_probs) WHERE label = 1) AS churn_probability
FROM ML.PREDICT(
  MODEL `kaggle_banking.bank_churn_model`,
  (SELECT * FROM source_data)
)
WHERE (SELECT prob FROM UNNEST(predicted_exited_probs) WHERE label = 1) > 0.70
ORDER BY churn_probability DESC;

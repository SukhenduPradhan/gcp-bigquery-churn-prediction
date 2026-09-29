# Bank Customer Churn Prediction using BigQuery ML (BQML)

## Business Overview
This project builds an end-to-end batch churn prediction pipeline in Google BigQuery to identify high-risk retail banking customers before they leave the bank.

## Tech Stack
* **Cloud Platform:** Google Cloud Platform (GCP)
* **Data Warehouse:** Google BigQuery
* **Machine Learning:** BigQuery ML (Logistic Regression)
* **Dataset:** 10,000 real customer records (Kaggle Bank Churn Dataset)

## Pipeline Architecture
1. **Data Ingestion & Cleaning:** Standardized schema, handled categorical encoding and isolated operational customer features.
2. **Model Training:** Trained a BQML Logistic Regression model using `auto_class_weights=TRUE` to address class imbalance.
3. **Evaluation:** Evaluated model performance using ROC AUC, Precision and Recall metrics.
4. **Batch Scoring:** Generated predicted churn probabilities for all active customers, filtering high-risk cases (>70% probability) for retention campaigns.

## Key Queries
* See `sql/01_feature_engineering.sql` for data preparation.
* See `sql/02_model_training.sql` for BQML training logic.
* See `sql/03_batch_predictions.sql` for scoring and filtering.

## Business Impact
Identified top churn drivers (e.g. customer age, active membership status and product counts) and automated daily risk scoring to support targeted customer retention efforts.

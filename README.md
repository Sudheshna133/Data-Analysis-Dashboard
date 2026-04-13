# Wind-Turbine-Failure-Data-Analysis(Interactive Dashboard creation using PowerBI)
## Project Objective
Wind turbine failure analysis project aims to analyze 2021 turbine data to identify failure patterns, detect anomalies, and generate insights for predictive maintenance, improving efficiency and reducing downtime.


## Dataset used
- <a href="https://github.com/Sudheshna133/Data-Analysis-Dashboard/blob/main/Wind_turbine.csv">Dataset</a>


## Key Questions (Important KPIs)
- What is the relationship between wind speed and power generation?
- Which factors contribute to turbine failure (Failure_status)?
- Which parameters show abnormal behavior before failure?
- How do temperature variables (bearing, nacelle, gear oil) impact performance?
- Are there any critical thresholds causing failures?
- How many missing values, outliers, and duplicates exist in the data?

## Dashboards
- Dashbaord Interaction <a href="https://github.com/Sudheshna133/Data-Analysis-Dashboard/blob/main/Windturbine_Dashboard%201.jpg">View Dashbaord</a>
- Dashbaord Interaction <a href="https://github.com/Sudheshna133/Data-Analysis-Dashboard/blob/main/Windturbine_Dashboard%202.jpg">View Dashbaord</a>
- Dashbaord Interaction <a href="https://github.com/Sudheshna133/Data-Analysis-Dashboard/blob/main/Windturbine_Dashboard%203.jpg">View Dashbaord</a>


## Process
-Imported dataset into MySQL and understood key features (wind speed, power, temperature, failure status).
-Performed data cleaning by handling missing values, outliers (Z-score), and duplicates.
-Conducted EDA using statistical measures and correlation analysis.
-Created a cleaned dataset (wind_turbine_clean).
-Generated insights on failure patterns, sensor anomalies, and performance trends.

## Dashboard
![Windturbine_Dashboard 1](https://github.com/user-attachments/assets/99c333f2-830b-43d0-9988-1ac42ca6a113)
![Windturbine_Dashboard 2](https://github.com/user-attachments/assets/cead186e-afb3-4ef6-8212-e9721fce4d64)
![Windturbine_Dashboard 1](https://github.com/user-attachments/assets/df72a1ed-ad42-478d-82bc-aea55064f853)

## Project Insights 
-Wind speed has a strong impact on turbine power generation (Mean ≈ 17.56).
-High temperature levels indicate a potential risk of turbine failure (Bearing Temp Mean ≈ 84.15).
-Sensor anomalies act as early warning signals (Rotor Speed Std Dev ≈ 100.34).
-The dataset contains missing values and outliers detected using Z-score (>3).
-High variability in data reflects unstable conditions (Wind Speed Variance ≈ 126.81).

## Conclusion

This project analyzes wind turbine failure data using SQL to identify failure patterns, detect anomalies, and generate insights for predictive maintenance and improved operational efficiency. It highlights the strong impact of wind speed and temperature on turbine performance. Abnormal sensor behavior is identified as an early warning signal for potential failures. Data cleaning techniques improved the quality and accuracy of analysis. The insights help in reducing downtime and optimizing maintenance strategies. Overall, the project enhances turbine efficiency and operational reliability.


🌾 AgriData Explorer: Understanding Indian agriculture with EDA


📌 Project Description

Agri_Data_Explorer is a comprehensive data engineering and analytics project that tracks the evolution of Indian agriculture from 1960 to 2025.
The system utilizes Python for automated ETL (Extract, Transform, Load) processes, SQL for complex querying, and Power BI for geospatial and temporal visualizations. It provides deep insights into crop yield, production shifts, and regional agricultural dominance over six decades.

🛠️ Technologies Used

Python (Pandas): Automated data cleaning, unit normalization, and column renaming.

SQL (PostgreSQL/MySQL): Structured data storage and advanced analytical querying.

Power BI: Interactive geospatial heatmaps, trend analysis, and multi-level drill-downs.

Visual Studio Code: Primary IDE for script development and environment management.

🚀 Key Features

Automated Unit Scaling: Programmatically detects "1000s" units in raw headers and normalizes values for data integrity.

Geospatial Heatmaps: Visualizes state-level production intensity with conditional formatting.

Temporal Slicing: Interactive year-based analysis to track the impact of the Green Revolution.

Multi-Level Drill-Down: Transition from State-level overview to District-level granular insights.

Dynamic Tooltips: Hover-activated breakdown of diverse crops (Barley, Castor, Rice, etc.).

📂 Project Structure

Agri_Data_Explorer/
├── Data/

   ├── agri_uncleaned_data.csv        # Raw historical data
       └── agri_cleaned_data.csv      # Processed & normalized data
       
├── PowerBI_EDA/

   ├── Agri_Data_EDA.pbix                # Interactive Power BI Dashboard
       └── eda_insights_of_agri_data.pdf # Static report export
       
├── PowerBI_SQL/
   ├── agri_data_SQL.pbix                # SQL-integrated dashboard
       └── dashboard_agri_data_SQL.pdf
       
├── SQL_Queries/
       └── agri_SQL_Queries.sql         # Complex analytical queries
       
├── Scripts_Python/

   ├── data_cleaning.py           # ETL and Normalization script
       └── eda_analysis.ipynb         # Exploratory Notebook
       
└── README.md


📊 Dataset Specifications

The dataset spans 50+ years and includes:

Crops: Rice, Wheat, Barley, Castor, Chickpea, Cotton, Millet, etc.

Metrics: Production (Tonnes), Area (Hectares), and Yield (kg/Ha).

Geography: State and District-level mapping.

Timeframe: 1960 to 2025 (Projected/Historical).

⚙️ How to Run the Project

Data Cleaning:

Run the Python script to transform raw CSV data into a cleaned version.

Bash

python Scripts_Python/data_cleaning.py

Visualization:

Open the .pbix files in Power BI Desktop to interact with the dashboards.

SQL Analysis:

Execute the .sql scripts in your database environment to generate statistical summaries.

📈 Project Goals

Automate ETL: Reduce manual data preparation time using Python.

Geospatial Insights: Identify regional crop specializations across India.

Trend Prediction: Analyze 50-year growth patterns to support agricultural decision-making.

Data Integrity: Ensure unit consistency across disparate historical records.

👨‍💻 Author
Ranjithkumar K

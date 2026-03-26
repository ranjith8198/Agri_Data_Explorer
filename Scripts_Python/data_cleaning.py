import pandas as pd

# Load the data
df = pd.read_csv('agri_uncleaned_data.csv')

# 1. Formatting Names (Consistency)
df.columns = df.columns.str.strip().str.lower().str.replace(" ", "_")
df.columns = df.columns.str.replace("(", "", regex=False).str.replace(")", "", regex=False)
df.columns = df.columns.str.replace("/", "_", regex=False)

# --- THE FIX: Removing the extra text from column names ---
# This cleans out '1000_tons', '1000_ha', and 'kg_per_ha' so names are short
df.columns = df.columns.str.replace('_1000_tons', '', regex=False)
df.columns = df.columns.str.replace('_1000_ha', '', regex=False)
df.columns = df.columns.str.replace('_kg_per_ha', '', regex=False)
df.columns = df.columns.str.replace('_1000', '', regex=False)

# 2. Removing Duplicates
df = df.drop_duplicates()

# 3. Handling Errors
df = df.replace([-99, -1, -999, -99.0, -1.0], 0)

# 4. Math Correction
# Note: Since names are now clean, we check the original columns for the 1000 multiplier
raw_cols = pd.read_csv('agri_uncleaned_data.csv', nrows=0).columns
for raw_col, clean_col in zip(raw_cols, df.columns):
    if '1000' in raw_col:
        df[clean_col] = df[clean_col] * 1000

# 5. Saving result
df.to_csv('agri_cleaned_data.csv', index=False)
print("Project Cleaning Complete ")

import pandas as pd
from pathlib import Path

# --------------------------------
# 1. Define the cleaning function
# --------------------------------

def clean_data(df):

    # Create a copy of original dataset
    df = df.copy()

    # Remove extra spaces from column names
    df.columns = df.columns.str.strip()

    # Remove completely empty columns
    df = df.dropna(axis=1, how='all')

    # Remove duplicate rows
    df = df.drop_duplicates()

    # Convert FlightDate into datetime
    if 'FlightDate' in df.columns:
        df['FlightDate'] = pd.to_datetime(
            df['FlightDate'],
            errors='coerce'
        )

    return df


# --------------------------------
# 2. Load and clean the dataset
# --------------------------------

if __name__ == "__main__":

    BASE_DIR = Path(__file__).resolve().parent

    file_path = BASE_DIR / "Flights_2018_2.csv"

    df = pd.read_csv(file_path, low_memory=False)

    cleaned_df = clean_data(df)

    # Display dataset dimensions
    print("Original shape:", df.shape)
    print("Cleaned shape:", cleaned_df.shape)

    # Save cleaned dataset
    output_path = BASE_DIR / "Flights_2018_2_cleaned.csv"

    cleaned_df.to_csv(output_path, index=False)

    print("Cleaning completed successfully!")
    print("Saved at:", output_path)

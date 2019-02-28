import ec3
import pandas as pd

tor = ec3.get_data(stations=5051, years=range(1981, 2003))
tor = tor.rename(columns={'Date/Time': 'Date', 'Max Temp (Â°C)': 'MaxTemp', 'Min Temp (Â°C)': 'MinTemp', 'Mean Temp (Â°C)': 'MeanTemp', 'Total Precip (mm)': 'TotalPrecip'})
tor = tor[['Date', 'MaxTemp', 'MinTemp', 'MeanTemp', 'TotalPrecip']]

tor2 = ec3.get_data(stations=31688, years=range(2003, 2011))
tor2 = tor2.rename(columns={'Date/Time': 'Date', 'Max Temp (Â°C)': 'MaxTemp', 'Min Temp (Â°C)': 'MinTemp', 'Mean Temp (Â°C)': 'MeanTemp', 'Total Precip (mm)': 'TotalPrecip'})
tor2 = tor2[['Date', 'MaxTemp', 'MinTemp', 'MeanTemp', 'TotalPrecip']]

tor = tor[tor.Date < "2003-07-01"].append(tor2[tor2.Date >= "2003-07-01"]).to_csv("tor.csv")

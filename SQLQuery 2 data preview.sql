USE HealthProject
GO

-- Using simple functions like COUNT, WHERE, GROUP BY can help to understand the data more
-- The result shows that data for each country is quite irregular, and it's worth to explore it deeper
-- Perhaps it should be considered to drop columns that has too many NULLS

SELECT [country_Canc], COUNT([country_Canc]) AS 'cancer ratio',COUNT([alc_consump]) AS 'alcohol', COUNT([consulatations]) AS 'consultation',
COUNT([healthcare_spending_USD_per_capita]) AS 'spending', COUNT([obese_ratio]) AS 'obese ratio'
FROM [dbo].[Deaths from cancer]
LEFT JOIN [dbo].[Alkohol consumption] ON [CountryID_canc] = [ContryID_alc]
LEFT JOIN [dbo].[Doctors' consultations] ON [CountryID_canc] = [CountryID_consult]
LEFT JOIN [dbo].[Gov healthcare spending] ON [CountryID_canc] = [Country_ID_spending]
LEFT JOIN [dbo].[Overweight or obese population] ON [CountryID_canc] = [CountryID_obese]
WHERE [alc_consump] IS NULL OR [consulatations] IS NULL
OR [healthcare_spending_USD_per_capita] IS NULL OR [obese_ratio] IS NULL
GROUP BY [country_Canc]
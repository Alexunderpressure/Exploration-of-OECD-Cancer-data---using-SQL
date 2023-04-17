USE HealthProject
GO

-- Exploration of dateset should begin with gathering all the data in one place.
-- I didn't have any ID code, hence I created the code by combining 2 columns Country+Year.
-- To achive that I'm using LEFT JOIN function, because I want underline that Cancer_table is a main point of analysis.

SELECT [country_Canc],[year_canc],[death_ratio],[alc_consump], [consulatations], [healthcare_spending_USD_per_capita], [obese_ratio]
FROM [dbo].[Deaths from cancer]
LEFT JOIN [dbo].[Alkohol consumption] ON [CountryID_canc] = [ContryID_alc]
LEFT JOIN [dbo].[Doctors' consultations] ON [CountryID_canc] = [CountryID_consult]
LEFT JOIN [dbo].[Gov healthcare spending] ON [CountryID_canc] = [Country_ID_spending]
LEFT JOIN [dbo].[Overweight or obese population] ON [CountryID_canc] = [CountryID_obese]
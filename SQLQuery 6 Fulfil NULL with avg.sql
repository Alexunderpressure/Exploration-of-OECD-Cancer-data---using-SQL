USE HealthProject
GO

-- After Inspecting significant lack of date, we can use the data analytic's technique which is:
-- Replacing Blank values with an average by using function COALESCE
-- We don't want to do that with an overall average, we want to have a specific average for every country
-- To achieve that we need to use combination of OVER + PARTITTION BY


SELECT 
    [country_Canc], 
    [year_canc], 
	COALESCE([alc_consump], AVG([alc_consump]) OVER (PARTITION BY [country_Canc])),
	COALESCE([consulatations], AVG([consulatations]) OVER(PARTITION BY [country_Canc])),
	COALESCE([healthcare_spending_USD_per_capita], AVG([healthcare_spending_USD_per_capita]) OVER(PARTITION BY [country_Canc])),
	COALESCE([obese_ratio], AVG([obese_ratio]) OVER (PARTITION BY [country_Canc]))
FROM [dbo].[Deaths from cancer]
LEFT JOIN [dbo].[Alkohol consumption] ON [CountryID_canc] = [ContryID_alc]
LEFT JOIN [dbo].[Doctors' consultations] ON [CountryID_canc] = [CountryID_consult]
LEFT JOIN [dbo].[Gov healthcare spending] ON [CountryID_canc] = [Country_ID_spending]
LEFT JOIN [dbo].[Overweight or obese population] ON [CountryID_canc] = [CountryID_obese]
WHERE
[alc_consump] IS NOT NULL AND
[consulatations] IS NOT NULL AND
[healthcare_spending_USD_per_capita] IS NOT NULL AND
[obese_ratio] IS NOT NULL
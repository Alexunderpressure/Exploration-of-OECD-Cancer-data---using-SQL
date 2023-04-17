USE HealthProject
GO

-- After achieving right result, we should take care of visual site of our outcome
-- By using CAST AS NUMERIC, we convert data to good-looking type
-- + AS 'name' we can name every new created column


SELECT 
    [country_Canc], 
    [year_canc], 
    CAST(COALESCE([alc_consump], AVG([alc_consump]) OVER (PARTITION BY [country_Canc])) AS NUMERIC(10,2)) AS 'alc_consump',
	CAST(COALESCE([consulatations], AVG([consulatations]) OVER(PARTITION BY [country_Canc])) AS NUMERIC(10,2)) AS 'consulatations',
	CAST(COALESCE([healthcare_spending_USD_per_capita], AVG([healthcare_spending_USD_per_capita]) OVER(PARTITION BY [country_Canc])) AS NUMERIC(10,2)) AS 'healthcare_spending',
	CAST(COALESCE([obese_ratio], AVG([obese_ratio]) OVER (PARTITION BY [country_Canc]))/100 AS NUMERIC(10,2)) AS 'obese_ratio'
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

-- Our dataset now looks much better than before, after applying those steps
-- We could take our new extracted data and merge it with input data
-- What would be the next steps to improve our dataset?
-- Certainly, there is still room for improvement
-- For instance, we could download datasets from other sources,
-- and fulfil empty values with real data by including it in our dataset

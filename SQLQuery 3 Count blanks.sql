USE HealthProject
GO

-- Previously, We used COUNT to check how many records are in all of our table
-- Here We can see how many countries have NULL values
-- We could repeat this operation for every single column

SELECT country_Canc, COUNT(country_Canc) AS 'blanks'
FROM [dbo].[Deaths from cancer]
LEFT JOIN [dbo].[Alkohol consumption] ON [CountryID_canc] = [ContryID_alc]
LEFT JOIN [dbo].[Doctors' consultations] ON [CountryID_canc] = [CountryID_consult]
LEFT JOIN [dbo].[Gov healthcare spending] ON [CountryID_canc] = [Country_ID_spending]
LEFT JOIN [dbo].[Overweight or obese population] ON [CountryID_canc] = [CountryID_obese]
WHERE [alc_consump] IS NULL
GROUP BY country_Canc
USE HealthProject
GO

-- During inserting a new data to our set, it is easy to make mistake
-- Hopefully, the solution is simple, thanks to DELETE function we can drop any record we want

DELETE FROM [dbo].[Alkohol consumption]
WHERE [country_alc] = 'Germany' AND [year_alc] = '2020';
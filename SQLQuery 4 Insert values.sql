USE HealthProject
GO

-- IF number of blanks is relatively small, We can easily add date manually
-- In this case we add new record for Alcohol consumption in Germany in 2020

INSERT INTO [dbo].[Alkohol consumption]([country_alc],[year_alc],[ContryID_alc],[alc_consump])
VALUES ('Germany', '2020','Germany2020', 10);

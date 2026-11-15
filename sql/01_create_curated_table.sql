-- AWS Retail Data Analytics Platform
-- Step 1: Create a curated Parquet dataset from the raw retail data.
-- InvoiceNo is stored as VARCHAR to preserve cancellation prefixes such as 'C'.

CREATE TABLE online_retail_curated_v2
WITH (
    format = 'PARQUET',
    external_location = 's3://retail-analytics-project-oct2026/curated-data/online_retail_parquet_v2/'
) AS

SELECT
    CAST(InvoiceNo AS VARCHAR) AS InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    Quantity * UnitPrice AS line_revenue

FROM online_retail_source;

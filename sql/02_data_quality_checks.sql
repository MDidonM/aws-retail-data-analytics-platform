-- AWS Retail Data Analytics Platform
-- Data Quality Check 1: Record count and missing customer IDs.

-- Check the total number of records and identify missing CustomerIDs.

SELECT
    COUNT(*) AS total_records,
    COUNT_IF(CustomerID IS NULL OR TRIM(CustomerID) = '') AS missing_customer_ids
FROM online_retail_curated_v2;

-- Data Quality Check 2: Identify negative quantities and cancellations.

SELECT
    COUNT(*) AS negative_records,
    COUNT_IF(InvoiceNo LIKE 'C%') AS cancellation_records
FROM online_retail_curated_v2
WHERE Quantity < 0;

-- Data Quality Check 3: Identify repeated transaction combinations.

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT
        CONCAT(
            InvoiceNo, '|',
            StockCode, '|',
            InvoiceDate, '|',
            CAST(Quantity AS VARCHAR), '|',
            CAST(UnitPrice AS VARCHAR)
        )
    ) AS unique_records
FROM online_retail_curated_v2;

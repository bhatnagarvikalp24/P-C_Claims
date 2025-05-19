-- CREATE TABLE PNC_Claims (
--     ClaimNumber VARCHAR(20) PRIMARY KEY,
--     Reserve_Profile VARCHAR(50),
--     ExposureYear INT,
--     IncurredLoss DECIMAL(15, 2),
--     UltimateLoss DECIMAL(15, 2),
--     AssignedEarmarkedLoss DECIMAL(15, 2),
--     FinancePremium DECIMAL(15, 2),
--     LossType VARCHAR(10), -- 'Gross' or 'Net'
--     ClaimStatus VARCHAR(20), -- 'Open', 'Closed', 'Reopened'
--     ReportedDate DATE,
--     SettlementDate DATE,
--     Currency VARCHAR(5), -- 'USD', 'EUR', etc.
--     GeographicalLocation VARCHAR(50)
-- );

-- DROP TABLE IF EXISTS PNC_Claims;


-- -- Enable foreign key constraints in SQLite
PRAGMA foreign_keys = ON;

-- Create the main claims table
CREATE TABLE PNC_Claims (
    ClaimNumber TEXT PRIMARY KEY,
    Reserve_Profile TEXT,
    ExposureYear INTEGER,
    IncurredLoss REAL,
    UltimateLoss REAL,
    AssignedEarmarkedLoss REAL,
    FinancePremium REAL,
    LossType TEXT,
    ClaimStatus TEXT,
    ReportedDate TEXT,          -- ISO format: 'YYYY-MM-DD'
    SettlementDate TEXT,        -- Nullable, for open claims
    Currency TEXT,
    GeographicalLocation TEXT
);

-- Create the investigation table with a foreign key to PNC_Claims
CREATE TABLE ClaimInvestigation (
    ClaimNumber TEXT PRIMARY KEY,
    AdjusterID INTEGER,
    InvestigationStatus TEXT,
    InvestigationCost REAL,
    FOREIGN KEY (ClaimNumber) REFERENCES PNC_Claims(ClaimNumber)
);


select * from PNC_Claims limit 10;

SELECT * from ClaimInvestigation LIMIT 10;


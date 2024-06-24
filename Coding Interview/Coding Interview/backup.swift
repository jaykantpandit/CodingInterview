//
//  backup.swift
//  Coding Interview
//
//  Created by BizBrolly on 13/06/24.
//

import Foundation


/*
Here are links to help you get started with Stream Analytics Query Language:
Common query patterns - https://go.microsoft.com/fwLink/?LinkID=619153
Query language - https://docs.microsoft.com/stream-analytics-query/query-language-elements-azure-stream-analytics

*/
/*
-- Parse meter data to ParseMeter
WITH ParseMeter AS (
    SELECT
        i.PartitionId AS PartitionId,
        i.IoTHub.ConnectionDeviceId AS deviceName,
        i.IoTHub.ConnectionDeviceGenerationId AS ConnectionDeviceGenerationId,
        solarMeter = GetRecordPropertyValue(i, CONCAT('meter_', i.IoTHub.ConnectionDeviceId))
    FROM input i
),

-- normalize for sloar device
normalize AS (
    SELECT
        i.PartitionId AS PartitionId,
        i.IoTHub.ConnectionDeviceId AS deviceName,
        i.IoTHub.ConnectionDeviceGenerationId AS ConnectionDeviceGenerationId,
        solarinverter = GetRecordPropertyValue(i, CONCAT('inverter_', i.IoTHub.ConnectionDeviceId))
    FROM input i
),

inverterInfo AS (
    SELECT
        CONCAT(normalize.ConnectionDeviceGenerationId, '_' , DATEDIFF(millisecond, '1970-01-01', System.Timestamp)*1000) AS messageId,
        normalize.PartitionId AS PartitionId,
        normalize.deviceName AS deviceName,
        normalize.ConnectionDeviceGenerationId AS ConnectionDeviceGenerationId,

        name            =   REPLACE(REPLACE(GetArrayElement(normalize.solarinverter, 0).data, '[', ''), ']', ''),
        powerYield      =   REPLACE(REPLACE(GetArrayElement(normalize.solarinverter, 1).data, '[', ''), ']', ''),
        temperature     =   REPLACE(REPLACE(GetArrayElement(normalize.solarinverter, 2).data, '[', ''), ']', ''),
        mpptVoltage     =   REPLACE(REPLACE(GetArrayElement(normalize.solarinverter, 3).data, '[', ''), ']', ''),
        totalDCPower    =   REPLACE(REPLACE(GetArrayElement(normalize.solarinverter, 4).data, '[', ''), ']', ''),
        voltageCurrent  =   REPLACE(REPLACE(GetArrayElement(normalize.solarinverter, 5).data, '[', ''), ']', ''),
        KWH             =   REPLACE(REPLACE(GetArrayElement(normalize.solarinverter, 6).data, '[', ''), ']', ''),
        powerFactor     =   REPLACE(REPLACE(GetArrayElement(normalize.solarinverter, 7).data, '[', ''), ']', ''),
        mppt45          =   REPLACE(REPLACE(GetArrayElement(normalize.solarinverter, 8).data, '[', ''), ']', ''),
        gridFrequency   =   REPLACE(REPLACE(GetArrayElement(normalize.solarinverter, 9).data, '[', ''), ']', '')

    FROM normalize
    CROSS APPLY GetArrayElements(solarinverter) AS solar
    WHERE normalize.solarinverter IS NOT NULL

)

-- Insert Device Info into outputTable, ConnectionDeviceGenerationId used as messageId

SELECT
    sd.IoTHub.ConnectionDeviceId AS DeviceId,
    sd.IoTHub.ConnectionDeviceGenerationId AS messageId,
    sd.PartitionId AS PartitionId
INTO
    [outputTable]
FROM
    input sd
    
-- Insert Device Element Info into table, systemtimestamp with element index used as messageId

SELECT
    inverterInfo.messageId AS messageId,
    inverterInfo.PartitionId AS PartitionId,
    inverterInfo.deviceName AS DeviceName,
  
    CAST(SUBSTRING(name, 0, CHARINDEX(',', name)) AS BIGINT)*0.1 AS ActivePower,
    CAST(SUBSTRING(name, CHARINDEX(',', name) + 1, CHARINDEX(',', name, CHARINDEX(',', name) + 1) - CHARINDEX(',', name) - 1) AS BIGINT) AS OutputType,
    CAST(SUBSTRING(name, CHARINDEX(',', name, CHARINDEX(',', name) + 1) + 1, LEN(name)) AS BIGINT)*0.1 AS DailyPowerGeneration,
       
    CAST(SUBSTRING(powerYield, 0, CHARINDEX(',', powerYield)) AS BIGINT) AS TotalPowerYield,
    CAST(SUBSTRING(powerYield, CHARINDEX(',', powerYield) + 1, LEN(powerYield) - CHARINDEX(',', powerYield)) AS BIGINT) AS TotalRunningTime,

    CAST(temperature AS BIGINT)*0.1 AS Temperature,

    CAST(SUBSTRING(mpptVoltage, 0, CHARINDEX(',', mpptVoltage)) AS BIGINT)*0.1 AS mppt1Voltage,
    CAST(SUBSTRING(mpptVoltage, CHARINDEX(',', mpptVoltage) + 1, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) - CHARINDEX(',', mpptVoltage) - 1) AS BIGINT)*0.1 AS mppt1Current,
    CAST(SUBSTRING(mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) + 1, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) + 1) - CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) - 1) AS BIGINT)*0.1 AS mpp2Voltage,
    CAST(SUBSTRING(mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) + 1) + 1, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) + 1) + 1) - CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) + 1) - 1) AS BIGINT)*0.1 AS mppt2Current,
    CAST(SUBSTRING(mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) + 1) + 1) + 1, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) + 1) + 1) + 1) - CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) + 1) + 1) - 1) AS BIGINT)*0.1 AS mppt3Voltage,
    CAST(SUBSTRING(mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) + 1) + 1) + 1) + 1, LEN(mpptVoltage) - CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage, CHARINDEX(',', mpptVoltage) + 1) + 1) + 1) + 1) AS BIGINT)*0.1 AS mppt3Current,

    CAST(totalDCPower AS BIGINT)*0.1 AS TotalDCPower,

    CAST(KWH AS BIGINT)*0.1 AS KWH,

    CAST(powerFactor AS BIGINT)*0.001 AS PowerFactor,

    CAST(SUBSTRING(mppt45, 0, CHARINDEX(',', mppt45)) AS BIGINT)*1 AS mppt45_1,
    CAST(SUBSTRING(mppt45, CHARINDEX(',', mppt45) + 1, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) - CHARINDEX(',', mppt45) - 1) AS BIGINT)*1 AS mppt45_2,
    CAST(SUBSTRING(mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) + 1, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) + 1) - CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) - 1) AS BIGINT)*1 AS mppt45_3,
    CAST(SUBSTRING(mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) + 1) + 1, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) + 1) + 1) - CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) + 1) - 1) AS BIGINT)*1 AS mppt45_4,
    CAST(SUBSTRING(mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) + 1) + 1) + 1, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) + 1) + 1) + 1) - CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) + 1) + 1) - 1) AS BIGINT)*1 AS mppt45_5,
    CAST(SUBSTRING(mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) + 1) + 1) + 1) + 1, LEN(mppt45) - CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45, CHARINDEX(',', mppt45) + 1) + 1) + 1) + 1) AS BIGINT)*1 AS mppt45_6,

    CAST(gridFrequency AS BIGINT)*0.01 AS GridFrequency

INTO
    [deviceElementInfo]
FROM
    inverterInfo
--CROSS APPLY GetArrayElements(solarinverter) AS solar


-- Meter data inserting into meterInfo table

SELECT
    CONCAT(ParseMeter.ConnectionDeviceGenerationId, '_' , DATEDIFF(millisecond, '1970-01-01', System.Timestamp)*1000, '_' ,meter.ArrayIndex) AS messageId,
    ParseMeter.PartitionId AS PartitionId,
    ParseMeter.deviceName AS deviceName,
    meter.arrayValue.timestamp AS timestamp,
    meter.arrayValue.date AS date,
    meter.arrayValue.bdate AS bdate,
    meter.arrayValue.size AS size,
    meter.arrayValue.name AS name,
    meter.arrayValue.data AS data
INTO
    meterInfo
FROM
    ParseMeter
CROSS APPLY GetArrayElements(solarMeter) AS meter

/*

SELECT
    System.timestamp as windowend,
    i.temperature AS temperature
INTO
    powerbioutput
FROM
    input i
*/

SELECT
    System.timestamp as windowend,
    inverterInfo.messageId AS messageId,
    inverterInfo.PartitionId AS PartitionId,
    inverterInfo.deviceName AS deviceName
INTO
    solarpowerbioutput
FROM
    inverterInfo
*/

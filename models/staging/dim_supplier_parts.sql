{{ config(materialized='table') }}

WITH supplier_parts AS (
SELECT * 
FROM {{ref('stg_supplier')}} s
JOIN {{ref('stg_partsupp')}} ps
ON  s.suppkey=ps.suppkey
JOIN snowflake_sample_data.tpch_sf1.part
ON ps.PARTKEY=p_partkey
)

SELECT
NAME AS supplier_name,
ADDRESS AS nation_key,
NATIONKEY AS account_balance,
AVAILQTY AS available_quantity,
SUPPLYCOST AS supply_cost,
PARTKEY AS part_key,
p_name AS part_name,
p_mfgr AS part_manufacturer,
p_brand AS part_brand,
p_type AS part_type,
p_size AS part_size,
p_container AS part_container,
p_retailprice AS part_retail_price
FROM supplier_parts

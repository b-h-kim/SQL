## DESCRIPTION:
Given a database of first and last IPv4 addresses, calculate the number of addresses between them (including the first one, excluding the last one).

Input
---------------------------------
|     Table    | Column | Type  |
|--------------+--------+-------|
| ip_addresses | id     | int   |
|              | first  | text  |
|              | last   | text  |
---------------------------------
Output
-------------------------
|   Column    |  Type   |
|-------------+---------|
| id          | int     |
| ips_between | bigint  |
-------------------------
All inputs will be valid IPv4 addresses in the form of strings. The last address will always be greater than the first one.

Examples
* With input "10.0.0.0", "10.0.0.50"  => return   50 
* With input "10.0.0.0", "10.0.1.0"   => return  256 
* With input "20.0.0.10", "20.0.1.0"  => return  246

WITH ip_splited AS
  (
  SELECT  id
          ,(SPLIT_PART(last, '.', 1)::INT - SPLIT_PART(first, '.', 1)::INT)*256^3 AS diff_1
          ,(SPLIT_PART(last, '.', 2)::INT - SPLIT_PART(first, '.', 2)::INT)*256^2 AS diff_2
          ,(SPLIT_PART(last, '.', 3)::INT - SPLIT_PART(first, '.', 3)::INT)*256^1 AS diff_3
          ,SPLIT_PART(last, '.', 4)::INT - SPLIT_PART(first, '.', 4)::INT AS diff_4
  FROM    ip_addresses
  )

SELECT  id
        ,(diff_1 + diff_2 + diff_3 + diff_4)::INT AS ips_between 
FROM    ip_splited

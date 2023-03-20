SELECT  air.air_phone_number
       ,air.air_telp_type
       ,air.air_usage_ser_type
       ,air.air_subscriberkey
       ,nvl(SUM(air.air_amount),0)
       ,nvl(SUM(nvl(mer.loan_poundage,0)),0)
FROM u_cbs_vou air
LEFT OUTER JOIN $m1$ mer
ON air.air_amount = mer.loan_amount
WHERE air.air_usageservicetype = '1700'
AND air.air_accounttype1 IN ('2000', '2200')
AND air.air_telp_type = 'Prepaid'
AND air.air_file_name not like 'f_%'
AND air.partition_col >= date_format($FROM, 'yyyy-MM-dd')
AND air.partition_col <= date_add($TO, 1)
AND air.air_time_stamp > date_format(concat(date_format($FROM, 'yyyy-MM-dd'), ' 00:40:59'), 'yyyy-MM-dd HH:mm:ss')
AND air.air_time_stamp <= date_format(concat(date_format(date_add($TO, 1), 'yyyy-MM-dd'), ' 00:40:59'), 'yyyy-MM-dd HH:mm:ss')
GROUP BY  air.air_phone_number
         ,air.air_telp_type
         ,air.air_usage_ser_type
         ,air.air_subscriberkey
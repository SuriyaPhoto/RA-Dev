SELECT  COUNT(mer.sts_id)
       ,SUM(nvl(mer.msc_duration,0))
       ,CASE WHEN mer.msc_telp_type = 'P' THEN 'Prepaid'
             WHEN mer.msc_telp_type = 'T' THEN 'Postpaid'  ELSE 'UNKNOWN' END
       ,nvl(mer.msc_network_type,'MSC Ericsson')
       ,CASE WHEN mer.msc_recordtype = 'CF' THEN 'CFW'
             WHEN mer.msc_recordtype = 'Transit' THEN 'MOC'  ELSE mer.msc_recordtype END
       ,mer.msc_caller_number
       ,CASE WHEN substr(mer.msc_called_number,1,4) = '+660' THEN concat('+66',substr(mer.msc_called_number,5))  ELSE mer.msc_called_number END
       ,upper(mer.msc_called_category)
       ,MIN(mer.msc_start_dttm)
FROM QM 00: MSC LDC Measure_V1.1 Results mer
WHERE mer.msc_called_category is null or mer.msc_add_routing_category = 0
GROUP BY  CASE WHEN mer.msc_telp_type = 'P' THEN 'Prepaid'
             WHEN mer.msc_telp_type = 'T' THEN 'Postpaid'  ELSE 'UNKNOWN' END
         ,nvl(mer.msc_network_type,'MSC Ericsson')
         ,CASE WHEN mer.msc_recordtype = 'CF' THEN 'CFW'
             WHEN mer.msc_recordtype = 'Transit' THEN 'MOC'  ELSE mer.msc_recordtype END
         ,mer.msc_caller_number
         ,CASE WHEN substr(mer.msc_called_number,1,4) = '+660' THEN concat('+66',substr(mer.msc_called_number,5))  ELSE mer.msc_called_number END
         ,upper(mer.msc_called_category)
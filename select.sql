SELECT  COALESCE(mer.msc_telp_type,mer_2.msc_telp_type,mer_3.msc_telp_type)
       ,COALESCE(mer.msc_network_type,mer_2.msc_network_type,mer_3.msc_network_type)
       ,COALESCE(mer.msc_recordtype,mer_2.msc_recordtype,mer_3.msc_recordtype)
       ,COALESCE(mer.msc_caller_number,mer_2.msc_caller_number,mer_3.msc_caller_number)
       ,COALESCE(mer.msc_called_number,mer_2.msc_called_number,mer_3.msc_called_number)
       ,COALESCE(mer.msc_called_category,mer_2.msc_called_category,mer_3.msc_called_category)
       ,COALESCE(mer.sts_id,mer_2.sts_id,mer_3.sts_id)
       ,COALESCE(mer.msc_duration,mer_2.msc_duration,mer_3.msc_duration)
       ,COALESCE(mer.msc_start_dttm,mer_2.msc_start_dttm,mer_3.msc_start_dttm)
       ,COALESCE(mer.msc_receive_time,mer_2.msc_receive_time,mer_3.msc_receive_time)
       ,COALESCE(mer.partition_col_msc,mer_2.partition_col_msc,mer_3.partition_col_msc)
       ,COALESCE(mer.msc_part_key,mer_2.msc_part_key,mer_3.msc_part_key)
       ,COALESCE(mer.msc_imsi_number,mer_2.msc_imsi_number,mer_3.msc_imsi_number)
       ,COALESCE(mer.msc_event_type,mer_2.msc_event_type,mer_3.msc_event_type)
       ,COALESCE(mer.msc_log_rsn,mer_2.msc_log_rsn,mer_3.msc_log_rsn)
       ,COALESCE(mer.msc_sms_type,mer_2.msc_sms_type,mer_3.msc_sms_type)
       ,COALESCE(mer.msc_add_routing_category,mer_2.msc_add_routing_category,mer_3.msc_add_routing_category)
FROM SQL00: MSC LDC Measure_01_V1.1 Results mer
FULL OUTER JOIN SQL00: MSC LDC Measure_00_V1.1 Results mer_2
       ON mer.partition_col_msc = mer_2.partition_col_msc 
       AND mer.msc_telp_type = mer_2.msc_telp_type 
       AND mer.msc_network_type = mer_2.msc_network_type 
       AND mer.msc_recordtype = mer_2.msc_recordtype 
       AND mer.msc_caller_number = mer_2.msc_caller_number 
       AND mer.msc_called_number = mer_2.msc_called_number 
       AND mer.msc_called_category = mer_2.msc_called_category 
       AND mer.msc_start_dttm = mer_2.msc_start_dttm
FULL OUTER JOIN SQL00: MSC LDC Measure_02_V1.1 Results mer_3
       ON mer.partition_col_msc = mer_3.partition_col_msc 
       AND mer.msc_telp_type = mer_3.msc_telp_type 
       AND mer.msc_network_type = mer_3.msc_network_type 
       AND mer.msc_recordtype = mer_3.msc_recordtype 
       AND mer.msc_caller_number = mer_3.msc_caller_number 
       AND mer.msc_called_number = mer_3.msc_called_number 
       AND mer.msc_called_category = mer_3.msc_called_category 
       AND mer.msc_start_dttm = mer_3.msc_start_dttm
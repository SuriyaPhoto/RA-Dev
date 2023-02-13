SELECT  msc_telp_type
        ,msc_network_type
        ,msc_recordtype
        ,CASE WHEN substr(msc_caller_number,1,1) <> '+' 
                THEN concat('+',msc_caller_number)  ELSE msc_caller_number END
        ,msc_called_number
        ,msc_add_routing_category
        ,msc_called_category
        ,sts_id
        ,CASE WHEN msc_sms_type IN ('compositeCallDataRecord|MO','compositeCallDataRecord|CFW') 
                THEN msc_derived_duration  ELSE msc_duration END
        ,msc_start_dttm
        ,msc_receive_time
        ,cast (partition_col AS TIMESTAMP)
        ,msc_part_key
        ,msc_imsi_number
        ,msc_event_type
        ,msc_dup_fl
        ,msc_log_rsn
        ,msc_sms_type
       	,partition_col
       	, date(partition_col)
FROM u_msc
where 
date(partition_col ) >  date( '2021-01-01')
AND upper(msc_event_type) = 'VOICE' 
limit 100
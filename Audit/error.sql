
SELECT  msc_telp_type
        ,msc_network_type
        ,msc_recordtype
        ,CASE WHEN substr(msc_caller_number,1,1) <> '+' THEN concat('+',msc_caller_number)  ELSE msc_caller_number END
        ,msc_called_number
        ,msc_add_routing_category
        ,msc_called_category
        ,sts_id
        ,CASE WHEN msc_sms_type IN ('compositeCallDataRecord|MO','compositeCallDataRecord|CFW') THEN msc_derived_duration  ELSE msc_duration END
        ,msc_start_dttm
        ,msc_receive_time
        ,cast (partition_col AS TIMESTAMP)
        ,msc_part_key
        ,msc_imsi_number
        ,msc_event_type
        ,msc_dup_fl
        ,msc_log_rsn
        ,msc_sms_type
FROM u_msc
WHERE partition_col >= date_format('2023-02-01 00:00:00', 'yyyy-MM-dd')
    AND partition_col <= date_format('2023-02-14 23:59:59', 'yyyy-MM-dd')
    AND ((msc_called_numb_ton <> '56801111' 
        AND msc_called_numb_ton <> '57801111' 
        AND msc_called_numb_ton <> 'B56801111' 
        AND msc_called_numb_ton <> 'B57801111' 
        AND msc_called_numb_ton is not null ) 
        or msc_called_numb_ton is null )
    AND ((msc_derived_duration is null 
            or msc_derived_duration > 0) 
        AND (substr(msc_other_party_number, 1, 4) <> '+191' 
        AND substr(msc_other_party_number, 1, 5) <> '+B100' 
        AND substr(msc_other_party_number, 1, 5) <> '+1155' 
        AND substr(msc_other_party_number, 1, 5) <> '+1193' 
        AND substr(msc_other_party_number, 1, 5) <> '+1195' 
        AND substr(msc_other_party_number, 1, 5) <> '+1644' 
        AND substr(msc_other_party_number, 1, 5) <> '+1669' 
        AND substr(msc_other_party_number, 1, 5) <> '+1677' 
        AND substr(msc_other_party_number, 1, 5) <> '+B777' 
        AND substr(msc_other_party_number, 1, 6) <> '+B2100' 
        AND substr(msc_other_party_number, 1, 6) <> '+B7103' 
        AND substr(msc_other_party_number, 1, 6) <> '+B7555' 
        AND substr(msc_other_party_number, 1, 6) <> '+B7561' 
        AND substr(msc_other_party_number, 1, 6) <> '+B1000' 
        AND substr(msc_other_party_number, 1, 6) <> '+B1808' 
        AND substr(msc_other_party_number, 1, 6) <> '+B1001' 
        AND substr(msc_other_party_number, 1, 6) <> '+B1008' 
        AND substr(msc_other_party_number, 1, 6) <> '+B1010' 
        AND substr(msc_other_party_number, 1, 6) <> '+B1013' 
        AND substr(msc_other_party_number, 1, 6) <> '+B1003' 
        AND substr(msc_other_party_number, 1, 6) <> '+B1014' 
        AND substr(msc_other_party_number, 1, 6) <> '+B1016' 
        AND substr(msc_other_party_number, 1, 6) <> '+B1020' 
        AND substr(msc_other_party_number, 1, 7) <> '+B10251' 
        AND substr(msc_other_party_number, 1, 7) <> '+B10252' 
        AND substr(msc_other_party_number, 1, 7) <> '+B10253' 
        AND substr(msc_other_party_number, 1, 7) <> '+B10254' 
        AND substr(msc_other_party_number, 1, 7) <> '+B10261' 
        AND substr(msc_other_party_number, 1, 7) <> '+B10269' 
        AND substr(msc_other_party_number, 1, 8) <> '+6611802' 
        AND substr(msc_other_party_number, 1, 8) <> '+6611805' 
        AND substr(msc_other_party_number, 1, 5) <> '+B121' 
        AND msc_other_party_number <> '+66811802' 
        AND msc_other_party_number <> '+66811805') 
        AND (msc_imsi_number not like '5200530%' 
        or msc_imsi_number is null) 
        AND upper(msc_recordtype) <> 'MTC' 
        AND upper(msc_event_type) = 'VOICE' 
        AND msc_incoming_trunk_id not like 'SIVR%' 
        AND msc_dup_fl = 'N' 
        AND (msc_log_rsn like 'E3012%' 
            or msc_log_rsn like 'E3048%' 
            or (msc_log_rsn like 'E3004%' 
            AND (substr(msc_incoming_trunk_i
            SELECT  msc_telp_type
                ,msc_network_type
                ,msc_recordtype
                ,CASE WHEN substr(msc_caller_number,1,1) <> '+' 
                    THEN concat('+',msc_caller_number) 
                    ELSE msc_caller_number END
                ,msc_called_number
                ,msc_add_routing_category
                ,msc_called_category
                ,sts_id
                ,CASE WHEN msc_sms_type IN ('compositeCallDataRecord|MO','compositeCallDataRecord|CFW') 
                        THEN msc_derived_duration  
                        ELSE msc_duration END
                ,msc_start_dttm
                ,msc_receive_time
                ,cast (partition_col AS TIMESTAMP)
                ,msc_part_key
                ,msc_imsi_number
                ,msc_event_type
                ,msc_dup_fl
                ,msc_log_rsn
                ,msc_sms_type
            FROM u_msc
            WHERE partition_col >= date_format('2023-02-01 00:00:00', 'yyyy-MM-dd')
                AND partition_col <= date_format('2023-02-14 23:59:59', 'yyyy-MM-dd')
                AND ((msc_called_numb_ton <> '56801111' 
                AND msc_called_numb_ton <> '57801111' 
                AND msc_called_numb_ton <> 'B56801111' 
                AND msc_called_numb_ton <> 'B57801111' 
                AND msc_called_numb_ton is not null ) 
                or msc_called_numb_ton is null )
                AND ((msc_derived_duration is null 
                        or msc_derived_duration > 0) 
                    AND (substr(msc_other_party_number, 1, 4) <> '+191' 
                    AND substr(msc_other_party_number, 1, 5) <> '+B100' 
                    AND substr(msc_other_party_number, 1, 5) <> '+1155' 
                    AND substr(msc_other_party_number, 1, 5) <> '+1193' 
                    AND substr(msc_other_party_number, 1, 5) <> '+1195' 
                    AND substr(msc_other_party_number, 1, 5) <> '+1644' 
                    AND substr(msc_other_party_number, 1, 5) <> '+1669' 
                    AND substr(msc_other_party_number, 1, 5) <> '+1677' 
                    AND substr(msc_other_party_number, 1, 5) <> '+B777' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B2100' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B7103' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B7555' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B7561' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B1000' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B1808' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B1001' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B1008' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B1010' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B1013' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B1003' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B1014' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B1016' 
                    AND substr(msc_other_party_number, 1, 6) <> '+B1020' 
                    AND substr(msc_other_party_number, 1, 7) <> '+B10251' 
                    AND substr(msc_other_party_number, 1, 7) <> '+B10252' 
                    AND substr(msc_other_party_number, 1, 7) <> '+B10253' 
                    AND substr(msc_other_party_number, 1, 7) <> '+B10254' 
                    AND substr(msc_other_party_number, 1, 7) <> '+B10261' 
                    AND substr(msc_other_party_number, 1, 7) <> '+B10269' 
                    AND substr(msc_other_party_number, 1, 8) <> '+6611802' 
                    AND substr(msc_other_party_number, 1, 8) <> '+6611805' 
                    AND substr(msc_other_party_number, 1, 5) <> '+B121' 
                    AND msc_other_party_number <> '+66811802' 
                    AND msc_other_party_number <> '+66811805') 
                    AND (msc_imsi_number not like '5200530%' 
                        or msc_imsi_number is null) 
                    AND upper(msc_recordtype) <> 'MTC' 
                    AND upper(msc_event_type) = 'VOICE' 
                    AND msc_incoming_trunk_id not like 'SIVR%' 
                    AND msc_dup_fl = 'N' 
                    AND (msc_log_rsn like 'E3012%' 
                        or msc_log_rsn like 'E3048%' 
                        or (msc_log_rsn like 'E3004%' 
                            AND (substr(msc_incoming_trunk_id, 1, 1) = '0' 
                            or substr(msc_incoming_trunk_id, 1, 1) = '1'))))d, 1, 1) = '0' 
                or substr(msc_incoming_trunk_id, 1, 1) = '1'))))
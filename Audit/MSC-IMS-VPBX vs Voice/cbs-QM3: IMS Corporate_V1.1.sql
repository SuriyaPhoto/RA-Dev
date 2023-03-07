SELECT  COUNT(ims.ims_id)
        ,SUM(nvl(ims.ims_duration,0))
        ,MIN(ims.ims_time_stamp)
        ,CASE WHEN ims.ims_telphone_type = 'P' THEN 'Prepaid'
                WHEN ims.ims_telphone_type = 'T' THEN 'Postpaid'  ELSE 'UNKNOWN' END
        ,nvl(ims.ims_network_type,'UNKNOWN')
        ,CASE WHEN ims.ims_rec_type_name = 'CF' THEN 'CFW'  ELSE ims.ims_rec_type_name END
        ,nvl(ims.ims_a_number,'UNKNOWN')
        ,nvl(ims.ims_b_number,'UNKNOWN')
        ,nvl(upper(ims.ims_in_call_ref_no),'UNKNOWN')
FROM u_ims ims , $m$ mig
WHERE ims.ims_dup_fl = N
    AND date_format(ims.partition_col, 'yyyy-MM-dd') >= date_format($FROM, 'yyyy-MM-dd')
    AND date_format(ims.partition_col, 'yyyy-MM-dd') <= date_format($TO, 'yyyy-MM-dd')
    AND substr(ims.ims_b_number,-(length(ims.ims_b_number)-1)) >= mig.range_from
    AND substr(ims.ims_b_number,-(length(ims.ims_b_number)-1)) <= mig.range_to
    AND ims.ims_time_stamp >= mig.apply_dttm
    AND ims.ims_service_type = 'Voice'
    AND ims.ims_rec_type_name IN ('MOC', 'CF')
    AND (ims.ims_b_number <> '56801111' 
    AND ims.ims_b_number <> '57801111' 
    AND ims.ims_b_number <> 'B56801111' 
    AND substr(ims.ims_b_number, 1, 4) <> '0A0A' 
    AND ims.ims_b_number <> 'B57801111')
    AND (ims.ims_duration > 0 or ims.ims_duration is null )
    AND ims.ims_imsi not like 5200530%
    AND (ims.ims_in_call_ref_no is null or ims.ims_in_call_ref_no = x)
    GROUP BY  CASE WHEN ims.ims_telphone_type = 'P' THEN 'Prepaid'
                WHEN ims.ims_telphone_type = 'T' THEN 'Postpaid'  ELSE 'UNKNOWN' END
            ,nvl(ims.ims_network_type,'UNKNOWN')
            ,CASE WHEN ims.ims_rec_type_name = 'CF' THEN 'CFW'  ELSE ims.ims_rec_type_name END
            ,nvl(ims.ims_a_number,'UNKNOWN')
            ,nvl(ims.ims_b_number,'UNKNOWN')
            ,nvl(upper(ims.ims_in_call_ref_no),'UNKNOWN')
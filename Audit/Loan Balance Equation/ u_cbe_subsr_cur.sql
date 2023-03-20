-- Previous
SELECT  cbe.cbe_usermainacct
       ,cbe.cbe_subscriber_key
       ,cbe.cbe_account_id
       ,concat('+',cbe.cbe_subscriber_code)
       ,cbe.cbe_apply_time
       ,cbe.cbe_expire_time
FROM u_cbe_subsr cbe, $m$ mig
WHERE cbe.partition_col >= date_format($FROM, 'yyyy-MM-dd')
AND cbe.partition_col <= date_format($TO, 'yyyy-MM-dd')
AND cbe.cbe_user_type = 0
AND cbe.cbe_record_type <> 'bl_subsr' 
OR ( cbe.cbe_subscriber_code >= mig.range_from 
    AND cbe.cbe_subscriber_code <= mig.range_to 
    AND cbe.cbe_apply_time <= mig.apply_dttm )
-- Current
SELECT  cbe.cbe_usermainacct
        ,cbe.cbe_subscriber_key
        ,cbe.cbe_account_id
        ,concat('+',cbe.cbe_subscriber_code)
        ,cbe.cbe_apply_time
        ,to_utc_timestamp('2037-01-01 00:00:00','UTC')
FROM u_cbe_subsr cbe, $m$ mig
WHERE cbe.partition_col >= date_add($FROM, 1)
    AND cbe.partition_col <= date_add($TO, 1)
    AND cbe.cbe_user_type = 0
    AND cbe.cbe_record_type <> 'bl_subsr'
    OR ( cbe.cbe_subscriber_code >= mig.range_from 
        AND cbe.cbe_subscriber_code <= mig.range_to 
        AND cbe.cbe_apply_time <= mig.apply_dttm )




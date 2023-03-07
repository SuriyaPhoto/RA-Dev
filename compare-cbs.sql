SELECT  cbe.cbe_usermainacct
       ,cbe.cbe_subscriber_key
       ,cbe.cbe_account_id
       ,concat('+',cbe.cbe_subscriber_code)
       ,cbe.cbe_apply_time
       ,cbe.cbe_expire_time
FROM u_cbe_subsr cbe
WHERE cbe.partition_col >= date_format($FROM, 'yyyy-MM-dd')
AND cbe.partition_col <= date_format($TO, 'yyyy-MM-dd')
AND cbe.cbe_user_type = 0
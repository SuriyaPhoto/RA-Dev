-- //TODO: cast(cli.loan_subscriberkey AS varchar(255)) >= mig.range_from
SELECT  cast(cli.loan_subscriberkey AS varchar(255))
        ,cli.loan_apply_time
        ,cli.loan_expire_time
        ,cast(cli.loan_amount        AS decimal(20,6))*100
        ,cast(cli.loan_poundage      AS decimal(20,6))*100
FROM u_cbs_loan_info cli , $m$ mig
WHERE cli.partition_col >= date_add($FROM, 1)
AND cli.partition_col <= date_add($TO, 1)
AND (cli.loan_amount > 0 or cli.loan_poundage > 0)
AND loan_record_type = 'bl_cdr'
AND ( cast(cli.loan_subscriberkey AS varchar(255)) >= mig.range_from 
AND cast(cli.loan_subscriberkey AS varchar(255)) <= mig.range_to 
AND cli.loan_file_datetime >= mig.apply_dttm )

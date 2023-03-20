SELECT  cast(cli.loan_subscriberkey AS varchar(255))
        ,cli.loan_apply_time
        ,cli.loan_expire_time
        ,cast(cli.loan_amount        AS decimal(20,6))*100
        ,cast(cli.loan_poundage      AS decimal(20,6))*100
FROM u_cbs_loan_info cli
    left outer join $m$ ora 
    on cast(cli.loan_subscriberkey AS varchar(255)) = ora.loan_subscriberkey
WHERE cli.partition_col >= date_add($FROM, 1)
AND cli.partition_col <= date_add($TO, 1)
AND (cli.loan_amount > 0 or cli.loan_poundage > 0)
AND loan_record_type <> 'bl_cdr'
AND ora.loan_subscriberkey is not null
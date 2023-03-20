-- //TODO: cast(cli.loan_subscriberkey AS varchar(255)) >= mig.range_from 



SELECT  cast(cli.loan_subscriberkey AS varchar(255))
       ,cli.loan_apply_time
       ,cli.loan_expire_time
       ,cast(cli.loan_amount        AS decimal(20,6))*100
       ,cast(cli.loan_poundage      AS decimal(20,6))*100
FROM u_cbs_loan_info cli , $m$ mig
WHERE cli.partition_col >= date_add($FROM, 1)
    AND cli.partition_col <= date_add($TO, 1)
    AND (cli.loan_amount > 0 
        OR cli.loan_poundage > 0 )
    AND cli.loan_record_type = 'bl_cdr'
    AND ( cast(cli.loan_subscriberkey AS varchar(255)) >= mig.range_from 
        AND cast(cli.loan_subscriberkey AS varchar(255)) <= mig.range_to 
        AND cli.loan_file_datetime >= mig.apply_dttm )

'23/01525',
'23/01541',
'23/01636',
'23/01727',
'23/01732',
'23/01735',
'23/01753',
'23/01840',
'23/01878',
'23/01916',
'23/01931',
'23/01935',
'23/02229',
'23/02236',
'23/02247',
'23/02332',
'23/02344',
SELECT  air.cbs_accountid
       ,air.cbs_subs_numb
       ,air.cbs_usageservicetype
       ,air.cbs_accountkey
       ,nvl(SUM(cbs_returnamount / 10000),0)
       ,nvl(SUM((cbs_returnamount / 10000)-air.cbs_loanpondage),0)
       ,nvl(SUM(air.cbs_loanpondage),0)
FROM u_cbs_rtn aircli
    left outer join $m$ ora 
        on cast(cli.cbs_subs_numb AS varchar(255)) = ora.cbs_subs_numb
WHERE air.cbs_usageservicetype = '1650'
AND cbs_record_type <> 'cdr_return'
AND air.partition_col >= date_format($FROM, 'yyyy-MM-dd')
AND air.partition_col <= date_add($TO, 1)
AND air.cbs_timestamp > date_format(concat(date_format($FROM, 'yyyy-MM-dd'), ' 00:40:59'), 'yyyy-MM-dd HH:mm:ss')
AND air.cbs_timestamp <= date_format(concat(date_format(date_add($TO, 1), 'yyyy-MM-dd'), ' 00:40:59'), 'yyyy-MM-dd HH:mm:ss')
AND ora.cbs_subs_numb is null
GROUP BY  air.cbs_accountid
         ,air.cbs_subs_numb
         ,air.cbs_usageservicetype
         ,air.cbs_accountkey




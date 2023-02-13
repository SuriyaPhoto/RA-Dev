SELECT  COUNT(cbs.sts_id)
        ,SUM(nvl(cbs.cbs_md_durn,0))     
        ,cbs.cbs_start_dttm
        ,nvl(cbs.cbs_telp_type,'UNKNOWN')
        ,nvl(cbs.cbs_company_name,'UNKNOWN')
        ,CASE WHEN length(cbs_CALL_REF_NO) = 16 THEN 'VPBX'
                WHEN cbs_artm_type IN ( '1201','1202','1203','1204','1205','1206','1207','1208','1209','1210','1211','1212','1251','1252','1253','1254','1255','1256','1257','1258','1259','1260','1261','1262','1263','1264','1265','1266','1267' ) THEN 'IMS Huawei'  ELSE 'MSC Ericsson' END
        ,nvl(cbs.cbs_service_flow,'UNKNOWN')
        ,nvl(cbs.cbs_caller_number,'UNKNOWN')
        ,nvl(cbs.cbs_called_number,'UNKNOWN')
        ,nvl(upper(cbs.cbs_call_ref_no),'UNKNOWN')
        ,nvl(cbs.cbs_chargefromprepaid,0)
        ,nvl(cbs.cbs_chargefromprepaid,0)
        ,nvl(cbs.cbs_accounttype1,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype2,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype3,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype4,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype5,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype6,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype7,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype8,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype9,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype10,'UNKNOWN')
FROM u_cbs_voice cbs
WHERE cbs.cbs_orgt_swid <> '66942500064'
        AND (cbs.cbs_dup_fl = 'N' 
        AND cbs.cbs_outroamer = 'HOME' 
        AND cbs.cbs_service_flow <> 'MTC' 
        AND substr(cbs.cbs_call_ref_no, 1, 30) <> '000000000000000000000000000000'
        --  AND cbs.cbs_sourceserialno = '0'  -- ****
        AND length(cbs.cbs_call_ref_no) <> 32)
AND cbs_filename = 'PRE_Usage_VOICE_20230208_0000023.csv'
GROUP BY  cbs.cbs_start_dttm
        ,nvl(cbs.cbs_telp_type,'UNKNOWN')
        ,nvl(cbs.cbs_company_name,'UNKNOWN')
        ,CASE WHEN length(cbs_CALL_REF_NO) = 16 THEN 'VPBX'
        WHEN cbs_artm_type IN ( '1201','1202','1203','1204','1205','1206','1207','1208','1209','1210','1211','1212','1251','1252','1253','1254','1255','1256','1257','1258','1259','1260','1261','1262','1263','1264','1265','1266','1267' ) THEN 'IMS Huawei'  ELSE 'MSC Ericsson' END
        ,nvl(cbs.cbs_service_flow,'UNKNOWN')
        ,nvl(cbs.cbs_caller_number,'UNKNOWN')
        ,nvl(cbs.cbs_called_number,'UNKNOWN')
        ,nvl(upper(cbs.cbs_call_ref_no),'UNKNOWN')
        ,nvl(cbs.cbs_chargefromprepaid,0)
        ,nvl(cbs.cbs_chargefromprepaid,0)
        ,nvl(cbs.cbs_accounttype1,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype2,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype3,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype4,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype5,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype6,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype7,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype8,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype9,'UNKNOWN')
        ,nvl(cbs.cbs_accounttype10,'UNKNOWN')
LIMIT 100
select  
    ims.ims_dup_fl, 
    ims.ims_service_type, 
    ims.ims_rec_type_name, 
    ims.ims_b_number, 
    ims.ims_b_number, 
    ims.ims_b_number, 
    ims.ims_b_number, 
    ims.ims_b_number, 
    ims.ims_duration, 
    ims.ims_duration, 
    ims.ims_imsi, 
    ims.ims_in_call_ref_no, 
    ims.ims_in_call_ref_no, 
    ims.ims_telphone_type, 
    ims.ims_network_type, 
    ims.ims_rec_type_name, 
    -- count(ims.ims_id), 
    -- sum(nvl(ims.ims_duration,0)), 
    -- min(ims.ims_time_stamp), 
    -- case when ims.ims_telphone_type = 'P' then 'Prepaid' when ims.ims_telphone_type = 'T' then 'Postpaid' else 'UNKNOWN' end, 
    -- nvl(ims.ims_network_type,'UNKNOWN'), 
    -- case when ims.ims_rec_type_name = 'CF' then 'CFW' else ims.ims_rec_type_name end, 
    -- nvl(ims.ims_a_number,'UNKNOWN'), 
    -- nvl(ims.ims_b_number,'UNKNOWN'), 
    -- nvl(upper(ims.ims_in_call_ref_no),'UNKNOWN')
from    u_ims ims
where   ims.ims_dup_fl = 'N'
and     ims.ims_service_type = 'Voice'
and     ims.ims_rec_type_name in ('MOC','CF')
and     (ims.ims_b_number <> '56801111'
and     ims.ims_b_number <> '57801111'
and     ims.ims_b_number <> 'B56801111'
and     substr(ims.ims_b_number,1,4) <> '0A0A'
and     ims.ims_b_number <> 'B57801111')
and     (ims.ims_duration > 0
and     ims.ims_duration is null )
and     ims.ims_imsi not like '5200530%'
and     (ims.ims_in_call_ref_no is null 
and     ims.ims_in_call_ref_no = x)
group by case when ims.ims_telphone_type = 'P' then 'Prepaid' when ims.ims_telphone_type = 'T' then 'Postpaid' else 'UNKNOWN' end, 
        nvl(ims.ims_network_type,'UNKNOWN'), 
        case when ims.ims_rec_type_name = 'CF' then 'CFW' else ims.ims_rec_type_name end, 
        nvl(ims.ims_a_number,'UNKNOWN'), 
        nvl(ims.ims_b_number,'UNKNOWN'), 
        nvl(upper(ims.ims_in_call_ref_no),'UNKNOWN')
order by ims_stamp_date desc
limit 100

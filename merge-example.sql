select  telephone_type
       ,record_type
        ,network_type
        ,sum(msc_ims_vpbx_record_count)
        ,sum(msc_ims_vpbx_total_duration)
        ,sum(cbs_record_count)
        ,sum(cbs_total_duration)
        ,sum(missing_count_in_msc_ims_vpbx)
        ,sum(missing_dur_in_msc_ims_vpbx)
        ,sum(missing_count_in_cbs)
        ,sum(missing_dur_in_cbs)
        ,sum(mismatch_count)
        ,sum(mismatch_dur_s1_greater_s2)
        ,sum(mismatch_dur_s1_less_s2)
        ,sum(match_count)
        ,sum(match_duration)
        ,sum(match_duration)
        ,sum(per_missing)
from  (
select  telephone_type
        ,record_type
        ,network_type
        ,msc_ims_vpbx_record_count
        ,msc_ims_vpbx_total_duration
        ,cbs_record_count
        ,cbs_total_duration
        ,missing_count_in_msc_ims_vpbx
        ,missing_dur_in_msc_ims_vpbx
        ,missing_count_in_cbs
        ,missing_dur_in_cbs
        ,mismatch_count
        ,mismatch_dur_s1_greater_s2
        ,mismatch_dur_s1_less_s2
        ,match_count
        ,match_duration
        ,match_duration
        ,per_missing
from $t1$ 
union
select   telephone_type
        ,record_type
        ,network_type
        ,msc_ims_vpbx_record_count
        ,msc_ims_vpbx_total_duration
        ,cbs_record_count
        ,cbs_total_duration
        ,missing_count_in_msc_ims_vpbx
        ,missing_dur_in_msc_ims_vpbx
        ,missing_count_in_cbs
        ,missing_dur_in_cbs
        ,mismatch_count
        ,mismatch_dur_s1_greater_s2
        ,mismatch_dur_s1_less_s2
        ,match_count
        ,match_duration
        ,match_duration
        ,per_missing
from $t2$ 
)
group by telephone_type
        ,record_type
        ,network_type
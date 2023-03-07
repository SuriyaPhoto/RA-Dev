SELECT  channel_name
       ,partner_channel
       ,business_desc
       ,SUM(vms_record_count)
       ,SUM(vms_total_amount)
       ,SUM(cbs_vou_record_count)
       ,SUM(cbs_total_amount)
       ,SUM(missing_count_vms)
       ,SUM(missing_amount_vms)
       ,SUM(missing_count_cbs_vou)
       ,SUM(missing_amount_cbs_vou)
       ,SUM(sum_match_count)
       ,SUM(sum_match_amount)
       ,SUM(sum_mismatch_count)
       ,SUM(sum_mismatch_amt_vms_gt_cbs)
       ,SUM(sum_mismatch_amt_vms_less_cbs)
       ,(case WHEN SUM(cbs_vou_record_count) = 0 THEN 100000000 else ((nvl(SUM(missing_count_vms),0)+nvl(SUM(missing_count_cbs_vou),0))*1000000/nvl(SUM(cbs_vou_record_count),1))*100 end)
       ,(case WHEN SUM(cbs_vou_record_count) = 0 THEN 100000000 else (nvl(SUM(missing_count_vms),0)*1000000/nvl(SUM(cbs_vou_record_count),1))*100 end)
FROM
(
	SELECT  channel_name
	       ,partner_channel
	       ,business_desc
	       ,vms_record_count
	       ,vms_total_amount
	       ,cbs_vou_record_count
	       ,cbs_total_amount
	       ,missing_count_vms
	       ,missing_amount_vms
	       ,missing_count_cbs_vou
	       ,missing_amount_cbs_vou
	       ,sum_match_count
	       ,sum_match_amount
	       ,sum_mismatch_count
	       ,sum_mismatch_amt_vms_gt_cbs
	       ,sum_mismatch_amt_vms_less_cbs
	FROM $t1$
	UNION
	SELECT  channel_name
	       ,partner_channel
	       ,business_desc
	       ,vms_record_count
	       ,vms_total_amount
	       ,cbs_vou_record_count
	       ,cbs_total_amount
	       ,missing_count_vms
	       ,missing_amount_vms
	       ,missing_count_cbs_vou
	       ,missing_amount_cbs_vou
	       ,sum_match_count
	       ,sum_match_amount
	       ,sum_mismatch_count
	       ,sum_mismatch_amt_vms_gt_cbs
	       ,sum_mismatch_amt_vms_less_cbs
	FROM $t2$
)
GROUP BY  channel_name
         ,partner_channel
         ,business_desc
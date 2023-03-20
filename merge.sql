select  sum( tot_subs_have_loan),
        sum( tot_subs_have_loan_amount),
        sum( tot_subs_have_movement),
        sum( tot_movement_amount_vou),
        sum( tot_movement_amount_return),
        sum( open_amount),
        sum( open_fee),
        sum( total_loan_addition),
        sum( total_loan_addition_fee),
        sum( total_loan_deduction_amount),
        sum( total_loan_deduction_fee),
        sum( total_expected_amount),
        sum( total_expected_fee),
        sum( total_close_amount),
        sum( total_close_fee),
        sum( expired_close_amount),
        sum( expired_close_fee),
        sum( total_difference_amount),
        sum( total_difference_fee),
        sum( count_difference),
        sum( count_match),
        sum( count_sub_loan),
from  (
select  tot_subs_have_loan
        ,tot_subs_have_loan_amount
        ,tot_subs_have_movement
        ,tot_movement_amount_vou
        ,tot_movement_amount_return
        ,open_amount
        ,open_fee
        ,total_loan_addition
        ,total_loan_addition_fee
        ,total_loan_deduction_amount
        ,total_loan_deduction_fee
        ,total_expected_amount
        ,total_expected_fee
        ,total_close_amount
        ,total_close_fee
        ,expired_close_amount
        ,expired_close_fee
        ,total_difference_amount
        ,total_difference_fee
        ,count_difference
        ,count_match
        ,count_sub_loan
from $t1$ 
union
select   tot_subs_have_loan
        ,tot_subs_have_loan_amount
        ,tot_subs_have_movement
        ,tot_movement_amount_vou
        ,tot_movement_amount_return
        ,open_amount
        ,open_fee
        ,total_loan_addition
        ,total_loan_addition_fee
        ,total_loan_deduction_amount
        ,total_loan_deduction_fee
        ,total_expected_amount
        ,total_expected_fee
        ,total_close_amount
        ,total_close_fee
        ,expired_close_amount
        ,expired_close_fee
        ,total_difference_amount
        ,total_difference_fee
        ,count_difference
        ,count_match
        ,count_sub_loan
from $t2$ 
)
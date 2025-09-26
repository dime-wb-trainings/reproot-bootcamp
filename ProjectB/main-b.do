
    reproot , project("reproot-bootcamp-project-b") roots("code" /*data*/) prefix("rr_bc_b_")

    global code "${rr_bc_b_code}/code"
	global data "${rr_bc_b_data}/data"

    do "${code}/summary_stats.do"
    do "${code}/output_success.do"
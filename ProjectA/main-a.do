
    reproot , project("reproot-bootcamp-project-a") roots(" code") prefix("rr_bc_")

    global code "${rr_bc_code}/code"
	global data "${rr_bc_code}/code"
    
    do "${code}/summary_stats.do"
    do "${code}/output_success.do"
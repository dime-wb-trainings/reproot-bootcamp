
    * Find root globals for this project
    reproot , project("reproot-bootcamp-project-a") roots("code data") prefix("rr_bc_a_")
	
	* Prepare easier globals
	global code "${rr_bc_a_code}/code"
	global data "${rr_bc_a_data}/data"

	* Run code!

	noi do "${code}/summary_stats.do"
	noi do "${code}/output_success.do"

     
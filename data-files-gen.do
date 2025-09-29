* Find root globals for this project
reproot , project("reproot-bootcamp-project-a") roots("code") prefix("rr_bc_data_")

* Prepare easier globals
cd "${rr_bc_data_code}"
cd ..

global clone_root         "`c(pwd)'"
global zip_folder         "${clone_root}/zip-folder"
global zip_content_folder "${zip_folder}/reproot-bootcamp"

display "${zip_folder}"

* Delete all files and folders in this folder recursively
cap noi shell rd /s /q "${zip_folder}"
mkdir "${zip_folder}"
mkdir "${zip_content_folder}"


local projects "A B"

* Create the directory structure for each project
foreach project of local projects {
    
    local project_full  "Project`project'"
    local project_short "proj`project'"

	display "Creating directories for `project_full'"
    local project_root "${zip_content_folder}/`project_full'"

    **************************
    * Folders

    * Create project root and subdirectories
    display "Creating root directory: `project_root'"
    mkdir "`project_root'"

    foreach subfolder in data data/raw data/cleaned data/final {
        display "Creating subdirectory: `project_root'/`subfolder'"
        mkdir "`project_root'/`subfolder'"
    }

    **************************
    * Folders

    sysuse auto, clear
    foreach var of varlist _all {
        rename `var' `project_short'_`var'
    }
    summarize
    save "`project_root'/data/raw/`project_short'_mock.dta", replace
}

* Remove existing file
global zipfile "${zip_folder}/reproot-bootcamp.zip"
cap confirm file "${zipfile}"
if _rc == 0 {
	rm "${zipfile}"
}

// * Zip all contents of the zip_folder into a single zip file
// global paths_to_zip "${zip_folder}/*"

* 
noi shell powershell -Command "Compress-Archive -Path '${zip_content_folder}/*' -DestinationPath '${zipfile}' -Force"
display "Created zip file: ${zipfile}"
set search_path [list . ${search_path} /apps/design_kits/osu_stdcells_v2p7/synopsys/lib/ami05 "./src" "./db"]
set target_library osu05_stdcells.db
set link_library { * osu05_stdcells.db }
set acs_work_dir "."

# analyze all source files
set files [glob ../src/*.v]
analyze -format verilog $files


# elaborate
elaborate ${DESIGN} -architecture verilog -library DEFAULT
uniquify

# get constraints from constraints file
source ../syn/constraints_${DESIGN}.tcl

# check the design
check_design

# TODO: Uncomment this to optimize for area, otherwise will synthesize for speed
# set_max_area 0

# compile the design with medium settings
compile -exact_map

# get reports
redirect ../syn/reports/${DESIGN}_timing_report.rpt {report_timing -path full -delay max -nworst 5 -max_paths 5 -significant_digits 3 -sort_by group}
redirect ../syn/reports/${DESIGN}_area_report.rpt {report_area -hierarchy}
redirect ../syn/reports/${DESIGN}_cells_report.rpt {report_cell}


echo "Synthesis Complete"
echo "   use command 'exit' on dc_shell to exit design_compiler"

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

# fix assign statements left in structural file
set_fix_multiple_port_nets -all -buffer_constants

# check the design
check_design

# TODO: Uncomment this to optimize for area, otherwise will synthesize for speed
# set_max_area 0

# compile the design with medium settings
compile -map_effort medium -exact_map

# generate netlists
file mkdir ../syn/netlists/${DESIGN}
write -format verilog -hierarchy -output ../syn/netlists/${DESIGN}/${DESIGN}.v
write_sdc ../syn/netlists/${DESIGN}/${DESIGN}.sdc

rename_design ${DESIGN} ${DESIGN}_syn
write -format verilog -hierarchy -output ../syn/netlists/${DESIGN}/${DESIGN}_syn.v
write_sdf -version 1.0 ../syn/netlists/${DESIGN}/${DESIGN}_syn.sdf
rename_design ${DESIGN}_syn ${DESIGN}

# get reports
file mkdir ../syn/reports/${DESIGN}
redirect ../syn/reports/${DESIGN}/${DESIGN}_timing_report.rpt {report_timing -path full -delay max -nworst 5 -max_paths 5 -significant_digits 3 -sort_by group}
redirect ../syn/reports/${DESIGN}/${DESIGN}_area_report.rpt {report_area -hierarchy}
redirect ../syn/reports/${DESIGN}/${DESIGN}_cells_report.rpt {report_cell}
redirect ../syn/reports/${DESIGN}/${DESIGN}_design_report.rpt {report_design}
redirect ../syn/reports/${DESIGN}/${DESIGN}_hierarchy_report.rpt {report_hierarchy}
redirect ../syn/reports/${DESIGN}/${DESIGN}_ports_report.rpt {report_port -v}
redirect ../syn/reports/${DESIGN}/${DESIGN}_net_report.rpt {report_net}
redirect ../syn/reports/${DESIGN}/${DESIGN}_power_report.rpt {report_power -analysis_effort low}

echo "Synthesis Complete"
cmd_/home/manu/facultad/sdcomp/sdc_tp4/kenel-modules-main/hello_world/Module.symvers := sed 's/\.ko$$/\.o/' /home/manu/facultad/sdcomp/sdc_tp4/kenel-modules-main/hello_world/modules.order | scripts/mod/modpost -m -a  -o /home/manu/facultad/sdcomp/sdc_tp4/kenel-modules-main/hello_world/Module.symvers -e -i Module.symvers   -T -

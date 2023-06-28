# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "bitWidth" -parent ${Page_0}
  ipgui::add_param $IPINST -name "degree_of_parallelism" -parent ${Page_0}


}

proc update_PARAM_VALUE.bitWidth { PARAM_VALUE.bitWidth } {
	# Procedure called to update bitWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.bitWidth { PARAM_VALUE.bitWidth } {
	# Procedure called to validate bitWidth
	return true
}

proc update_PARAM_VALUE.degree_of_parallelism { PARAM_VALUE.degree_of_parallelism } {
	# Procedure called to update degree_of_parallelism when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.degree_of_parallelism { PARAM_VALUE.degree_of_parallelism } {
	# Procedure called to validate degree_of_parallelism
	return true
}


proc update_MODELPARAM_VALUE.bitWidth { MODELPARAM_VALUE.bitWidth PARAM_VALUE.bitWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.bitWidth}] ${MODELPARAM_VALUE.bitWidth}
}

proc update_MODELPARAM_VALUE.degree_of_parallelism { MODELPARAM_VALUE.degree_of_parallelism PARAM_VALUE.degree_of_parallelism } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.degree_of_parallelism}] ${MODELPARAM_VALUE.degree_of_parallelism}
}


# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "writeFile" -parent ${Page_0}
  ipgui::add_param $IPINST -name "writeWidth" -parent ${Page_0}


}

proc update_PARAM_VALUE.writeFile { PARAM_VALUE.writeFile } {
	# Procedure called to update writeFile when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.writeFile { PARAM_VALUE.writeFile } {
	# Procedure called to validate writeFile
	return true
}

proc update_PARAM_VALUE.writeWidth { PARAM_VALUE.writeWidth } {
	# Procedure called to update writeWidth when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.writeWidth { PARAM_VALUE.writeWidth } {
	# Procedure called to validate writeWidth
	return true
}


proc update_MODELPARAM_VALUE.writeWidth { MODELPARAM_VALUE.writeWidth PARAM_VALUE.writeWidth } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.writeWidth}] ${MODELPARAM_VALUE.writeWidth}
}

proc update_MODELPARAM_VALUE.writeFile { MODELPARAM_VALUE.writeFile PARAM_VALUE.writeFile } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.writeFile}] ${MODELPARAM_VALUE.writeFile}
}


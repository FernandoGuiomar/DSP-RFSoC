# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "degree_of_parallelism" -parent ${Page_0}
  ipgui::add_param $IPINST -name "freqSampling" -parent ${Page_0}
  ipgui::add_param $IPINST -name "freqSignal" -parent ${Page_0}
  ipgui::add_param $IPINST -name "inverseFreq" -parent ${Page_0}
  ipgui::add_param $IPINST -name "lookUpTableSize" -parent ${Page_0}


}

proc update_PARAM_VALUE.degree_of_parallelism { PARAM_VALUE.degree_of_parallelism } {
	# Procedure called to update degree_of_parallelism when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.degree_of_parallelism { PARAM_VALUE.degree_of_parallelism } {
	# Procedure called to validate degree_of_parallelism
	return true
}

proc update_PARAM_VALUE.freqSampling { PARAM_VALUE.freqSampling } {
	# Procedure called to update freqSampling when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.freqSampling { PARAM_VALUE.freqSampling } {
	# Procedure called to validate freqSampling
	return true
}

proc update_PARAM_VALUE.freqSignal { PARAM_VALUE.freqSignal } {
	# Procedure called to update freqSignal when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.freqSignal { PARAM_VALUE.freqSignal } {
	# Procedure called to validate freqSignal
	return true
}

proc update_PARAM_VALUE.inverseFreq { PARAM_VALUE.inverseFreq } {
	# Procedure called to update inverseFreq when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.inverseFreq { PARAM_VALUE.inverseFreq } {
	# Procedure called to validate inverseFreq
	return true
}

proc update_PARAM_VALUE.lookUpTableSize { PARAM_VALUE.lookUpTableSize } {
	# Procedure called to update lookUpTableSize when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.lookUpTableSize { PARAM_VALUE.lookUpTableSize } {
	# Procedure called to validate lookUpTableSize
	return true
}


proc update_MODELPARAM_VALUE.inverseFreq { MODELPARAM_VALUE.inverseFreq PARAM_VALUE.inverseFreq } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.inverseFreq}] ${MODELPARAM_VALUE.inverseFreq}
}

proc update_MODELPARAM_VALUE.degree_of_parallelism { MODELPARAM_VALUE.degree_of_parallelism PARAM_VALUE.degree_of_parallelism } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.degree_of_parallelism}] ${MODELPARAM_VALUE.degree_of_parallelism}
}

proc update_MODELPARAM_VALUE.lookUpTableSize { MODELPARAM_VALUE.lookUpTableSize PARAM_VALUE.lookUpTableSize } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.lookUpTableSize}] ${MODELPARAM_VALUE.lookUpTableSize}
}

proc update_MODELPARAM_VALUE.freqSignal { MODELPARAM_VALUE.freqSignal PARAM_VALUE.freqSignal } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.freqSignal}] ${MODELPARAM_VALUE.freqSignal}
}

proc update_MODELPARAM_VALUE.freqSampling { MODELPARAM_VALUE.freqSampling PARAM_VALUE.freqSampling } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.freqSampling}] ${MODELPARAM_VALUE.freqSampling}
}


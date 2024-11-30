extends Event
class_name Print
signal print
var method = "_on_print"

func wire():
	super.set_signal_method(print, method)

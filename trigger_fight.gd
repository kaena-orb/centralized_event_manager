extends Event
class_name TriggerFight
signal trigger_fight
var method = "_on_trigger_fight"
func wire():
	super.set_signal_method(trigger_fight, method)

extends Resource
class_name Event

var emitter : Node
var targets : Array[Node]
var registered : bool = false
var registerer : Node = null
@export var is_target : bool
@export var is_emitter : bool

@export var triggered : bool = false
var emitting_signal : Signal
var receiving_method : String

func register_emitter(entity : Entity):
	emitter = entity
	register_event()

func register_target(entity : Entity):
	targets.append(entity)
	register_event()

func wire():
	pass

func trigger():
	event_registry.trigger_event(self)

func register_event():
	wire()
	event_registry.register_event(self)
	registered = true

func set_signal_method(new_signal : Signal, new_method : String):
	emitting_signal = new_signal
	if registerer:
		receiving_method = new_method

extends Node
class_name EventRegistry

var registered_events : Array[Event]

func register_event(event : Event):
	if not event.registered:
		registered_events.append(event)

## Fires the event.
func trigger_event(event : Event):
	wire_signals(event)
	event.triggered = true
	event.emitting_signal.emit()

## Ensures every target has the emitter defined signal connected.
func wire_signals(event : Event):
	#event.connect_to_target()
	for target : Node in event.targets:
		var callable := Callable(target, event.receiving_method)
		if not event.emitting_signal.is_connected(callable):
			event.emitting_signal.connect(callable)

extends Node
class_name Entity

@export var events : Array[Event]

func _ready():
	register_events()

func _on_trigger_fight():
	print("Should trigger the fight on: ", name)

func _on_print():
	print("Just a test print")

func trigger_event():
	if has_events_left():
		get_next_event().trigger()

func _on_body_entered(_body):
	trigger_event()

func get_next_event():
	for event in events:
		if not event.triggered:
			return event
	return null

func has_events_left():
	return not events.filter(func(event): return not event.triggered).is_empty()

func register_events():
	for event in events:
		event.registerer = self
		if event.is_emitter: event.register_emitter(self)
		if event.is_target: event.register_target(self)

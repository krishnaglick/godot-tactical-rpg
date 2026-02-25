class_name TurnOrderService
extends RefCounted
## Service class for managing turn order based on unit speed stats

## Sorts units by speed stat in descending order (highest speed first)
##
## @param units: Array of TacticsPawn units to sort
## @return: A new array of units sorted by speed (highest to lowest)
func get_turn_order(units: Array) -> Array:
	var sorted_units: Array = units.duplicate()
	sorted_units.sort_custom(func(a: TacticsPawn, b: TacticsPawn) -> bool:
		return a.stats.speed > b.stats.speed
	)
	return sorted_units


## Gets the next unit in turn order
##
## @param units: Array of units in turn order
## @param current_index: The current index in the turn order
## @return: The index of the next unit, wrapping around if necessary
func get_next_turn_index(units: Array, current_index: int) -> int:
	if units.is_empty():
		return -1
	return (current_index + 1) % units.size()


## Calculates a unit's turn priority based on speed
##
## @param unit: The TacticsPawn to calculate priority for
## @return: The priority value (speed stat)
func get_unit_priority(unit: TacticsPawn) -> int:
	return unit.stats.speed

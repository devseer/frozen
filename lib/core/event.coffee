class Event
	bound: {}

	constructor: () ->
		@bound = { x: 0, y: 0 }

	update: () ->

	apply: (event) ->
		return false

	collision: (pos) ->
		return pos.x < 0 or pos.x > 31 or pos.y < 0 or pos.y > 31

	updateBound: (bound) ->
		@bound = bound

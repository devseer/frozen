class Mob
	arr: []

	constructor: () ->
		for i in [0..3]
			arr.push({})

	update: (core) ->
		core.event.apply(@arr[i]) for i in arr

	draw: (context) ->

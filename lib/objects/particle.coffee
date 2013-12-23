class Particle
	list: []

	constructor: (core) ->
	update: () ->
	draw: (context) ->
		for i in @list
			context.fillRect(0, 0, 16, 16)

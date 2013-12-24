class Mob
	arr: []
	image: {}

	constructor: (core) ->
		@image = core.tile.loadSpriteset('snowman')

		for i in [0..3]
			@arr.push({})

	update: (core) ->
		core.event.apply(@arr[i]) for i in @arr

	draw: (context) ->
		context.drawImage(@image, 0, 0)

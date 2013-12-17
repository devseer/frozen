class World
	size: {}
	arr: []

	constructor: (core) ->
		@size.height = 32
		@size.width = 32
		@prepare()

	prepare: () ->
		@arr = for i in [0...@size.height]
			for j in [0...@size.width]
				0

	generate: (perlin) ->
		@arr = for i in [0...@size.height]
			for j in [0...@size.width]
				perlin(i, j, 0)

	update: () ->

	draw: (context) ->
		for i in [0...@size.height]
			for j in [0...@size.width]
				context.fillStyle = 'rgb(255,255,255)'
				context.fillRect(i*16, j*16, 16, 16)

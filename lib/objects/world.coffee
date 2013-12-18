class World
	size: {}
	arr: []
	tileset: null

	constructor: (core) ->
		@size.height = 32
		@size.width = 32
		@prepare()
		@tileset = core.tile.loadTileset('iceworld')

	prepare: () ->
		@arr = for i in [0...@size.height]
			for j in [0...@size.width]
				0

		for i in [0..20]
			x = Math.floor(Math.random() * @size.width)
			y = Math.floor(Math.random() * @size.height)
			@arr[x][y] = 4

	update: () ->

	draw: (context) ->
		for i in [0...@size.height]
			for j in [0...@size.width]
				@drawTile(context, i, j)

	drawTile: (context, i, j) ->
		context.drawImage( \
			@tileset, \
			@arr[i][j] % @size.width * 16, \
			@arr[i][j] / @size.height * 16, \
			16, 16, \
			i * 16, j * 16, \
			16, 16)

class World
	tile: {}
	size: {}
	arr: []
	tileset: null
	viewport: {}
	offset: {}

	constructor: (core) ->
		@size.x = 32
		@size.y = 32
		@prepare()
		@tileset = core.tile.loadTileset('iceworld')
		@viewport = { width: core.tile.viewport.width, height: core.tile.viewport.height }
		@offset = { x: 0, y: 0}
		@tile = { width: core.tile.tile.width, height: core.tile.tile.height}

	prepare: () ->
		@arr = for i in [0...@size.x]
			for j in [0...@size.y]
				0

		for i in [0..20]
			x = Math.floor(Math.random() * @size.x)
			y = Math.floor(Math.random() * @size.y)
			@arr[x][y] = 4

	update: (core) ->
		@offset = core.tile.offset
		core.event.updateBound(@size)

	draw: (context) ->
		for i in [0...@viewport.width]
			for j in [0...@viewport.height]
				@drawTile(context, i, j, i + @offset.x, j + @offset.y)

	drawTile: (context, x, y, i, j) ->
		context.drawImage( \
			@tileset, \
			@arr[i][j] % @size.x * @tile.width, \
			@arr[i][j] / @size.y * @tile.height, \
			@tile.width, @tile.height, \
			x * @tile.width, y * @tile.height, \
			@tile.width, @tile.height)

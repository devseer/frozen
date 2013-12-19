class Player
	dimensions:{}
	drawpos: {}
	pos: {}
	dir:
		down: 0
		left: 1
		up: 2
		right: 3
	direction: 0
	state: 0
	frame: 0
	image: null

	constructor: (core) ->
		@drawpos =
			x: (core.tile.viewport.width >> 1) * core.tile.tile.width
			y: (core.tile.viewport.height >> 1) * core.tile.tile.height

		@dimensions =
			x: core.tile.tile.width
			y: core.tile.tile.height

		@pos = { x: 15, y: 15 }

		@state = 0
		@frame = 0
		@image = core.tile.loadTileset('iceworld')

	update: (core) ->
		if @setMove(core.input, i) for i of @dir
			if @move(core.event.collision)
				core.tile.updateOffset({x: @pos.x - 7, y: @pos.y - 7})

	setMove: (input, dir) ->
		if input.keys[input.direction[dir]]
			@direction = @dir[dir]
			return true
		return false

	move: (collision) ->
		next =
			x: @pos.x + \
			(if @direction == @dir.left then  1 else \
				if @direction == @dir.right then 1 else 0)
			y: @pos.y + \
			(if @direction == @dir.up then 1 else \
				if @direction == @dir.down then 1 else 0)
		
		if not collision(next)
			@pos = next

		return true

	draw: (context) ->
		context.drawImage( \
			@image, \
			256,256,\
			16,16, \
			@drawpos.x, @drawpos.y, \
			16,16,)

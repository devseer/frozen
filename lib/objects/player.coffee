class Player
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
	tile: {}
	image: null
	canMove: false
	canAttack: true

	constructor: (core) ->
		@drawpos =
			x: (core.tile.viewport.width >> 1) * core.tile.tile.width
			y: (core.tile.viewport.height >> 1) * core.tile.tile.height

		@tile =
			width: core.tile.tile.width
			height: core.tile.tile.height

		@pos = { x: 15, y: 15 }

		@state = 0
		@frame = 0
		@image = core.tile.loadTileset('iceworld')
		core.timers.addTimer(80, (@canMove) =>
			@canMove = true
			return true
		)

	update: (core) ->
		@updateAttack(core)
		@updateMove(core)

	updateAttack: (core) ->
		if @canAttack == true
			if @setAttack(core.input)
				core.generate.spawn(
					core.generate.type.particle,
					@pos, @direction
				)
				@canAttack = false
				core.timers.addTimer(1000, (@resetAttack) =>
					@canAttack = true
					return false
				)

	setAttack: (input) ->
		if input.keys[input.action.attack]
			console.log('attack')
			return true
		else
			return false

	updateMove: (core) ->
		if @canMove == true
			for i of @dir
				if @setMove(core.input, i)
					@canMove = false
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
			(if @direction == @dir.left then - 1 else \
				if @direction == @dir.right then 1 else 0)
			y: @pos.y + \
			(if @direction == @dir.up then - 1 else \
				if @direction == @dir.down then 1 else 0)
		
		if not collision(next)
			@pos = next

		return true

	draw: (context) ->
		context.drawImage( \
			@image, \
			16, 128,\
			@tile.width, @tile.height, \
			128 + @drawpos.x, @drawpos.y, \
			@tile.width, @tile.height,)

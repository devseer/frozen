class Mob
	arr: []
	image: {}
	offset: {}
	bound: {x: 32, y: 32}
	nextMove: false
	tileSize: {}

	constructor: (core) ->
		@image = core.tile.loadSpriteset('snowman')
		@tileSize = { width: core.tile.tile.width, height: core.tile.tile.height}
		for i in [0..3]
			@arr.push({
				hp: 5
				pos: {x: 0, y: 0}
			})
		core.timers.addTimer(200, (@nextMove) =>
			@nextMove = true
			return true
		)

	update: (core) ->
		@offset = core.tile.offset
		if @nextMove
			@nextMove = false
			for i of @arr
				@move(@arr[i])

	move: (mob) ->
		x = 1 - Math.floor(Math.random() * 2)
		y = 1 - Math.floor(Math.random() * 2)
		if @checkBound(x, y)
			mob.pos.x += x
			mob.pos.y += y

	checkBound: (x, y) ->
		return x >= 0 && x < @bound.x && y >= 0 && y < @bound.y

	checkVisible: (mob) ->
		return mob.pos.x >= @offset.x && mob.pos.x < @offset.x + @bound.x \
			&& mob.pos.y >= @offset.y && mob.pos.y < @offset.y + @bound.y

	draw: (context) ->
		for i of @arr
			if @checkVisible(@arr[i])
				context.drawImage( \
					@image, \
					0, 0, \
					@tileSize.width, @tileSize.height, \
					128 + @arr[i].pos.x * @tileSize.width, @arr[i].pos.y * @tileSize.height, \
					@tileSize.width, @tileSize.height
				)

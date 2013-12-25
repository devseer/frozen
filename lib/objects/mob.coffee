class Mob
	arr: []
	image: {}
	offset: {}
	bound: {x: 32, y: 32}
	nextMove: false

	constructor: (core) ->
		@image = core.tile.loadSpriteset('snowman')

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

		#core.event.apply(@arr[i]) for i in @arr

	move: (mob) ->
		x = 1 - Math.floor(Math.random() * 2)
		y = 1 - Math.floor(Math.random() * 2)
		if @checkBound(x, y)
			mob.pos.x += x
			mob.pos.y += y

	checkBound: (x, y) ->
		return x >= 0 && x < @bound.x && y >= 0 && y < @bound.y

	checkVisible: (mob) ->
		return mob.pos.x >= @offset.x && mob.pos.x < @offset.x + 32 \
			&& mob.pos.y >= @offset.y && mob.pos.y < @offset.y + 32

	draw: (context) ->
		for i of @arr
			if @checkVisible(@arr[i])
				context.drawImage( \
					@image, \
					0, 0, \
					16, 16, \
					128 + @arr[i].pos.x * 16, @arr[i].pos.y * 16, \
					16, 16
				)

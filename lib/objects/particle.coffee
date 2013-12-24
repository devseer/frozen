class Particle
	list: []
	snowball: {}
	nextFrame: false
	frame: 0

	constructor: (core) ->
		@snowball = core.tile.loadSpriteset('snowball')
		core.timers.addTimer(100, (@nextFrame) =>
			@nextFrame = true
			return true
		)

	update: () ->
		if @nextFrame
			@nextFrame = false
			if @frame < 3
				@frame++
			else
				@frame = 0

		for i in @list
			@updatePosition(@list[i])

	updatePosition: (particle) ->
		console.log(article.direction)

	addParticle: (type, pos, direction) ->
		list.push({
			type: type
			pos: {x: pos.x, y: pos.y}
			direction: direction
		})

	draw: (context) ->
		context.drawImage(@snowball, 16 * @frame, 0, 16, 16, 128, 0, 16, 16)

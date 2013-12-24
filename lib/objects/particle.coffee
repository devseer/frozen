class Particle
	list: []

	constructor: (core) ->

	update: () ->
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
		for i in @list
			context.fillRect(@list[i].pos.x, @list[i].pos.y, 16, 16)

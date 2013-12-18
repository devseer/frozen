class Player
	pos: {}
	dir:
		down: 0
		left: 1
		up: 2
		right: 3
	direction: 0
	state: 0
	frame: 0

	constuctor: (core) ->
		@pos = { x: 0, y: 0 }
		@state = 0
		@frame = 0

	update: (core) ->
		@setDirection(core.input, 'down')
		@setDirection(core.input, 'left')
		@setDirection(core.input, 'up')
		@setDirection(core.input, 'right')
		@move(core.event.collision)

	setDirection: (input, dir) ->
		if input.keys[input.direction[dir]]
			@direction = @dir[dir]

	move: (collision) ->
		next = @pos
		if not collision(next)
			@pos = next

	draw: (context) ->

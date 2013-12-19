class Objects
	list: []

	constructor: (core) ->
		@list = [
			new World(core),
			new Player(core),
			new Mob(core),
			new Item(core)
		]

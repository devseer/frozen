class Objects
	constructor: (core) ->
		@world = new World(core)
		@player = new Player(core)
		@mob = new Mob(core)
		@item = new Item(core)

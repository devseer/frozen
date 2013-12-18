class Core
	constructor: (canvas, bgm, sfx) ->
		@handle = new Handle(canvas, bgm, sfx)
		@timers = new Timers()
		@tile = new Tile()
		@input = new Input()
		@event = new Event()

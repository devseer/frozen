root = exports ? this

class Engine
	handle: {}
	core: {}
	objects: {}

	constructor: (canvas, bgm, sfx) ->
		@core.handle = new Handle(canvas, bgm, sfx)
		@core.timers = new Timers()

		@objects.player = new Player(@core)
		@objects.world = new World(@core)

		@main(this)

	update: () ->
		@core[i].update() for i of @core
		@objects[i].update() for i of @objects

	draw: () ->
		@core.handle.clear()
		@objects[i].draw(@core.handle.context) for i of @objects

	main: (c) ->
		c.update()
		c.draw()

		requestAnimationFrame(=> @main(c))

unless root.Game
	root.Game = Engine

root = exports ? this

class Engine
	handle: {}
	core: {}
	objects: {}

	constructor: (canvas, bgm, sfx) ->
		@core = new Core(canvas, bgm, sfx)
		@objects = new Objects(@core)
		@main(this)

	update: () ->
		@core[i].update() for i of @core
		@objects[i].update(@core) for i of @objects

	draw: () ->
		@core.handle.clear()
		@objects[i].draw(@core.handle.context) for i of @objects

	main: (c) ->
		c.update()
		c.draw()

		requestAnimationFrame(=> @main(c))

unless root.Game
	root.Game = Engine

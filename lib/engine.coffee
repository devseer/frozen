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
		i.update(@core) for i in @objects.list

	draw: () ->
		@core.handle.clear()
		i.draw(@core.handle.context) for i in @objects.list

	main: (c) ->
		c.update()
		c.draw()

		requestAnimationFrame(=> @main(c))

unless root.Game
	root.Game = Engine

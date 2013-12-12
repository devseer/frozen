class Handle
	constructor: (canvas, bgm, sfx) ->
		@canvas = document.getElementById(canvas)
		@context = @canvas.getContext('2d')
		@bgm = document.getElementById(bgm)
		@sfx = document.getElementById(sfx)

	update: () ->

	clear: () ->
		@context.fillStyle = 'rgb(0, 64, 0)'
		@context.fillRect(0, 0, @canvas.width, @canvas.height)

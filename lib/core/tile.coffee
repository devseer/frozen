class Tile
	tile: {}
	viewport: {}
	offset: {}

	source:
		iceworld: 'iceworld.png'

	constructor: () ->
		@tile = { width: 16, height: 16 }
		@viewport = { width: 15, height: 15 }
		@offset = { x: 0, y: 0 }

	updateOffset: (pos) ->
		@offset = pos

	update: () ->

	loadTileset: (name) ->
		img = new Image()
		img.src = 'img/tile/' + @source[name]

		return img

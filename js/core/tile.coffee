class Tile
	source:
		iceworld: 'iceworld.png'

	constructor: () ->

	update: () ->
	loadTileset: (name) ->
		img = new Image()
		img.src = 'img/tile/' + @source[name]

		return img

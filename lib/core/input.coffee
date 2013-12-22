class Input
	keys: []
	direction:
		up: 82
		down: 72
		left: 83
		right: 84

	action:
		attack: 32

	constructor: (handle) ->
		for i in [0..255]
			@keys.push(false)

		k = @keys
		document.onkeydown = (e) ->
			k[e.keyCode] = true

		document.onkeyup = (e) ->
			k[e.keyCode] = false

	update: () ->

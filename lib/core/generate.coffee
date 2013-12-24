class Generate
	type:
		particle: 'particle'
	objects: {}

	constructor: () ->

	spawn: (type, pos, direction) ->
		console.log('spawn ' + @type[type])

	update: (objects) ->
		@objecs = objects

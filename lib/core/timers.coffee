class Timers
	timestamp: 0
	list: []
	constructor: () ->
		@updateTime()

	update: () ->
		@updateTime()
		for i in @list
			if @list[i].time < @timestamp
				@executeTimer(@list[i])

	addTimer: (interval, repeat, callback) ->
		@list.push({
			interval: interval
			repeat: repeat
			callback: callback
		})

	executeTimer: (timer) ->
		if @list[i].repeat
			@renewTimer(@list[i])
		else
			@list[i].callback()

	renewTimer: (timer) ->
		timer.time = timer.interval + @timestamp

	updateTime: () ->
		@timestamp = new Date().getTime()

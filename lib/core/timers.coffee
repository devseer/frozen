class Timers
	timestamp: 0
	list: []
	constructor: () ->
		@updateTime()

	update: () ->
		@updateTime()
		for i of @list
			if @list[i].time < @timestamp
				@executeTimer(@list[i], i)

	addTimer: (interval, callback) ->
		@list.push({
			interval: interval
			time: @timestamp
			callback: callback
		})

	executeTimer: (timer, index) ->
		if timer.callback()
			@renewTimer(timer)
		else
			@list.splice(index, i)

	renewTimer: (timer) ->
		timer.time = timer.interval + @timestamp

	updateTime: () ->
		@timestamp = new Date().getTime()

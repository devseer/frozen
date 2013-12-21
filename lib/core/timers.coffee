class Timers
	timestamp: 0
	list: []
	constructor: () ->
		@updateTime()

	update: () ->
		@updateTime()
		for i in @list
			if @list[i].time < @timestamp
				@executeTimer(@list[i], i)

	addTimer: (interval, repeat, callback) ->
		@list.push({
			interval: interval
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

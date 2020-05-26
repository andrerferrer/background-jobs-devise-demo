## Goal
This is an app to teach how to implement background jobs in rails using the ClearBit enhancement API

## How to
### 1. Generate the job

`rails generate job steve` 

Will generate:

```ruby
class SteveJob < ApplicationJob
	# This represents how important this job is
	queue_as :default

	def perform
		# here we need to actually write the code
		puts "I'm starting the Steve job"
		sleep 3
		puts "Let's watch a video -> https://www.youtube.com/watch?v=s9E6XfJPAMM"
		sleep 3
		puts "Stay hungry; stay foolish!\nWe're good to go!"
	end
end
```

### 2. Call the job

Where?

* With a trigger:
	* In the model as a callback 

	* or in the controller when a given action happens.

* Scheduled:
	* In a rake task

## Troubleshooting
* After installing redis, remember that it must be running. If not, run `sudo service redis-server start`.
* If you have issues, running `redis-cli FLUSHALL` might to the charm.

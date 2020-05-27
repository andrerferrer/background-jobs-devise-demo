## Goal
This is an app to teach how to implement background jobs in rails using the ClearBit enhancement API and [Devise](https://github.com/heartcombo/devise#configuring-controllers)

## Disclaimer
This README assumes that you have implemented [this first](https://github.com/andrerferrer/background-jobs-demo)

## How to
### 1. [Expose Devise Controllers](https://github.com/heartcombo/devise#configuring-controllers)
e.g.
```shell 
rails generate devise:controllers registrations
```

### 2. Adjust your routes to use the newly exposed controller

You should already have

```ruby
# config/routes.rb
  devise_for :users
```

You need to add

```ruby
# config/routes.rb
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
```

### 3. Implement the Job on the right action in the Controllers
e.g.
```ruby
#app/controllers/users/registrations_controller.rb

  def create
    super do |resource|
      enhance_with_clearbit(resource)
    end
  end

  private

  def enhance_with_clearbit(user)
    EnhanceClearbitJob.perform_later(user.id)
  end
```

The above is going to call the EnhanceClearbitJob after the user signs up.

## Troubleshooting
* Remember that you must have `redis` and `sidekiq` running. If not, run `sudo service redis-server start` and `sidekiq`.
* If you have issues, running `redis-cli FLUSHALL` might to the charm.

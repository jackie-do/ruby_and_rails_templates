### Member Collection Routes
When you need to add more actions to a RESTful resource (do you really need them at all?) use member and collection routes. 

```ruby
# BAD
get 'subscriptions/:id/unsubscribe'
resources :subscriptions

# GOOD
resources :subscriptions do
  get 'unsubscribe', on: :member
end
```

```ruby
# BAD
get 'photos/search'
resources :photos
            

# GOOD
resources :photos do
  get 'search', on: :collection
end
```

### Many Member Collection Routes
If you need to define multiple member/collection routes use the alternative block syntax.

```ruby

resources :subscriptions do
  member do
    get 'unsubscribe'
    # more routes
  end
end

resources :photos do
  collection do
    get 'search'
    # more routes
  end
end
```

### Namespaced Routes
Use namespaced routes to group related actions.

```ruby
namespace :admin do
  # Directs /admin/groups/* to Admin::GroupsController
  # (app/controllers/admin/groups_controller.rb)
  resources :groups
end
```

### No Wild Routes
Never use the legacy wild controller route. This route will make all actions in every controller accessible via GET requests.

```ruby
# very bad
match ':controller(/:action(/:id(.:format)))'
```

### No Match Routes
Don’t use match to define any routes unless there is need to map multiple request types among `[:get, :post, :patch, :put, :delete]` to a single action using :via option.

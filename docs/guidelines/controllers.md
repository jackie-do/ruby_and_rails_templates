#### Skinny Controllers
Keep the controllers skinny - they should only retrieve data for the view layer and shouldn’t contain any business logic (all the business logic should naturally reside in the model).

#### One Method
Each controller action should (ideally) invoke only one method other than an initial find or new.

#### Shared Instance Variables
Minimize the number of instance variables passed between a controller and a view.

#### Lexically Scoped Action Filter
Controller actions specified in the option of Action Filter should be in lexical scope. The ActionFilter specified for an inherited action makes it difficult to understand the scope of its impact on that action. The impact action must be present in a the controller

#### Controllers: Rendering
#####  HTTP Status Code Symbols
Prefer [corresponding symbols](https://gist.github.com/mlanett/a31c340b132ddefa9cca) to numeric HTTP status codes. They are meaningful and do not look like "magic" numbers for less known HTTP status codes.

You can listed with `Rack::Utils::HTTP_STATUS_CODES`
```ruby
# bad
...
render status: 403
...

# good
...
render status: :forbidden
```

#####  Summary
There are lots of other cases where you have to be smart to find the right balance and know what should go where. Sometimes, logic you take out from a controller doesn’t fit into the context of any model. You have to figure out where would it fit the best.

- Controllers should only make simple queries to the model. Complex queries should be moved out to models and broken out in reusable scopes or to query objects. Controllers should mostly contain request handling and response related logic.
- Any code that is not request and response related and is directly related to a model should be moved out to that model.
- Any class which represents a data structure should go into the app/models directory as a Non-ActiveRecord model (table-less class).
- Use **PORO** (Plain Old Ruby Objects) Ruby classes when logic is of a specific domain (Printing, Library & etc.) and doesn’t really fit the context of a model (ActiveRecord or Non-ActiveRecord). You can put those classes in app/models/some_directory/. Anything inside the app/ directory is automatically loaded on app startup as it’s include in the Rails autoload path. POROs can also be placed in app/models/concerns & app/controllers/concerns directories.
- Place your **PORO**, Modules, or Classes in lib/ directory if they are application independent and can be used with other applications as well.
- Use modules if you have to extract out common functionality from otherwise unrelated functionality. You can place them in app/* directory and in lib/ directory if they are application independent.
- The “Service” layer is another really important place in supporting MVC when the application code is growing and it’s getting hard to decide where to put specific logic. Imagine you need to have a mechanism to send SMS or Email notifications to some client when a take appointment, or a push notification to their devices. You can create a Notification service in app/services/ and start service of your functionality.

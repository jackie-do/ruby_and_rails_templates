In order to organize as well as possible the code, its reading, its maintainability we will use various patterns such as :
- **Service Object**
- **Query Object**
- **Contract**
- **API wrapper**
- **Decorator**

### Service Object
Service is by far my most used design pattern in Rails applications. The idea of this design pattern is very easy - if certain part of business logic doesn’t really fit into model or controller, it may be good idea to put it into service.

You can then use your service in multiple places, like models, controllers, jobs etc, keeping you application clean and DRY.

Default Rails app structure doesn’t have folder where we can put our services. So we have to make one! Create services folder inside your app directory.

Now, when we have a place to store our servies, let’s define base service, so that we are sure every service uses the same interface to communicate with the rest of the application.


All services must be created with [dry transaction](https://github.com/dry-rb/dry-transaction), dry-transaction is a business transaction DSL.

It provides a simple way to define a complex business transaction that includes processing over many steps and by many different objects. It makes error handling a primary concern by taking a “[Railway Oriented Programming](http://fsharpforfunandprofit.com/rop/)” approach to capturing and returning errors from any step in the transaction.

A simple service with dry-transaction may look like this:
```ruby
require "dry/transaction"

class CreateUser
  include Dry::Transaction

  step :validate
  step :create

  private

  def validate(input)
    # returns Success(valid_data) or Failure(validation)
  end

  def create(input)
    # returns Success(user)
  end
end
```

### Contract
Contracts are used to validate data. Contracts will replace in our case the model validations and for each case of use we will have a specific validation contract.

Just like the services the contracts will be created using [dry-valiation](https://dry-rb.org/gems/dry-validation/master/) which incorporates `dry-schema` and `dry-types`.

dry-validation is a data validation library that provides a powerful DSL for defining schemas and validation rules. Validations are expressed through contract objects. A contract specifies a schema with basic type checks and any additional rules that should be applied.

Contract rules are applied only once the values they rely on have been succesfully verified by the schema.


Here's an example contract:
```ruby
class NewUserContract < Dry::Validation::Contract
  params do
    required(:email).filled(:string)
    required(:age).value(:integer)
  end

  rule(:email) do
    unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
      key.failure('has invalid format')
    end
  end

  rule(:age) do
    key.failure('must be greater than 18') if value <= 18
  end
end

contract = NewUserContract.new

contract.call(email: 'jane@doe.org', age: '17')
# #<Dry::Validation::Result{:email=>"jane@doe.org", :age=>17} errors={:age=>["must be greater than 18"]}>

```



### Query object
One should consider using query objects pattern when in need to perform complex querying on active record relation.

Usually one should avoid using scopes for such purpose. As a rule of thumb, if scope interacts with more than one column and/or joins in other tables, it should be moved to query object. Also whenever a chain of scopes is to be used, one should consider using query object too. Some more information on using query objects can be found in this article.

#### Assumptions and rules
- Query objects are always used by calling class-level `.call` method
- Query objects require `ActiveRecord::Relation` or `ActiveRecord::Base` as constructor argument
- Query objects have to implement `#query` method that returns `ActiveRecord::Relation`
- Query objects provide access to consecutive keyword arguments using `#options` hash



### API Wrapper
To learn more about this pattern please read this [article](https://www.nopio.com/blog/how-to-create-an-api-wrapper-of-an-external-service-in-rails/)



### Decorator
In OOP, decorator gives us ability to extend particular object’s behavior by equipping it with some additional methods. In Rails ecosystem I’ve usually seen this design pattern being used with [draper gem](https://github.com/drapergem/draper).

Draper is useful when we have methods in models, which are used only in views. Using decorator design pattern means putting in them every bit of logic which is used only in views. So, if in User model we have method full_name, e.g.
```ruby
def full_name
  "#{first_name} #{last_name}"
end
```

we should move it into **UserDecorator**.
```ruby
class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
```

Great thing is that not every user object in views will have that method, we have to decorate that object before sending it to the view, simply using user.decorate. So in controller we have to use:
```ruby
def show
  @user = User.find(params[:id]).decorate
end

# And then, we can use this code in our views or serializer:

<%= @user.full_name %>
```

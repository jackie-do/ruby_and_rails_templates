if you are familiar with Rails, then you know how much emphasis the Rails community puts on testing. I’ve heard people say that, as a newbie, testing makes it difficult to learn Rails.

Also, some say it makes sense to get on with the basics of Rails (or in some cases general web development) first.

But it doesn’t stop testing from being an absolute best practice in software development.

As a matter of fact, I’ve seen people complaining that it takes more time to complete a feature then it requires when you take the testing route.

But once they’ve hopped on testing Rails, and put up with the “hassle” of writing tests first, they actually started building features in no time.

Plus, it also covers so many of the edge cases that it drives out a much better design of our objects. A good Ruby developer is instinctively good at testing.


Let’s list some benefits of testing:

Tests acts as detailed specifications of a feature or application.
Tests acts as a documentation for other devs, which helps them understand your intent in an implementation.
Tests helps in catching and fixing bugs beforehand.
Tests gives you confidence when refactoring code or making performance enhancements that nothing is broken as a result.


All classes and modules must be covered by the tests and the elements to be tested are :

The controllers
The Requests
The models
The services
Validation contracts
The queries objects
The libs
Routing
Jobs and workers
Serializers or view
Mailers


The tests must cover all cases of use of the tested element in case of success and failure.

The test tool is Rspec and its use must respect the rules described in this guide (https://rspec.rubystyle.guide/), and you should stub all external services http requests with VCR.



The minimum coverage rate is 90%.

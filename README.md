# Programming Task

##### _Bella Leber Smeaton for Mantel Group Future Associates Program_

<br />

To parse a log file containing HTTP requests and to report on its contents. Include tests that demonstrate that the solution is working.

This parse will extract the following:

- The number of unique IP addresses
- The top 3 most visited URLs
- The top 3 most active IP addresses

## To run the the task:

```
$ node programming-task.js
```

## Testing:

_Gems to bundle in for RSpec_

> When building a new rails file, I override the built in testing framework to ensure RSpec can be bundled and used.

> For example: `rails new parks_api -d=postgresql -T`

> The 'T' denotes we're going to be adding our own testing framework, in particular, RSPEC.

**gem 'rspec-rails'**

- testing framework with more flexibility to create tests and work and minimise edge issues.

**gem 'factory_bot_rails'**

- using factories instead of fixtures for test data, which also makes it easier to handle. I would added a factory_bot.rb support file to spec > support folder to ensure it's method syntax are include in spec support.

**gem 'database_cleaner'**

- if the log was coming from a database I might also use database_cleaner as to clean up our database between tests, which can become an issue.

**gem 'shoulda-matchers'**

- it is a one liner matches for common rails tests. It also needs to be added and set up in a spec > support folder, like factory_bot to ensure it's method syntax are include in testing spec support.

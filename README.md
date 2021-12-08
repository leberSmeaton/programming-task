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

Testing is done with some code snippets and psuedocode.

_Gems to bundle in for RSpec_

> When building a new rails file, I override the built in testing framework to ensure RSpec can be bundled and used.

> For example: `rails new parks_api -d=postgresql -T`

> The 'T' denotes we're going to be adding our own testing framework, in particular, RSPEC.

**gem 'rspec-rails'**

- testing framework with more flexibility to create tests and work and minimise edge issues.
- A great testing gem as generates folders and files when creating models, which means we don't have to.

**gem 'factory_bot_rails'**

- Allows us to separate concerns and know if your tests are from different models, which also makes it easier to handle errors. I would added a factory_bot.rb support file to spec > support folder to ensure it's method syntax are include in spec support.
- We can also use factory bot to override data, kind of like a seeds data to show what data should look like input.
- Factory might define what a log file should look like. For example end of line 13 of the log file has the extra non log file string 'junk extra'. A factory test might pick this up with invalid if the factory has defined what a logfile should look like."

> A factory for a log file may look something like this...

`50.112.00.11 - admin [11/Jul/2018:17:33:01 +0200] "GET /asset.css HTTP/1.1" 200 3574 "-" "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1092.0 Safari/536.6"`

```
FactoryBot.define do
  factory :logfile do
    ip { "50.112.00.11" },
    logname { "- admin" },
    timestamp { "[11/Jul/2018:17:33:01 +0200]" },
    request { "GET /asset.css HTTP/1.1" },
    response { "200" },
    bytes { "3574" },
    referer { "-" },
    agent { "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1092.0 Safari/536.6" }
  end
end
```

**gem 'database_cleaner'**

- if the log was coming from a database I might also use database_cleaner as to clean up our database between tests, which can become an issue.
- In the database_cleaner.rb file I set up :suite, :each, and :all before and afters to get rid of clutter. We need to ensure to add our before :all and after:all confirguration for edge cases and as without data will persist across test suites.

**gem 'shoulda-matchers'**

- it is a one liner matches for common rails tests. It also needs to be added and set up in a spec > support folder, like factory_bot to ensure it's method syntax are include in testing spec support.

There are an additional updates and uncomments to the rails_helper.rb and spec_helper.rb required to help with running RSPEC. For example:

- uncommenting line 23 of the rails_helper.rb file ensures our spec and support folder and any files inside are required for testing purposes.

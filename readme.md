# Inquiries

![Refinery Inquiries](http://refinerycms.com/system/images/BAhbBlsHOgZmSSIqMjAxMS8wNS8wMS8wNF81MF8wMV81MDlfaW5xdWlyaWVzLnBuZwY6BkVU/inquiries.png)

## Customizations in this fork

**SORRY, we have not yet updated our sites using this gem to Refinery 2.1, so this fork is only up to date with 2-0-stable.**

All of these options can be easily found in the inquiries initializer, complete with examples:

* Add arbitrary custom inquiry fields (serialized to a single text field).
* Recaptcha gem support. (Optional, requires recatcha gem: https://github.com/ambethia/recaptcha)
* Add ability to configure extra_spam_words in initializer, instead of by monkey-patching Inquiry (which actually wouldn't work, because there is no way to intercept the filters_spam method call).

### Gem Installation

    gem 'refinerycms-inquiries', :github => 'tortus/refinerycms-inquiries', :branch => '2-0-stable'

Then type the following at command line inside your Refinery CMS application's root directory:

    bundle install

#### Installation on Refinery 2.0.0 or above.

To install the migrations, run:

    rails generate refinery:inquiries
    rake db:migrate
    
Add pages to the database and you're done:

    rake db:seed

## About

__Add a simple contact form to Refinery that notifies you and the customer when an inquiry is made.__

In summary you can:

* Collect and manage inquiries
* Specify who is notified when a new inquiry comes in
* Customise an auto responder email that is sent to the person making the inquiry

When inquiries come in, you and the customer are generally notified. As we implemented spam filtering through the [filters_spam plugin](https://github.com/resolve/filters_spam#readme) you will not get notified if an inquiry is marked as 'spam'.

## How do I get Notified?

Go into your 'Inquiries' tab in the Refinery admin area and click on "Update who gets notified"

## How do I Edit the Automatic Confirmation Email

Go into your 'Inquiries' tab in the Refinery admin area and click on "Edit confirmation email"

## Help! How do I send emails from no-reply@domain.com.au instead of no-reply@com.au?

Simply set the following in config/application.rb:

```ruby
config.action_dispatch.tld_length = 2
```

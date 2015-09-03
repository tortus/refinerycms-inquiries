# Inquiries

![Refinery Inquiries](http://refinerycms.com/system/images/BAhbBlsHOgZmSSIqMjAxMS8wNS8wMS8wNF81MF8wMV81MDlfaW5xdWlyaWVzLnBuZwY6BkVU/inquiries.png)

## Customizations in this fork

All of these options can be easily found in the inquiries initializer, complete with examples:

* Add arbitrary custom inquiry fields (serialized to a single text field).
* Recaptcha gem support. (Optional, requires recatcha gem: https://github.com/ambethia/recaptcha)
* Add ability to configure extra_spam_words in initializer, instead of by monkey-patching Inquiry (which actually wouldn't work, because there is no way to intercept the filters_spam method call).
# Add option to require form to be submitted via JavaScript, to make it harder for spam bots.
# Add option to add a "honey pot" field to the form that a spam bot won't be able to resist filling in.

```ruby
gem 'refinerycms-inquiries', '~> 3.0.0'
```

Then type the following at command line inside your Refinery CMS application's root directory:

    bundle install

#### Installation on Refinery 2.0.0 or above.

To install the migrations, run:

    rails generate refinery:inquiries
    rake db:migrate

Add pages to the database and you're done:

    rake db:seed

#### Optionally include the stylesheet.

Next, you can include the stylesheet that improves the form's display a bit,
and also adds an asterisk to each `required` label: `Name *` instead of `Name`.

To do this, include it in your `application.css` manifest file and insert:

```css
//= require refinery/inquiries/inquiries
```

## About

__Add a simple contact form to Refinery that notifies you and the customer when an inquiry is made.__

In summary you can:

* Collect and manage inquiries
* Specify who is notified when a new inquiry comes in
* Customise an auto responder email that is sent to the person making the inquiry

When inquiries come in, you and the customer are generally notified. As we implemented spam filtering through the [filters_spam plugin](https://github.com/resolve/filters_spam#readme) you will not get notified if an inquiry is marked as 'spam'.

## How do I setup email to be sent from GMail, SendGrid or other service?

Inquiries uses `actionmailer` under the hood so you can refer to [Rails Action Mailer guide](http://guides.rubyonrails.org/action_mailer_basics.html). For example to use GMail see [Action Mailer Configuration for GMail](http://guides.rubyonrails.org/action_mailer_basics.html#action-mailer-configuration-for-gmail) guide.

## How do I get Notified?

Go into your 'Inquiries' tab in the Refinery admin area and click on "Update who gets notified"

## How do I Edit the Automatic Confirmation Email

Go into your 'Inquiries' tab in the Refinery admin area and click on "Edit confirmation email"

## Help! How do I send emails from no-reply@domain.com.au instead of no-reply@com.au?

Simply set the following in config/application.rb:

```ruby
config.action_dispatch.tld_length = 2
```

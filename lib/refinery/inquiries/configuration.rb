module Refinery
  module Inquiries
    include ActiveSupport::Configurable

    config_accessor :show_contact_privacy_link
    config_accessor :show_phone_number_field
    config_accessor :show_placeholders
    config_accessor :send_notifications_for_inquiries_marked_as_spam
    config_accessor :from_name
    config_accessor :custom_inquiry_attributes
    config_accessor :extra_spam_words
    config_accessor :use_recaptcha
    config_accessor :submit_via_javascript
    config_accessor :use_honeypot
    config_accessor :honeypot_field_name

    self.show_contact_privacy_link = true
    self.show_phone_number_field = true
    self.show_placeholders = true
    self.send_notifications_for_inquiries_marked_as_spam = false
    self.from_name = "no-reply"
    self.custom_inquiry_attributes = {}
    self.extra_spam_words = []
    self.use_recaptcha = false
    self.submit_via_javascript = false
    self.use_honeypot = false
    self.honeypot_field_name = :subject
  end
end

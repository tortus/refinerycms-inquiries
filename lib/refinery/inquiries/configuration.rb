module Refinery
  module Inquiries
    include ActiveSupport::Configurable

    config_accessor :show_contact_privacy_link
    config_accessor :send_notifications_for_inquiries_marked_as_spam

    self.show_contact_privacy_link = true

    config_accessor :custom_inquiry_attributes
    self.custom_inquiry_attributes = {}

    self.send_notifications_for_inquiries_marked_as_spam = false
  end
end

module Refinery
  module Inquiries
    class Inquiry < Refinery::Core::BaseModel

      filters_spam :message_field => :message,
                   :email_field => :email,
                   :author_field => :name,
                   :other_fields => [:phone],
                   :extra_spam_words => %w()

      validates :name, :presence => true
      validates :message, :presence => true
      validates :email, :format=> { :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

      acts_as_indexed :fields => [:name, :email, :message, :phone]
      
      store :custom_store

      default_scope :order => 'created_at DESC'

      attr_accessible :name, :phone, :message, :email

      def self.latest(number = 7, include_spam = false)
        include_spam ? limit(number) : ham.limit(number)
      end
      
      def self.custom_attributes
        Inquiries.custom_inquiry_attributes
      end
      def custom_attributes
        self.class.custom_attributes
      end
      
      custom_attributes.each do |attribute, config|
        logger.debug "Custom Inquiry attribute: #{attribute}"
        
        attribute_name = attribute.to_sym     
        
        define_method(attribute_name) { custom_store[attribute_name] }
        define_method("#{attribute_name}=") { |val| custom_store[attribute_name] = val }
        attr_accessible(attribute)
      end
      
      if (attrs_with_defaults = custom_attributes.reject {|key, config| config[:default].nil? })
        define_method(:init_custom_attributes) do
          attrs_with_defaults.each do |attribute, config|
            self.send("#{attribute}=", config[:default])
          end
        end
        after_initialize :init_custom_attributes
      end

    end
  end
end
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
      validates :email, :format=> { :with =>  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

      acts_as_indexed :fields => [:name, :email, :message, :phone]
      
      store :custom_store

      default_scope :order => 'created_at DESC'

      attr_accessible :name, :phone, :message, :email

      def self.latest(number = 7, include_spam = false)
        include_spam ? limit(number) : ham.limit(number)
      end
      
      def self.custom_attribute_configs
        Inquiries.custom_inquiry_attributes
      end
      def self.custom_attribute_names
        custom_attribute_configs.keys
      end
      
      self.custom_attribute_configs.each do |attribute, config|
        logger.debug "Custom Inquiry attribute: #{attribute}"
        
        attribute_name = attribute.to_sym     
        
        define_method(attribute_name) { custom_store[attribute_name] }
        define_method("#{attribute_name}=") { |val| custom_store[attribute_name] = val }
        attr_accessible(attribute)
      end
      
      if (attrs_with_defaults = self.custom_attribute_configs.reject {|key, config| config[:default].nil? })
        define_method(:init_custom_attributes) do
          attrs_with_defaults.each do |attribute, config|
            self.send("#{attribute}=", config[:default])
          end
        end
        after_initialize :init_custom_attributes
      end
      
      # Returns all custom attribute names as array of symbols
      def custom_attribute_names
        self.class.custom_attribute_names
      end
      
      # Returns names and values of all custom attributes
      # as a hash in the format: {:attr1 => value, :attr2 => value, ...}
      def custom_attributes
        custom_attribute_names.inject({}) do |values, name|
          values[name] = self.send(name)
          values
        end
      end

    end
  end
end
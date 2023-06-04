module Devisable
  extend ActiveSupport::Concern

  included do
    def self.decorator_class
      UserDecorator
    end

    def email_required?
      false
    end

    def email_changed?
      false
    end

    def will_save_change_to_email?
      false
    end
  end
end

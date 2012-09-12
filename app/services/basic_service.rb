# = BasicService
#
# The BasicService class provides simple ActiveModel behaviour so that you can
# submit form data to it. From there you can create and call methods that will
# use that data to implement business logic.

class BasicService
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations


  def initialize(attributes = nil)
    assign_attributes(attributes) if attributes
  end

  def assign_attributes(new_attributes)
    new_attributes.each do |k, v|
      if respond_to?("#{k}=")
        self.send("#{k}=", v)
      end
    end
  end

  def persisted?
    false
  end

  private 

  # Private: strip 'validation failed:' out of error messages 
  #
  # Returns the exception message with the preamble removed
  def without_preamble(message)
    message.gsub(/Validation failed:/, '')
  end

  # Private: grab the error message and trigger a rollback
  #     note that this requires that you call the bang version
  #     of the AR methods e.g. save! or create!
  #
  # Returns the value of the block or raises an exception
  def catch_errors_with_rollback(model_symbol)
    yield if block_given?
  rescue ActiveRecord::RecordInvalid => e
    self.errors.add(model_symbol, without_preamble(e.message))
    raise ActiveRecord::Rollback
  end

  def catch_errors(model_symbol)
    yield if block_given?
  rescue ActiveRecord::RecordInvalid => e
    self.errors.add(model_symbol, without_preamble(e.message))
  end

end
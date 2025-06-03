# frozen_string_literal: true

class ErrorsComponent < ViewComponent::Base
  def initialize(record:)
    @record = record
  end

  attr_reader :record

  def render?
    record.errors.any?
  end

  def formatted_error(error)
    error.attribute.to_s.gsub('.', ' > ').titleize
  end
end

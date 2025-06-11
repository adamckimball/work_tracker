# frozen_string_literal: true

require "test_helper"

class ErrorsComponentTest < ViewComponent::TestCase
  def test_renders_errors
    user = User.new # or use users(:one) if you have a fixture
    user.validate # triggers validation errors
    rendered = render_inline(ErrorsComponent.new(record: user))
    assert_includes rendered.text, "Email"
  end
end

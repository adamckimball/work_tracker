# frozen_string_literal: true

class SearchOrCreateNewComponent < ViewComponent::Base
  def initialize(
    path_to_search:,
    target_frame_name:,
    allow_create_new: true,
    set_on_click: true,
    current_value: "",
    dropdown_id: nil,
    additional_classes: ""
  )
    @path_to_search = path_to_search
    @target_frame_name = target_frame_name
    @allow_create_new = allow_create_new
    @set_on_click = set_on_click
    @current_value = current_value
    @dropdown_id = dropdown_id
    @additional_classes = additional_classes
  end

  private

  attr_reader :path_to_search,
              :target_frame_name,
              :allow_create_new,
              :set_on_click,
              :current_value,
              :dropdown_id,
              :additional_classes

  delegate :turbo_frame_tag, to: :helpers

  def stimulus_actions
    (
      %w[
        keydown.tab->search-select-dropdown#checkCloseMenu
        keydown.esc->search-select-dropdown#checkCloseMenu
        keydown.up->type-to-search#handleFocusUp
        keydown.down->type-to-search#handleFocusDown
        keydown.enter->type-to-search#handleKeyboardSelect
        keydown.enter->search-select-dropdown#checkCloseMenu
        input->type-to-search#debounceCall
        input->search-select-dropdown#showResults
        blur->type-to-search#inputBlurred]
    ).join(" ")
  end
end

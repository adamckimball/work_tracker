# frozen_string_literal: true

class SearchOrCreateNewListComponent < ViewComponent::Base
  def initialize(
    resources:,
    target_frame_name:,
    path_attr:,
    display_attr: "name",
    allow_create_new: true,
    create_new_path: "",
    create_new_text: "",
    convertible_target: "",
    data_actions: ""
  )
    @resources = resources
    @target_frame_name = target_frame_name
    @path_attr = path_attr
    @display_attr = display_attr
    @allow_create_new = allow_create_new
    @create_new_path = create_new_path
    @create_new_text = create_new_text
    @convertible_target = convertible_target
    @data_actions = data_actions
    super
  end

  private

  attr_reader :resources,
              :target_frame_name,
              :path_attr,
              :display_attr,
              :allow_create_new,
              :create_new_path,
              :create_new_text,
              :convertible_target,
              :data_actions

  delegate :tag, to: :helpers

  def display_value(resource)
    resource.send(display_attr)
  end

  def path_to_show(resource)
    send(
      path_attr,
      id: resource.id,
      target_frame_name:,
      convertible_target:,
    )
  end

  def ul_classes
    "absolute left-0 right-0 boarder boarder-zinc-200 rounded ring-1 ring-black ring-opacity-5 bg-white shadow-lg z-10"
  end

  def li_classes
    "cursor-pointer hover:bg-slate-50 p-2 text-sm"
  end

  def create_new_li_classes
    "droopdown-list-item boarder-b p-2 boarder-zinc-200 whitespace-nowrap text-sm leading-5 font-normal text-gray-900 hover:bg-slate-50"
  end

  def create_new_button_text
    "Create #{create_new_text}"
  end

  def create_new_li_element
    tag.li(create_new_button_text, class: create_new_li_classes)
  end

  def create_new_button
    return unless allow_create_new
    link_to(
      create_new_path,
      data: {
        turbo_frame: "slide_over",
        action: "click->search-select-dropdown#toggle"

      }
    ) { create_new_li_element }
  end
end

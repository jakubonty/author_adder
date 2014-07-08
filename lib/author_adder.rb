module AuthorAdder

  def self.add_author_field
    field_name = "Author"

    custom_field = ProjectCustomField.find_by_name(field_name)

    if custom_field.nil?
      params = { name: field_name,
                 field_format: "user",
                 possible_values: nil,
                 regexp: "",
                 min_length: nil,
                 max_length: nil,
                 is_required: false,
                 is_for_all: false,
                 is_filter: false,
                 position: 1,
                 searchable: false,
                 default_value: nil,
                 editable: true,
                 visible: true,
                 multiple: false,
                 format_store: {:user_role=>[],:edit_tag_style=>""},
                 description: ""
               }
      custom_field = ProjectCustomField.create(params)
    end
  end

end

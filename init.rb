Rails.configuration.to_prepare do
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

Redmine::Plugin.register :author_adder do
  name 'Author Adder plugin'
  author 'Jakub Motyčka'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/jakubonty/author_adder/'
  author_url 'https://github.com/jakubonty/'
end

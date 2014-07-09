class PopulateAuthorField < ActiveRecord::Migration
    FIELD_NAME = "Author"

    def self.up
      params = { name: FIELD_NAME,
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
        ProjectCustomField.create(params)
    end
    def self.down
      field = ProjectCustomField.find_by_name(FIELD_NAME)
      field.delete if field
    end
end
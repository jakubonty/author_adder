Rails.configuration.to_prepare do
  require_dependency 'author_adder/projects_helper_patch'
  require_dependency 'author_adder/projects_controller_patch'

  # extending :edit_project permissions
  Redmine::AccessControl.permission(:edit_project).actions.push "author_adder/edit"
end

Redmine::Plugin.register :author_adder do
  name 'Author Adder plugin'
  author 'Jakub Motyčka'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

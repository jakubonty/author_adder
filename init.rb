require_dependency 'author_adder/hooks'

Rails.configuration.to_prepare do
  Project.send(:safe_attributes, 'author_id')
end

Redmine::Plugin.register :author_adder do
  name 'Author Adder plugin'
  author 'Jakub Motyčka'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/jakubonty/author_adder/'
  author_url 'https://github.com/jakubonty/'
end

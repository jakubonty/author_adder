module AuthorAdder
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_projects_form,
              :partial => 'hooks/author_adder/author_field'
  end
end
module AuthorAdder
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_projects_form,
              :partial => 'hooks/author_adder/author_field'

    def controller_issues_edit_before_save(context={ })
      binding.pry
      context[:issue].author_id = params[:project][:author_id]
      #context[:issue].author_id ||= "default"
    end
  end
end
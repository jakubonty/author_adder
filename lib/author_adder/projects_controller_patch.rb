require_dependency 'projects_controller'

module AuthorAdder
    module ProjectsControllerPatch
        def self.included(base)
          base.send(:include, InstanceMethods)

          base.class_eval do
            unloadable

            alias_method_chain :settings, :author_adder
          end
        end

        module InstanceMethods
            def settings_with_author_adder
                @project_author = ProjectAuthor.find_by_project_id @project.id
                @project_author ||= ProjectAuthor.new
                settings_without_author_adder
            end
        end
    end
end

ProjectsController.send(:include, AuthorAdder::ProjectsControllerPatch)
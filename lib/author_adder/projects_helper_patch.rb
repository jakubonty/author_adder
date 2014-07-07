require_dependency 'projects_helper'

module AuthorAdder
    module ProjectsHelperPatch
        def self.included(base)
          base.send(:include, InstanceMethods)

          base.class_eval do
            unloadable

            alias_method_chain :project_settings_tabs, :author_adder
          end
        end

        module InstanceMethods
            def project_settings_tabs_with_author_adder
                original_tabs = project_settings_tabs_without_author_adder
                if not User.current.allowed_to?(:edit_project, @project)
                    return original_tabs
                end
                original_tabs.push({ :name => 'author_adder',
                                     :action => :add_author,
                                     :partial => 'projects/settings/edit_author',
                                     :label => :author_add })
            end
        end
    end
end

ProjectsHelper.send(:include, AuthorAdder::ProjectsHelperPatch)
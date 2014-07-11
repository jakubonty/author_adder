require_dependency 'project'

module AuthorAdder
    module ProjectModelPatch
        def self.included(base)
          base.send(:include, InstanceMethods)

          base.class_eval do
            unloadable
          end
        end

        module InstanceMethods
          def check_if_author_user_exists
            user = User.find self.author_id
          rescue
            return false
          end
        end
    end
end

Project.send(:include, AuthorAdder::ProjectModelPatch)
Project.send(:before_save, :check_if_author_user_exists)
Project.send(:safe_attributes, 'author_id')

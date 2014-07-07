class ProjectAuthor < ActiveRecord::Base
  unloadable

  belongs_to :project
  has_one :user, :dependent => :destroy
end

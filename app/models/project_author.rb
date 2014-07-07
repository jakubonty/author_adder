class ProjectAuthor < ActiveRecord::Base
  unloadable

  attr_accessible :user_id, :project_id

  belongs_to :project
  has_one :user, dependent: :destroy

  before_validation :check_if_user_exists

  def check_if_user_exists
    begin
      user = User.find self.user_id
      return false if user.status != User::STATUS_ACTIVE
    rescue
      return false
    end
  end
end

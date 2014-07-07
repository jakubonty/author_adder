class AuthorAdderController < ApplicationController
  unloadable

  before_filter :find_project, :find_project_author, :authorize

  def edit
    @project_author.attributes = params[:project_author]
    @project_author.project = @project
    @project_author.save
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_project_author
    @project_author = ProjectAuthor.find_by_project_id(@project.id)
    @project_author ||= ProjectAuthor.new()
  end

end

class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    record.user == user || record.published
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def upload_image?
    edit?
  end
end

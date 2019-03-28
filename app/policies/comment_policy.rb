class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def create?
    true
  end

  def index?
    true
  end

  def new?
    true
  end

  def destroy?
    record.user == user
  end
  
end

class EventPolicy < ApplicationPolicy
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

  def terminate?
    record.user == user
  end

def update?
  record.user == user
end

def destroy?
  record.user == user
  true
end



  
end

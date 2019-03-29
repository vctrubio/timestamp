class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.select do |e|
        user.following?(e.user) || user.admin 
      end
    end
  end
  # need to reseolve / finish to scope e.user_id == current_user

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

class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.all.select do |e|
          user.following?(e.user) || e.user.id == user.id
        end
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
end

end

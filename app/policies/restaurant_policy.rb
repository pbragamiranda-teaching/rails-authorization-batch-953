class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # Restaurant.all
      # score.where.not(user: user)
      scope.all
    end
  end

  def show?
    true # -> everybody is allowed to access this page
    # false -> nobody is allowed to acces this page
  end

  # who is allowed to perform / access this page?
  def new?
    create?
  end

  def create?
    true
  end

  # who is allowed to perform / access this page?
  # condition = user.id == restaurant.user_id
  def edit?
    update?
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end

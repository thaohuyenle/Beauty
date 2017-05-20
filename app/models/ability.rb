class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin_role?
      can :destroy, Post
    elsif user.user_role?
      can :manage, Post
    end
    can :show, :all
  end
end

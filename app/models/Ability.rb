class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :search, UniClass
      can :register, UniClass
      can :my_classes, UniClass
      can :deregister, UniClass
    end
  end
end
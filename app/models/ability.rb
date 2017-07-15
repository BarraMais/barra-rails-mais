class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    can :read, :all
    if user.has_role? "Administrator"
      can :access, :rails_admin
      can :manage, :all
    end

  end

end

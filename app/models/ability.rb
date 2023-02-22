# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :SplashScreen
    return unless user.present?

    can :manage, Category, user_id: user.id
    can :manage, MyTransaction, user_id: user.id

    return unless user.admin?

    can :manage, :all
  end
end

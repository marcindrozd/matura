# class Ability
#   include CanCan::Ability
#
#   attr_accessor :user
#
#   def initialize(user)
#     @user = user
#
#     assign_abilities_to_roles
#   end
#
#   private
#
#   def assign_abilities_to_roles
#     if user.has_role? :admin
#       admin_abilities
#     elsif user.has_role? :teacher
#       teacher_abilities
#     elsif user.has_role? :analyst
#       analyst_abilities
#     end
#
#     default_abilities
#   end
#
#   def admin_abilities
#     can :manage, :all
#   end
#
#   def teacher_abilities
#     # not implemented yet
#   end
#
#   def default_abilities
#     can :read, User
#   end
# end

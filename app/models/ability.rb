class Ability
  include CanCan::Ability

  attr_accessor :user

  def initialize(user)
    @user = user

    assign_abilities_to_roles
  end

  private

  def assign_abilities_to_roles
    if user.has_role? :admin
      admin_abilities
    elsif user.has_role? :teacher
      teacher_abilities
    elsif user.has_role? :analyst
      analyst_abilities
    end

    default_abilities
  end

  def admin_abilities
    can :manage, :all
  end

  def teacher_abilities
    can :set_current, Exam
    can :read, Group, id: user_group_ids
    can :edit, Group, id: user_group_ids
    can :manage, Student, group_id: user_group_ids
    can :manage, Task, students: { group_id: user_group_ids }
    # can :manage, Score, students: { group_id: user_group_ids }
  end

  def default_abilities
    can :read, Exam
  end

  def user_group_ids
    user.groups.pluck(:id)
  end
end

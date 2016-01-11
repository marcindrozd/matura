module SelectsHelper

  def task_skills_for_select
    Task::SKILLS
  end

  def task_levels_for_select
    Task::LEVELS.map { |l| [I18n.t("task.levels.#{l}"), l] }
  end

  def groups_for_select
    Group.groups_for_select.map { |g| [ g.full_name, g.id ] }
  end
end
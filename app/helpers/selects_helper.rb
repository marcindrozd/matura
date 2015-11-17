module SelectsHelper

  def task_skills_for_select
    Task::SKILLS
  end

  def task_levels_for_select
    Task::LEVELS.map { |l| [I18n.t("task.levels.#{l}"), l] }
  end
end
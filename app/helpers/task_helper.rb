module TaskHelper

  def task_title(task, student)
    if task.description
      "#{tc(Task)}: #{task.number} - #{task.description} / #{student.group.name} - #{student.name}"
    else
      "#{tc(Task)}: #{task.number} / #{student.group.name} - #{student.name}"
    end
  end
end
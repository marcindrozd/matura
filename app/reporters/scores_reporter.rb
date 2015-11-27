class ScoresReporter < ApplicationReporter

  attr_reader :group, :level, :students_results

  def initialize(group, level)
    @group = group
    @level = level
    @students_results = []
    students_scores
  end

  def students_scores
    students.each do |student|
      total = tasks_scores(student).inject(:+)

      @students_results << OpenStruct.new(
        name: student.name,
        tasks: tasks_scores(student),
        total_for_all_tasks: total,
        percentage: percentage(student, total)
      )
    end
  end

  def total_points_for_tasks
    @total_points_for_tasks ||= tasks.map { |t| t.max_points }.reduce(:+)
  end

  def group_average_score
    results = Array.new(tasks.count, 0)
    @students_results.each do |student|
      results = [results, student.tasks].transpose.map { |r| r.sum }
    end
    results.map { |r| r.to_f / @students_results.count }
  end

  def group_average_percentage
    [group_average_score, max_points_per_task].transpose.map { |a, m| (a / m) * 100 }
  end

  def group_median
    results = []
    mapped_tasks_results.each do |array|
      sorted = array.sort!
      len = sorted.length
      results << (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
    end
    results
  end

  def group_mode
    results = []
    mapped_tasks_results.each do |array|
      freq = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      results << array.max_by { |v| freq[v] }
    end
    results
  end

  def group_min
    results = []
    mapped_tasks_results.each do |array|
      results << array.min
    end
    results
  end

  def group_max
    results = []
    mapped_tasks_results.each do |array|
      results << array.max
    end
    results
  end

  def group_sum
    results = Array.new(tasks.count, 0)
    @students_results.each do |student|
      results = [results, student.tasks].transpose.map { |r| r.sum }
    end
    results
  end

  def group_easiness
    results = []
    mapped_tasks_results.each_with_index do |array, i|
      results << array.sum / (students.count.to_f * max_points_per_task[i])
    end
    results
  end

  def tasks
    @tasks ||= group.send("#{level}_tasks")
  end

  private

  def students
    @students ||= group.students.where(level: level)
  end

  def tasks_scores(student)
    results = []
    student_tasks = student.send("#{level}_tasks")
    student_tasks.each do |task|
      results << student.sum_scores_by_task(task.id)
    end
    results
  end

  def percentage(student, total)
    total = total || 0

    student_tasks = student.send("#{level}_tasks")
    (total / total_points_for_tasks.to_f) * 100
  end

  def mapped_tasks_results
    results = []
    ary = @students_results.map { |r| r.tasks }
    (0..(tasks.count - 1)).each do |i|
      results << ary.map { |item| item[i] }
    end

    results
  end

  def max_points_per_task
    max_points_per_task ||= tasks.map { |t| t.max_points }
  end
end
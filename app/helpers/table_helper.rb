module TableHelper

  def skills_heading(tasks)
    tasks.map { |t| t.skill }.uniq.each do |skill|
      concat content_tag(:th, skill.capitalize, colspan: "#{tasks.where(skill: skill).count}")
    end
  end
end

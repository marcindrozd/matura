module ExamsHelper
  def current_exam
    @current_exam ||= Exam.find_by(id: current_exam_id) || Exam.first
  end

  def set_current_exam(id)
    cookies.signed[:current_exam] = id
    # flash.notice = t('flash.custom.current_plant_set', exam: current_exam)
  end

  def current_exam_id
    if can? :set_current, Exam
      cookies.signed[:current_exam]
    else
      Exam.first.id
    end
  end

  def available_exams
    Exam.all
  end
end

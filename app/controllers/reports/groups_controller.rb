class Reports::GroupsController < Reports::BaseController
  load_and_authorize_resource through: :current_exam

  def index
  end

  def show
    scores_reporter
  end

  private

  def scores_reporter
    @standard_scores_reporter ||= ScoresReporter.new @group, 'standard'
    @extended_scores_reporter ||= ScoresReporter.new @group, 'extended'
    @bilingual_scores_reporter ||= ScoresReporter.new @group, 'bilingual'
  end
end

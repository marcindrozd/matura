class UserFilter < ActiveRecord::Base

  serialize :filter_hash

  belongs_to :user

  validates :name, length: { maximum: 15 }

  before_create :set_defaults

  def self.active_for(user, filter_key)
    active_filter = user.filters.where(filter_key: filter_key.to_s).order('activated_at DESC').first_or_create
    active_filter.update_column(:activated_at, Time.now)

    active_filter
  end

  def self.new_for(user, filter_key)
    active_filter = user.filters.where(filter_key: filter_key.to_s).where('name IS NULL').first_or_create
    active_filter.update_column(:activated_at, Time.now)

    active_filter
  end

  private

  def set_defaults
    self.filter_hash = {}
  end
end

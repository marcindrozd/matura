class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w(admin teacher)

  has_and_belongs_to_many :groups

  validates :email, :username, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  def has_role?(role)
    self.role == role.to_s
  end
end

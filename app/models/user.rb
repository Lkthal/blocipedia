class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy

  enum role: [:standard, :premium, :admin]

  after_initialize :init

  def init
    self.role ||= :standard
  end
end
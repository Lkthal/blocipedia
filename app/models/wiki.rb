class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  accepts_nested_attributes_for :users

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 10 }, presence: true
  validates :user, presence: true
end
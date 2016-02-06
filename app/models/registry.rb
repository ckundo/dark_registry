class Registry < ActiveRecord::Base
  belongs_to :user
  has_many :gifts

  validates :title, presence: true
end

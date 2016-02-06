class Registry < ActiveRecord::Base
  belongs_to :user
  has_many :gifts

  accepts_nested_attributes_for :gifts
  validates :title, presence: true
end

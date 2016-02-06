class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :registry
  has_many :gifts, through: :registry

  validates :handle, presence: true, uniqueness: true
end

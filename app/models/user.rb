class User < ActiveRecord::Base
  include Clearance::User

  has_one :registry
  has_many :gifts, through: :registry
end

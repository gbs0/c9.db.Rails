class Hospital < ActiveRecord::Base
  belongs_to :contact
  has_many :address
end

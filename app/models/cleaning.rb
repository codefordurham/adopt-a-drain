class Cleaning < ActiveRecord::Base
    belongs_to :user
    belongs_to :thing
    validates :date_cleaned, presence: true
end

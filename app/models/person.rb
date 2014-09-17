class Person < ActiveRecord::Base
  has_many :time_slots, dependent: :destroy
  has_and_belongs_to_many :reminders
  accepts_nested_attributes_for :time_slots, allow_destroy: true
end
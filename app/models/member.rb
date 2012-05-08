class Member < ActiveRecord::Base
  attr_accessible :email, :name, :phone_number
  validates :email, :name, :phone_number, :presence => true
  validates :name, :length => { :within => 1..25 }, :format => { :with => /\A[A-Za-z ]*\z/ }
  validates :phone_number, :length => { :within => 10..12 }, :numericality => { :only_integer => true }
end

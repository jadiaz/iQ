class Member
  include Mongoid::Document

  field :first_name
  field :middle_name
  field :last_name
  field :company_name
  field :address1
  field :address2
  field :city
  field :state
  field :zipcode
  field :email
  field :phone
  field :website
  field :membership_level
  field :payment_type
  field :paypal_id
  field :access_id

  field :active, type: Boolean, default: true
  field :board_of_directors, type: Boolean, default: false
  field :operations, type: Boolean, default: false

  embeds_many :interests
  embeds_many :payments

  include Mongoid::Timestamps

  scope :associate_members, where(membership_level: "Associate")
  scope :basic_members, where(membership_level: "Basic")
  scope :premium_members, where(membership_level: "Premium")
  scope :active, where(active: true)

  validates_presence_of :first_name, :last_name, :email
  validates_acceptance_of :terms, :on => :create
end

class User
  include Mongoid::Document
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation

  validates :email, 
            :presence => true, 
            :uniqueness => { :case_sensitive => false },
            :format => { :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
  validates :password, 
            :presence => { :on => :create }, 
            :confirmation => { :on => :create, :message => "passwords do not match" }
end

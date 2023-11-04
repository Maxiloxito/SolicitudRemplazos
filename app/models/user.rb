class User < ApplicationRecord
    enum role: { employee: 'employee', employer: 'employer' }
    has_secure_password
    has_one_attached :resume
  
    validates :first_name, :last_name, :email, :location, :contact, :engineering_type, presence: true
    validates :email, uniqueness: true

    has_many :replacement_requests
    has_many :job_offers

  end
  
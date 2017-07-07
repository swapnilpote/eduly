class AdminUser < ActiveRecord::Base
    # Bcrypt for securing password
    has_secure_password

    # Validations
    validates :email, uniqueness: true
end

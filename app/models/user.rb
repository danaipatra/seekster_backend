class User < ApplicationRecord
    validates :email , email: true
end

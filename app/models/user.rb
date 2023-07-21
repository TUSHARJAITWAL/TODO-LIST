class User < ApplicationRecord
    has_one_attached :profile_image
    validates :name,:email ,presence: true
    validates :email , uniqueness: true
    validates :phone , uniqueness: true
    validates :name,format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/ ,message: 'only letters are allowed'}
end

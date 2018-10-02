class Lead < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, uniqueness: { message: "Esse e-mail já foi cadastrado" }
end

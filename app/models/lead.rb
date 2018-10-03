class Lead < ApplicationRecord
	validates :name, presence: { message: "O Nome é obrigatório" }
	validates :last_name, presence: { message: "O Sobrenome é obrigatório" }
	validates :email, presence: true, uniqueness: { message: "Esse e-mail já foi cadastrado" }
end

class Lead < ApplicationRecord
	validates :name, presence: { message: "O Nome é obrigatório" }
	validates :last_name, presence: { message: "O Sobrenome é obrigatório" } 
	validates :email, presence: true, uniqueness: { message: "Esse e-mail já foi cadastrado" }, format: { with: URI::MailTo::EMAIL_REGEXP, message: " com formato inválido" }

	def self.to_csv
	    attributes = %w{id name last_name email ip created_at}

	    CSV.generate(headers: true) do |csv|
	      csv << attributes

	      all.each do |lead|
	        csv << attributes.map{ |attr| lead.send(attr) }
	      end
	    end
	  end
end

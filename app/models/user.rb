class User < ApplicationRecord
  belongs_to :usertype
# belongs_to relacion uno a uno
#Validar que el email no sea vacio.
  validates :email, presence: true, confirmation: true
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX, message: "Formato de email no valido"}
end

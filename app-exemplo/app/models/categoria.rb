class Categoria < ActiveRecord::Base
  include Codificavel

  validates :nome, presence: true, uniqueness: true

  has_many :produtos
end

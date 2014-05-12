class Produto < ActiveRecord::Base
  include Codificavel

  SITUACOES = %w(ativo inativo esgotado)

  validates_presence_of :nome
  validates_uniqueness_of :nome
  validates_numericality_of :valor, greater_than: 0
  validates_inclusion_of :status, in: SITUACOES

  belongs_to :categoria

  def ativar
    update(status: 'ativo')
  end

  def ativo?
    status == 'ativo'
  end
end

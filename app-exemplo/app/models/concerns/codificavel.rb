module Codificavel
  extend ActiveSupport::Concern

  included do
    before_validation :definir_codigo
  end

  private
  def definir_codigo
    self.codigo = SecureRandom.hex(6)
  end
end

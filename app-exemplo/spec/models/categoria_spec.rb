require 'spec_helper'

describe Categoria do
  it_behaves_like 'codificavel', Categoria.create(:nome => 'Bla')

  context 'validações' do
    it { should validate_presence_of(:nome) }
    it { should validate_uniqueness_of(:nome) }
  end

  context 'relacionamentos' do
    it { should have_many(:produtos) }
  end
end

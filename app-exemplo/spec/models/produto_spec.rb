require 'spec_helper'

describe Produto do
  it_behaves_like 'codificavel', Produto.create(:nome => 'bla',
                                                :valor => 50,
                                                :status => 'ativo')

  context 'sem usar subject' do
    let(:produto) { Produto.new }
    it { expect(produto).to respond_to(:nome) }
  end

  context 'usando subject' do
    it { should respond_to(:nome) }
  end

  context 'validações' do
    it { should validate_presence_of(:nome) }
    it { should validate_uniqueness_of(:nome) }
    it { should validate_numericality_of(:valor).is_greater_than(0) }
    it { should ensure_inclusion_of(:status).in_array(Produto::SITUACOES) }
  end

  context 'relacionamentos' do
    it { should belong_to(:categoria) }
  end

  describe '#ativar' do
    let(:produto) do
      Produto.create(nome: 'Cadeira', 
                     valor: 200.0, 
                     status: 'inativo')
    end
    before do
      @resultado =  produto.ativar
    end
    it { expect(@resultado).to be_true }
    it { expect(produto.status).to eq 'ativo' }
  end

  describe '#ativo?' do
    context 'quando ativo' do
      subject { Produto.new(status: 'ativo') }
      it { should be_ativo }
    end

    context 'quando inativo' do
      %w(inativo esgostado).each do |status|
        let(:produto) { Produto.new(status: status) }
        it { expect(produto).not_to be_ativo }
      end
    end
  end
end

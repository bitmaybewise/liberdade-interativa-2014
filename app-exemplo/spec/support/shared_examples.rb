shared_examples_for 'codificavel' do |objeto|
  subject(:codificavel) { objeto }

  it { expect(codificavel.codigo).to be_a String }
  it { expect(codificavel.codigo).not_to be_blank }
end

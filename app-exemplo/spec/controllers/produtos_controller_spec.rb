require 'spec_helper'

describe ProdutosController do

  # AVISO
  # Não use a sintaxe do should
  # Prefira a sintaxe do expect

  let(:valid_attributes) { { nome: "produto #{SecureRandom.hex(6)}",
                             valor: '50.0',
                             status: 'ativo' } }
  describe "GET index" do
    before do
      Produto.create! valid_attributes
      get :index
    end
    it { expect(assigns(:produtos)).to have(1).produto }
  end

  describe "GET show" do
    it "assigns the requested produto as @produto" do
      produto = Produto.create! valid_attributes
      get :show, {:id => produto.to_param}
      assigns(:produto).should eq(produto)
    end
  end

  describe "GET new" do
    it "assigns a new produto as @produto" do
      get :new
      assigns(:produto).should be_a_new(Produto)
    end
  end

  describe "GET edit" do
    it "assigns the requested produto as @produto" do
      produto = Produto.create! valid_attributes
      get :edit, {:id => produto.to_param}
      assigns(:produto).should eq(produto)
    end
  end

  describe "POST create" do
    describe "com parâmetros válidos" do
      before { post :create, :produto => valid_attributes }
      it { expect(assigns(:produto)).to be_a Produto }
      it { expect(assigns(:produto)).to be_persisted }
      it { expect(response).to redirect_to assigns(:produto) }
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved produto as @produto" do
        # Trigger the behavior that occurs when invalid params are submitted
        Produto.any_instance.stub(:save).and_return(false)
        post :create, {:produto => { nome: '' }}
        assigns(:produto).should be_a_new(Produto)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Produto.any_instance.stub(:save).and_return(false)
        post :create, {:produto => { nome: '' }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested produto" do
        produto = Produto.create! valid_attributes
        attrs = { "nome" => "produto #{SecureRandom.hex(6)}" }
        Produto.any_instance.should_receive(:update).with(attrs)
        put :update, {:id => produto.to_param, :produto => attrs}
      end

      it "assigns the requested produto as @produto" do
        produto = Produto.create! valid_attributes
        put :update, {:id => produto.to_param, :produto => valid_attributes}
        assigns(:produto).should eq(produto)
      end

      it "redirects to the produto" do
        produto = Produto.create! valid_attributes
        put :update, {:id => produto.to_param, :produto => valid_attributes}
        response.should redirect_to(produto)
      end
    end

    describe "with invalid params" do
      it "assigns the produto as @produto" do
        produto = Produto.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Produto.any_instance.stub(:save).and_return(false)
        put :update, {:id => produto.to_param, :produto => { nome: '' }}
        assigns(:produto).should eq(produto)
      end

      it "re-renders the 'edit' template" do
        produto = Produto.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Produto.any_instance.stub(:save).and_return(false)
        put :update, {:id => produto.to_param, :produto => { nome: '' }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested produto" do
      produto = Produto.create! valid_attributes
      expect {
        delete :destroy, {:id => produto.to_param}
      }.to change(Produto, :count).by(-1)
    end

    it "redirects to the produtos list" do
      produto = Produto.create! valid_attributes
      delete :destroy, {:id => produto.to_param}
      response.should redirect_to(produtos_url)
    end
  end

end

 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/depositos", type: :request do
  # Deposito. As you add validations to Deposito, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Deposito.create! valid_attributes
      get depositos_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      deposito = Deposito.create! valid_attributes
      get deposito_url(deposito)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_deposito_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      deposito = Deposito.create! valid_attributes
      get edit_deposito_url(deposito)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Deposito" do
        expect {
          post depositos_url, params: { deposito: valid_attributes }
        }.to change(Deposito, :count).by(1)
      end

      it "redirects to the created deposito" do
        post depositos_url, params: { deposito: valid_attributes }
        expect(response).to redirect_to(deposito_url(Deposito.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Deposito" do
        expect {
          post depositos_url, params: { deposito: invalid_attributes }
        }.to change(Deposito, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post depositos_url, params: { deposito: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested deposito" do
        deposito = Deposito.create! valid_attributes
        patch deposito_url(deposito), params: { deposito: new_attributes }
        deposito.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the deposito" do
        deposito = Deposito.create! valid_attributes
        patch deposito_url(deposito), params: { deposito: new_attributes }
        deposito.reload
        expect(response).to redirect_to(deposito_url(deposito))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        deposito = Deposito.create! valid_attributes
        patch deposito_url(deposito), params: { deposito: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested deposito" do
      deposito = Deposito.create! valid_attributes
      expect {
        delete deposito_url(deposito)
      }.to change(Deposito, :count).by(-1)
    end

    it "redirects to the depositos list" do
      deposito = Deposito.create! valid_attributes
      delete deposito_url(deposito)
      expect(response).to redirect_to(depositos_url)
    end
  end
end
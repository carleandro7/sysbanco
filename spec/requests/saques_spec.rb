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

RSpec.describe "/saques", type: :request do
  # Saque. As you add validations to Saque, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Saque.create! valid_attributes
      get saques_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      saque = Saque.create! valid_attributes
      get saque_url(saque)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_saque_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      saque = Saque.create! valid_attributes
      get edit_saque_url(saque)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Saque" do
        expect {
          post saques_url, params: { saque: valid_attributes }
        }.to change(Saque, :count).by(1)
      end

      it "redirects to the created saque" do
        post saques_url, params: { saque: valid_attributes }
        expect(response).to redirect_to(saque_url(Saque.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Saque" do
        expect {
          post saques_url, params: { saque: invalid_attributes }
        }.to change(Saque, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post saques_url, params: { saque: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested saque" do
        saque = Saque.create! valid_attributes
        patch saque_url(saque), params: { saque: new_attributes }
        saque.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the saque" do
        saque = Saque.create! valid_attributes
        patch saque_url(saque), params: { saque: new_attributes }
        saque.reload
        expect(response).to redirect_to(saque_url(saque))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        saque = Saque.create! valid_attributes
        patch saque_url(saque), params: { saque: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested saque" do
      saque = Saque.create! valid_attributes
      expect {
        delete saque_url(saque)
      }.to change(Saque, :count).by(-1)
    end

    it "redirects to the saques list" do
      saque = Saque.create! valid_attributes
      delete saque_url(saque)
      expect(response).to redirect_to(saques_url)
    end
  end
end

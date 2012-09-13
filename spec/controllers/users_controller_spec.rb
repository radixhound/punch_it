require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      pending
      post 'create', user: {username: 'someguy', email: "some@guy.com", password: 'moo', password_confirmation: "moo"}
      response.should be_success
    end
  end

end

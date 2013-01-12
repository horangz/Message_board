require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

	describe "GET 'sign up'" do
    it "should be successful" do
			get 'signup'
			response.should be_success
    end
  end
end

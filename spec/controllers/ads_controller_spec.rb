require 'spec_helper'

describe AdsController do
	render_views
	
	before(:each) do
      @user = Factory(:user)
    end
		
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end

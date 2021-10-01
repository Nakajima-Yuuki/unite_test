require 'test_helper'

class ProposersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get proposers_show_url
    assert_response :success
  end

end

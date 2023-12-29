require "test_helper"

class CalendrierControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get calendrier_new_url
    assert_response :success
  end

  test "should get index" do
    get calendrier_index_url
    assert_response :success
  end
end

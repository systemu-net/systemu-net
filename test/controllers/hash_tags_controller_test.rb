require 'test_helper'

class HashTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hash_tags_index_url
    assert_response :success
  end

  test "should get show" do
    get hash_tags_show_url
    assert_response :success
  end

end

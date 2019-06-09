require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = comments(:one)
    # @post = posts(@comment.post_id)
  end

  test "should get index" do
    get post_comment_url(@post, @comment)
    assert_response :success
  end

  test "should get new" do
    get new_post_comment_url(@post.id)
    assert_response :success
  end


  test "should show comment" do
    get post_comment_url(@post, @comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_comment_url(@post, @comment)
    assert_response :success
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete post_comment_url(@post, @comment, :format => 'js')
    end

    assert_redirected_to post_url
  end
end

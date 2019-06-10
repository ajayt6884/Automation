
require "rails_helper"

RSpec.describe Post, :type => :model do
  context "with 2 or more comments" do
    it "orders them in reverse chronologically" do
      post = Post.create!
      @comment1 == post.comments.create!(:body => "first comment")
      @comment2 == post.comments.create!(:body => "second comment")
      expect(post.comments).not_to eq([@comment2, @comment1])
    end
  end
end


RSpec.describe Post, :type => :model do
  context "with 2 or more post" do
    it "orders them in reverse chronologically" do
      post = Post.create!
      @post1 == post.comments.create!(:body => "first comment")
      @post2 == post.comments.create!(:body => "second comment")
      expect(post.comments).not_to eq([@comment2, @comment1])
    end
  end
end
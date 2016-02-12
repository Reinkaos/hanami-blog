# lib/blog/entities/post.rb
class Post
  include Hanami::Entity
  attributes :title, :body, :author
end

# apps/web/controllers/posts/create.rb
module Web::Controllers::Posts
  class Create
    include Web::Action

    expose :post

    params do
      param :post do
        param :title,  presence: true
        param :body, presence: true
        param :author, presence: true
      end
    end

    def call(params)
      if params.valid?
        @post = PostRepository.create(Post.new(params[:post]))

        redirect_to routes.posts_path
      end
    end
  end
end

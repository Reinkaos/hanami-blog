require_relative '../../../../apps/web/controllers/posts/index'

RSpec.describe Web::Controllers::Posts::Index do
  let(:action) { Web::Controllers::Posts::Index.new }
  let(:params) { Hash[] }

  before(:each) do
    PostRepository.clear

    @post = PostRepository.create(Post.new(title: 'TDD', body: 'Test', author: 'Kent Beck'))
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all books' do
    action.call(params)
    expect(action.exposures[:posts]).to eq [@post]
  end
end

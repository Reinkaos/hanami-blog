require_relative '../../../../apps/web/controllers/posts/create'

RSpec.describe Web::Controllers::Posts::Create do
  let(:action) { Web::Controllers::Posts::Create.new }

  after do
    PostRepository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[post: { title: 'Post Title', body: 'Post Body', author: 'Post Author' }] }

    it 'creates a new post' do
      action.call(params)
      expect(action.post.id).to_not be nil
    end

    it 'redirects the user to the posts listing' do
      response = action.call(params)

      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq '/posts'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[post: {}] }

    it 're-renders the posts#new view' do
      response = action.call(params)
      expect(response[0]).to eq 200
    end

    it 'sets errors attribute accordingly' do
      action.call(params)

      action.params.valid?

      expect(action.errors.for('post.title')).to_not be_empty
      expect(action.errors.for('post.body')).to_not be_empty
      expect(action.errors.for('post.author')).to_not be_empty
    end
  end
end

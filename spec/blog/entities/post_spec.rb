RSpec.describe Post do
  describe 'Attributes' do
    it 'can be initialised with attributes' do
      post = Post.new(title: 'Refactoring')
      expect(post.title).to eq('Refactoring')
    end

    it 'responds to title' do
      expect(subject).to respond_to :title
    end

    it 'responds to body' do
      expect(subject).to respond_to :body
    end

    it 'responds to author' do
      expect(subject).to respond_to :author
    end
  end
end

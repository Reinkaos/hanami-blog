# spec/web/features/list_posts_spec.rb
require 'features_helper'

describe 'List posts' do
  before(:each) do
    PostRepository.clear

    PostRepository.create(Post.new(title: 'PoEEA',
                                   body: 'Lorem', author: 'Martin Fowler'))
    PostRepository.create(Post.new(title: 'TDD',
                                   body: 'Lorem', author: 'Kent Beck'))
  end

  it 'displays each post on the page' do
    visit '/posts'

    within '#posts' do
      expect(page).to have_css('.post', count: 2)
    end
  end
end

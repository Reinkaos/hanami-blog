# spec/web/features/add_book_spec.rb
require 'features_helper'

describe 'Posts' do

  it 'displays list of errors when params contains errors' do
    visit '/posts/new'

    within 'form#post-form' do
      click_button 'Create'
    end

    expect(current_path).to eq '/posts'
    expect(page.body).to include('There was a problem with your submission')
    expect(page.body).to include('title is required')
    expect(page.body).to include('body is required')
    expect(page.body).to include('author is required')
  end
end

require_relative '../../../../apps/web/views/posts/new'

class NewPostParams < Hanami::Action::Params
  param :post do
    param :title, presence: true
    param :body, presence: true
    param :author, presence: true
  end
end

RSpec.describe Web::Views::Posts::New do
  let(:params)    { NewPostParams.new({}) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/posts/new.html.erb') }
  let(:view)      { Web::Views::Posts::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays a list of erros when params contain errors' do
    params.valid?

    expect(rendered).to include('There was a problem with your submission')
    expect(rendered).to include('title is required')
    expect(rendered).to include('body is required')
    expect(rendered).to include('author is required')
  end
end

require 'spec_helper'

describe "notebooks/show" do
  before(:each) do
    @notebook = assign(:notebook, stub_model(Notebook,
      :user => nil,
      :name => "Name",
      :description => "MyText",
      :token => "Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Token/)
  end
end

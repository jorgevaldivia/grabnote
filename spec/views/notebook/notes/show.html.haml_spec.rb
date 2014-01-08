require 'spec_helper'

describe "notebook/notes/show" do
  before(:each) do
    @notebook_note = assign(:notebook_note, stub_model(Notebook::Note,
      :user => nil,
      :notebook => nil,
      :name => "Name",
      :token => "Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Name/)
    rendered.should match(/Token/)
  end
end

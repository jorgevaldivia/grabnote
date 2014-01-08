require 'spec_helper'

describe "notebook/notes/index" do
  before(:each) do
    assign(:notebook_notes, [
      stub_model(Notebook::Note,
        :user => nil,
        :notebook => nil,
        :name => "Name",
        :token => "Token"
      ),
      stub_model(Notebook::Note,
        :user => nil,
        :notebook => nil,
        :name => "Name",
        :token => "Token"
      )
    ])
  end

  it "renders a list of notebook/notes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end

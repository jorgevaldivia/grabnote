require 'spec_helper'

describe "notebooks/index" do
  before(:each) do
    assign(:notebooks, [
      stub_model(Notebook,
        :user => nil,
        :name => "Name",
        :description => "MyText",
        :token => "Token"
      ),
      stub_model(Notebook,
        :user => nil,
        :name => "Name",
        :description => "MyText",
        :token => "Token"
      )
    ])
  end

  it "renders a list of notebooks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end

require 'spec_helper'

describe "notebooks/edit" do
  before(:each) do
    @notebook = assign(:notebook, stub_model(Notebook,
      :user => nil,
      :name => "MyString",
      :description => "MyText",
      :token => "MyString"
    ))
  end

  it "renders the edit notebook form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notebook_path(@notebook), "post" do
      assert_select "input#notebook_user[name=?]", "notebook[user]"
      assert_select "input#notebook_name[name=?]", "notebook[name]"
      assert_select "textarea#notebook_description[name=?]", "notebook[description]"
      assert_select "input#notebook_token[name=?]", "notebook[token]"
    end
  end
end

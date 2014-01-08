require 'spec_helper'

describe "notebooks/new" do
  before(:each) do
    assign(:notebook, stub_model(Notebook,
      :user => nil,
      :name => "MyString",
      :description => "MyText",
      :token => "MyString"
    ).as_new_record)
  end

  it "renders new notebook form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notebooks_path, "post" do
      assert_select "input#notebook_user[name=?]", "notebook[user]"
      assert_select "input#notebook_name[name=?]", "notebook[name]"
      assert_select "textarea#notebook_description[name=?]", "notebook[description]"
      assert_select "input#notebook_token[name=?]", "notebook[token]"
    end
  end
end

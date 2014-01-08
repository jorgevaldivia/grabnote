require 'spec_helper'

describe "notebook/notes/new" do
  before(:each) do
    assign(:notebook_note, stub_model(Notebook::Note,
      :user => nil,
      :notebook => nil,
      :name => "MyString",
      :token => "MyString"
    ).as_new_record)
  end

  it "renders new notebook_note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notebook_notes_path, "post" do
      assert_select "input#notebook_note_user[name=?]", "notebook_note[user]"
      assert_select "input#notebook_note_notebook[name=?]", "notebook_note[notebook]"
      assert_select "input#notebook_note_name[name=?]", "notebook_note[name]"
      assert_select "input#notebook_note_token[name=?]", "notebook_note[token]"
    end
  end
end

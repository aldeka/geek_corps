require 'spec_helper'

describe "people/edit.html.erb" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :bio => "MyString",
      :location => "MyString",
      :lat => 1.5,
      :long => 1.5,
      :picture => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path(@person), :method => "post" do
      assert_select "input#person_bio", :name => "person[bio]"
      assert_select "input#person_location", :name => "person[location]"
      assert_select "input#person_lat", :name => "person[lat]"
      assert_select "input#person_long", :name => "person[long]"
      assert_select "input#person_picture", :name => "person[picture]"
    end
  end
end

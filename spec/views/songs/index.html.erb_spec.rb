require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        :name => "Name",
        :artist_id => 2,
        :genre_id => 3
      ),
      Song.create!(
        :name => "Name",
        :artist_id => 2,
        :genre_id => 3
      )
    ])
  end

  # it "renders a list of songs" do
  #   render
  #   assert_select "tr>td", :text => "Name".to_s, :count => 2
  #   assert_select "tr>td", :text => 2.to_s, :count => 2
  #   assert_select "tr>td", :text => 3.to_s, :count => 2
  # end
end

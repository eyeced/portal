require 'rails_helper'

RSpec.describe "task_comments/index", :type => :view do
  before(:each) do
    assign(:task_comments, [
      TaskComment.create!(
        :comment => "Comment",
        :task => nil
      ),
      TaskComment.create!(
        :comment => "Comment",
        :task => nil
      )
    ])
  end

  it "renders a list of task_comments" do
    render
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/drops/edit.html.erb" do
  include DropsHelper
  
  before(:each) do
    assigns[:drop] = @drop = stub_model(Drop,
      :new_record? => false
    )
  end

  it "should render edit form" do
    render "/drops/edit.html.erb"
    
    response.should have_tag("form[action=#{drop_path(@drop)}][method=post]") do
    end
  end
end



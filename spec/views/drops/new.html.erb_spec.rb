require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/drops/new.html.erb" do
  include DropsHelper
  
  before(:each) do
    assigns[:drop] = stub_model(Drop,
      :new_record? => true
    )
  end

  it "should render new form" do
    render "/drops/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", drops_path) do
    end
  end
end



require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/drops/index.html.erb" do
  include DropsHelper
  
  before(:each) do
    assigns[:drops] = [
      stub_model(Drop),
      stub_model(Drop)
    ]
  end

  it "should render list of drops" do
    render "/drops/index.html.erb"
  end
end


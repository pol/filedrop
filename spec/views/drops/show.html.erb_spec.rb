require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/drops/show.html.erb" do
  include DropsHelper
  before(:each) do
    assigns[:drop] = @drop = stub_model(Drop)
  end

  it "should render attributes in <p>" do
    render "/drops/show.html.erb"
  end
end


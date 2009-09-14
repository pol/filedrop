require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DropsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "drops", :action => "index").should == "/drops"
    end
  
    it "should map #new" do
      route_for(:controller => "drops", :action => "new").should == "/drops/new"
    end
  
    it "should map #show" do
      route_for(:controller => "drops", :action => "show", :id => 1).should == "/drops/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "drops", :action => "edit", :id => 1).should == "/drops/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "drops", :action => "update", :id => 1).should == "/drops/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "drops", :action => "destroy", :id => 1).should == "/drops/1"
    end
    
    it "should map /files/:uuid to #download" do
      route_for(:controller => 'drops', :action => 'download', :uuid => '12345').should == "/file/12345"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/drops").should == {:controller => "drops", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/drops/new").should == {:controller => "drops", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/drops").should == {:controller => "drops", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/drops/1").should == {:controller => "drops", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/drops/1/edit").should == {:controller => "drops", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/drops/1").should == {:controller => "drops", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/drops/1").should == {:controller => "drops", :action => "destroy", :id => "1"}
    end
    
    it "should generate params for #download" do
      params_from(:get, "/file/12345").should == {:controller => "drops", :action => "download", :uuid => "12345"}
    end
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DropsController do
  fixtures :users

  def mock_drop(stubs={})
    @mock_drop ||= mock_model(Drop, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose the current user's drops as @drops" do
      login_as :quentin
      Drop.should_receive(:find).and_return([mock_drop])
      get :index
      assigns[:drops].should == [mock_drop]
    end

    describe "with mime type of xml" do
  
      it "should render current user's drops as xml" do
        login_as :quentin
        request.env["HTTP_ACCEPT"] = "application/xml"
        Drop.should_receive(:find).and_return(drops = mock("Array of Drops"))
        drops.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested drop as @drop" do
      Drop.should_receive(:find).with("37").and_return(mock_drop)
      get :show, :id => "37"
      assigns[:drop].should equal(mock_drop)
    end
    
    describe "with mime type of xml" do

      it "should render the requested drop as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Drop.should_receive(:find).with("37").and_return(mock_drop)
        mock_drop.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new drop as @drop" do
      Drop.should_receive(:new).and_return(mock_drop)
      get :new
      assigns[:drop].should equal(mock_drop)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested drop as @drop" do
      Drop.should_receive(:find).with("37").and_return(mock_drop)
      get :edit, :id => "37"
      assigns[:drop].should equal(mock_drop)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created drop as @drop" do
        Drop.should_receive(:new).with({'these' => 'params'}).and_return(mock_drop(:save => true))
        post :create, :drop => {:these => 'params'}
        assigns(:drop).should equal(mock_drop)
      end

      it "should redirect to the created drop" do
        Drop.stub!(:new).and_return(mock_drop(:save => true))
        post :create, :drop => {}
        response.should redirect_to(drop_url(mock_drop))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved drop as @drop" do
        Drop.stub!(:new).with({'these' => 'params'}).and_return(mock_drop(:save => false))
        post :create, :drop => {:these => 'params'}
        assigns(:drop).should equal(mock_drop)
      end

      it "should re-render the 'new' template" do
        Drop.stub!(:new).and_return(mock_drop(:save => false))
        post :create, :drop => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested drop" do
        Drop.should_receive(:find).with("37").and_return(mock_drop)
        mock_drop.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :drop => {:these => 'params'}
      end

      it "should expose the requested drop as @drop" do
        Drop.stub!(:find).and_return(mock_drop(:update_attributes => true))
        put :update, :id => "1"
        assigns(:drop).should equal(mock_drop)
      end

      it "should redirect to the drop" do
        Drop.stub!(:find).and_return(mock_drop(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(drop_url(mock_drop))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested drop" do
        Drop.should_receive(:find).with("37").and_return(mock_drop)
        mock_drop.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :drop => {:these => 'params'}
      end

      it "should expose the drop as @drop" do
        Drop.stub!(:find).and_return(mock_drop(:update_attributes => false))
        put :update, :id => "1"
        assigns(:drop).should equal(mock_drop)
      end

      it "should re-render the 'edit' template" do
        Drop.stub!(:find).and_return(mock_drop(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested drop" do
      Drop.should_receive(:find).with("37").and_return(mock_drop)
      mock_drop.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the drops list" do
      Drop.stub!(:find).and_return(mock_drop(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(drops_url)
    end

  end

end

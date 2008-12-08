require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pages/show.html.erb" do
  include PagesHelper
  
  before(:each) do
    @page = mock_model(Page)
    @page.stub!(:title).and_return("MyString")
    @page.stub!(:body).and_return("MyText")
    @page.stub!(:published).and_return(false)
    @page.stub!(:style).and_return("MyString")
    @page.stub!(:permalink).and_return("MyString")

    assigns[:page] = @page

    template.stub!(:edit_object_url).and_return(edit_page_path(@page)) 
    template.stub!(:collection_url).and_return(pages_path) 
  end

  it "should render attributes in <p>" do
    render "/pages/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/als/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end


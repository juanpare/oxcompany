require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pages/index.html.erb" do
  include PagesHelper
  
  before(:each) do
    page_98 = mock_model(Page)
    page_98.should_receive(:title).and_return("MyString")
    page_98.should_receive(:body).and_return("MyText")
    page_98.should_receive(:published).and_return(false)
    page_98.should_receive(:style).and_return("MyString")
    page_98.should_receive(:permalink).and_return("MyString")
    page_99 = mock_model(Page)
    page_99.should_receive(:title).and_return("MyString")
    page_99.should_receive(:body).and_return("MyText")
    page_99.should_receive(:published).and_return(false)
    page_99.should_receive(:style).and_return("MyString")
    page_99.should_receive(:permalink).and_return("MyString")

    assigns[:pages] = [page_98, page_99]

    template.stub!(:object_url).and_return(page_path(@page)) 
    template.stub!(:new_object_url).and_return(new_page_path) 
    template.stub!(:edit_object_url).and_return(edit_page_path(@page)) 
  end

  it "should render list of pages" do
    render "/pages/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", false, 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end


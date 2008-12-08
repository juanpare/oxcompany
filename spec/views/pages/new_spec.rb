require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pages/new.html.erb" do
  include PagesHelper
  
  before(:each) do
    @page = mock_model(Page)
    @page.stub!(:new_record?).and_return(true)
    @page.stub!(:title).and_return("MyString")
    @page.stub!(:body).and_return("MyText")
    @page.stub!(:published).and_return(false)
    @page.stub!(:style).and_return("MyString")
    @page.stub!(:permalink).and_return("MyString")
    assigns[:page] = @page


    template.stub!(:object_url).and_return(page_path(@page)) 
    template.stub!(:collection_url).and_return(pages_path) 
  end

  it "should render new form" do
    render "/pages/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", pages_path) do
      with_tag("input#page_title[name=?]", "page[title]")
      with_tag("textarea#page_body[name=?]", "page[body]")
      with_tag("input#page_published[name=?]", "page[published]")
      with_tag("input#page_style[name=?]", "page[style]")
      with_tag("input#page_permalink[name=?]", "page[permalink]")
    end
  end
end



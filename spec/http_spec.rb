require 'spec_helper'
require 'date'

describe "Todos Tests" do  
  before :each do 
    delete_all
    hash = [
         {title: "Todo one", due: Date.today.to_s},
         {title: "Todo two", due: Date.today.to_s},
         {title: "Todo three", due: Date.today.to_s},
         {title: "Todo four", due: Date.today.to_s},
         {title: "Todo five", due: Date.today.to_s},
          ]
   create_todos hash
  end
  
  after :all do
    delete_all
  end
  
=begin
    
  # Test 1 - To POST a todo with only title
  it "Should try to create a todo item with only a title" do
    title = "Romeo"
   
    r = HTTParty.post url("/todos"),
                      query: {title: title}                  
    expect(r.code).to eq(422)
   end
    
  # Test 2 - To POST a todo with only a date
    it "Should try to create a todo item with only a date" do
    due_date = "2014-01-01"
   
    r = HTTParty.post url("/todos"),
                      query: {due: due_date}                  
    expect(r.code).to eq(422)
   end
    
  # Test 3 - To POST a correct item 
  it "Should create a todo item" do
    title = "Romeo"
    due_date = "2015-01-01"
    
    r = HTTParty.post url("/todos"),
                      query: {
                        title: title,
                        due: due_date
                      }
    expect(r.code).to eq(201)
    expect(r["title"]).to eq(title)
    expect(r["due"]).to eq(due_date)
  end


    #Test 4 - To POST a blank item
    it "Should try to create a todo item with nothing at all" do
        
        r = HTTParty.post url("/todos"),
                        query: {
                            }
        expect(r.code).to eq(422)
    end

    #Test 5 - To GET an item without a title or date
    it "Should try to get item info without any data" do
        
        r = HTTParty.get url("/todos"),
                        query: {
                            }
        expect(r.code).to eq(200)
    end
    
    #Test 6 - To PUT a blank item
    it "Should try to put item info without any data" do
        
        r = HTTParty.put url("/todos"),
                        query: {
                            }
        expect(r.code).to eq(405)
        end
    
    #Test 7 - To DELETE a blank item
    it "Should try to put item info without any data" do
        
        r = HTTParty.delete url("/todos"),
                        query: {
                            }
        expect(r.code).to eq(405)
        end


    
    #Test 8
    #Test 9
    
    #Test 10 - To POST a blank item
    it "To POST a correct item" do  
    title = "aaron"
    due_date = "1991-27-07"
        
        r = HTTParty.post url("/todos/1"),
                        query: {
                            title: title,
                            due_date: due_date
                            }
        expect(r.code).to eq(405)
        
  end
=end
end
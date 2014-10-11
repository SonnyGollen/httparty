require 'spec_helper'
require 'date'

describe "Empty collection Todos tests:" do  

  
  after :all do
    delete_all
  end
  
    
  # Test 1
  it "Should try to POST a Todo item with only a title" do
    title = "Romeo"
   
    r = HTTParty.post url("/todos"),
                      query: {title: title}                  
    expect(r.code).to eq(422)
   end
    
  # Test 2
    it "Should try to POST a Todo item with only a date" do
    due_date = "2014-01-01"
   
    r = HTTParty.post url("/todos"),
                      query: {due: due_date}                  
    expect(r.code).to eq(422)
   end
    
  # Test 3
  it "Should POST a Todo item" do
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


    #Test 4
    it "Should try to POST a Todo item with blank parameters" do
        
        r = HTTParty.post url("/todos"),
                        query: {
                            }
        expect(r.code).to eq(422)
    end

    #Test 5
    it "Should GET Todo item info with blank parameters" do
        
        r = HTTParty.get url("/todos"),
                        query: {
                            }
        expect(r.code).to eq(200)
    end
    
    #Test 6
    it "Should try to PUT Todo item info with blank parameters" do
        
        r = HTTParty.put url("/todos"),
                        query: {
                            }
        expect(r.code).to eq(405)
        end
    
    #Test 7
    it "Should try to DELETE Todo item" do
        
        r = HTTParty.delete url("/todos"),
                        query: {
                            }
        expect(r.code).to eq(405)
        end


end
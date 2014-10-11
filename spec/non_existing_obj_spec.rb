require 'spec_helper'
require 'date'

describe "Non existing object tests:" do  
  before :each do 
    hash = [
         {title: "Dave", due: Date.today.to_s},
         {title: "Lister", due: Date.today.to_s},
         {title: "Cat", due: Date.today.to_s},
         {title: "Kryten", due: Date.today.to_s},
         {title: "Holly", due: Date.today.to_s},
          ]
   create_todos hash
  end
  
  after :all do
    delete_all
  end
  
    
    #Test 1
    it "Should try to GET Todo item info with blank parameters" do
        
        r = HTTParty.get url("/todos/1"),
                        query: {
                            }
        expect(r.code).to eq(404)
    end
    
    
    #Test 2
    it "Should try POST a correct item" do  
    title = "aaron"
    due_date = "1991-27-07"
        
        r = HTTParty.post url("/todos/1"),
                        query: {
                            title: title,
                            date: due_date
                            }
        expect(r.code).to eq(405)
        
  end

    
    #Test 3
    it "Should try to POST Todo item info with blank parameters" do
        
        r = HTTParty.post url("/todos/1"),
                        query: {
                            }
        expect(r.code).to eq(405)
    end
    

    #Test 4
    it "Should try to PUT Todo item with blank parameters" do
        
        r = HTTParty.put url("/todos/1"),
                        query: {
                            }
        expect(r.code).to eq(422)
    end
    
    #Test 5
    it "Should try to PUT Todo item with valid parameters" do
        
    title = "aaron"
    due_date = "1991-07-21"
        
        r = HTTParty.put url("/todos/1"),
                        query: {
                            title: title,
                            due: due_date
                            }
        expect(r.code).to eq(404)
    end

    
    #Test 6
    it "Should try to DELETE Todo item with blank parameters" do
        
        r = HTTParty.delete url("/todos/1"),
                        query: {
                            }
        expect(r.code).to eq(404)
    end
    
    
end
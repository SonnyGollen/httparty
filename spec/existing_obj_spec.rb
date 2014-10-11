require 'spec_helper'
require 'date'

describe "Existing object tests:" do  
  before :each do 
    delete_all
    hash = [
         {title: "Dave", due: Date.today.to_s},
         {title: "Lister", due: Date.today.to_s},
         {title: "Cat", due: Date.today.to_s},
         {title: "Kryten", due: Date.today.to_s},
         {title: "Holly", due: Date.today.to_s},
          ]
   create_todos hash
    get_id_all
  end
  
  after :all do
    delete_all
  end
    
    
    #Test 1
    it "Should GET a Todo Item" do
        
        r = HTTParty.get url("/todos/#{@id[0]["id"]}")
            #query: {}
            # puts @id[0][:id]
    
    expect(r.code).to eq(200)
    
    end

    #Test 2
    it "Should try to POST item with blank parameters" do
        
        r = HTTParty.post url("/todos/30"),
                        query: {
                            }
        expect(r.code).to eq(405)
    end

    
    #Test 3
    it "Should try to POST item with valid parameters" do
        
    title = "aaron"
    due_date = "1991-27-07"
        
        r = HTTParty.post url("/todos/30"),
                        query: {
                            title: title,
                            due: due_date
                            }
        expect(r.code).to eq(405)
    end

    #Test 4
    it "Should try to PUT item with empty parameters" do
        
        r = HTTParty.put url("/todos/30"),
                        query: {
                            }
        expect(r.code).to eq(422)
    end

    #Test 5
    it "Should GET a Todo Item" do
    
    title = "aaron"
    due_date = "1991-27-07"
        
        r = HTTParty.get url("/todos/#{@id[0]["id"]}"),
                      query: {
                        title: title,
                        due: due_date
                      }
    expect(r.code).to eq(200)
    end


    #Test 6
    it "Should DELETE the Todo with an ID" do
    r = HTTParty.delete url("/todos/#{@id[0]["id"]}"),
                      query: {}
    expect(r.code).to eq(204)
  end
    
    
end
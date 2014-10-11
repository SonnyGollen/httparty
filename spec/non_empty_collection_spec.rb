require 'spec_helper'
require 'date'

describe "Non empty collection tests:" do  
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
    it "Should GET Todo item info without any data" do
        
        r = HTTParty.get url("/todos"),
                        query: {
                            }
        expect(r.code).to eq(200)
    end
    
    
end
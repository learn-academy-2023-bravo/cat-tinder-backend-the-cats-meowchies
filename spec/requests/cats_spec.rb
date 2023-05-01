require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        
          name:'ChiChi',
          age:10 ,
          enjoys:'building up the man, by breaking him down',
          image:'https://upload.wikimedia.org/wikipedia/commons/4/43/Coq_orpington_fauve.JPG'
      
      )
      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Krillin',
          age: 3,
          enjoys: 'watching television',
          image: 'https://cf.ltkcdn.net/birds/bird-names/images/orig/319999-1600x1066-funny-names-for-chicken.jpg'
        }
      }
      post '/cats', params: cat_params
      expect(response).to have_http_status(200)
      cat = Cat.first
      expect(cat.name).to eq 'Krillin'
    end
  end
end



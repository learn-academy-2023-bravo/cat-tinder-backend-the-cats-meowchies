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

  
    it "should validate name" do
      cat = Cat.create(age:2, enjoys:"playing with dogs", image:"url.com")
      expect(cat.errors[:name]).to_not be_empty
    end

    it "should validate age" do
      cat = Cat.create(name:"dude", enjoys:"playing with dogs", image:"url.com")
      expect(cat.errors[:age]).to_not be_empty
    end

    it "should validate enjoys" do
      cat = Cat.create(name:"dude", age:2, image:"url.com")
      expect(cat.errors[:enjoys]).to_not be_empty
    end

    it "should validate image" do
      cat = Cat.create(name:"dude", age:2, enjoys:"chicken")
      expect(cat.errors[:image]).to_not be_empty
    end

    it "doesn't create a cat without a name" do
      cat_params = {
        cat: {
          age: 2,
          enjoys: 'walks in the park',
          image: 'www.image.com'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['name']).to include "can't be blank"
    end
    
    it 'doesnt create a cat without a age' do
      cat_params = {
        cat: {
          name: 'Piccolo',
          enjoys: 'walks in the park',
          image: 'www.image.com'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['age']).to include "can't be blank"
    end

    it 'doesnt create a cat without a enjoys' do
      cat_params = {
        cat: {
          name: 'Piccolo',
          age: 1,
          image: 'www.image.com'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['enjoys']).to include "can't be blank"
    end

    it 'doesnt create a cat without a image' do
      cat_params = {
        cat: {
          name: 'Piccolo',
          age: 1,
          enjoys: 'coding'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"
    end
  
    it 'should have an enjoys statment >= 10' do
      cat = Cat.create(name:'Mr. Popo', age:100, enjoys: 'less<10', image: 'url')
      expect(cat.errors[:enjoys]).to_not be be_empty
    end
end







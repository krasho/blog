FactoryGirl.define do 
   factory :post do 
   	   title {Faker::Lorem.word}
   	   body {Faker::Lorem.paragraphs}
   	   is_published  true
   	   publish_date {Faker::Date.forward(0)}
   end
end
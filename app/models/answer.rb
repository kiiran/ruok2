class Answer < ApplicationRecord
  belongs_to :question

  def get_sentiment
    @text = self.content
    # These code snippets use an open-source library. http://unirest.io/ruby
    response = Unirest.post "https://japerk-text-processing.p.mashape.com/sentiment/",
    headers:{
      "X-Mashape-Key" => ENV["x_mashape_key"],
      "Content-Type" => "application/x-www-form-urlencoded",
      "Accept" => "application/json"
    },
    parameters:{
      "language" => "english",
      "text" => @text
    }
    sentiment_hash = {
      pos: response.body["probability"]["pos"],
      neutral: response.body["probability"]["neutral"],
      neg: response.body["probability"]["neg"],
      label: response.body["label"]
    }



  end
end

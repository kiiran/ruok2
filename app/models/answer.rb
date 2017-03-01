class Answer < ApplicationRecord
  belongs_to :question

  def get_sentiment
    @text = self.content
    @x_mashape_key = "RXl94q5a12mshmKgwfPamJO9J2TBp1dyeKhjsnRH8HxCkDVnuO"
    # These code snippets use an open-source library. http://unirest.io/ruby
    response = Unirest.post "https://japerk-text-processing.p.mashape.com/sentiment/",
    headers:{
      "X-Mashape-Key" => @x_mashape_key,
      "Content-Type" => "application/x-www-form-urlencoded",
      "Accept" => "application/json"
    },
    parameters:{
      "language" => "english",
      "text" => @text
    }

  end
end

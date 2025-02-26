class BitcoinsController < ApplicationController

  def index
    # add backend code

    @bitcoin = params["amount"]


    require "net/http"
    require "json"
    url = "https://blockchain.info/ticker"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    bitcoin_data = JSON.parse(response)
    # ----------------------
  
    # using the API, extract current rate of bitcoin in USD
    @usd_rate = bitcoin_data["USD"]["last"]
  
    # calculate value in USD of user's bitcoin
    @usd_value = @usd_rate * @bitcoin.to_f

    # render bitcoins/index view
  end

end
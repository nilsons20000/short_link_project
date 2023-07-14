class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  @@links_hash = {}

  def get_random_short_symbol
    short_link_generate_five_symbol = rand(36**5).to_s(36)
    if @@links_hash.has_key?(short_link_generate_five_symbol)
      return get_random_short_symbol(links_hash)
    end
    short_link_generate_five_symbol
  end

  def encode
    long_link = params[:long_link]
    short_link = get_random_short_symbol
    @@links_hash[short_link] = {
      "long_link" => long_link,
      "short_link" => short_link
    } 
    render json: { encoded_string: @@links_hash }
  end


  def decode
    short_link = params[:short_link]
    puts @@links_hash
    if @@links_hash.has_key?(short_link)
      puts short_link
        @long_link_from_array = @@links_hash[short_link]
        render json: { encoded_string: @long_link_from_array }
    end

    


    
  end



end

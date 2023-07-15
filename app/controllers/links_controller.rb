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
      "short_link" => URI.parse(request.original_url) + short_link
    } 
    render json: { encoded_long_link_to_short: @@links_hash[short_link]}
  end


  def decode
    short_link = params[:short_link]
    get_url_domain = URI.parse(request.original_url).host
    link_merge_original_and_short = URI.parse(request.original_url) + short_link
    get_short_symbol_after_domain = link_merge_original_and_short.request_uri.split("/").last
     if @@links_hash.has_key?(get_short_symbol_after_domain)
         @long_link_from_array = @@links_hash[get_short_symbol_after_domain]
         render json: { decode_short_link_to_long: @long_link_from_array }
     else
         render json: { decode_short_link_to_long: "Not Found" }
     end
    
  end

end

class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  @@links_hash = {}

  def get_random_short_symbol
    short_link_generate_five_symbol = rand(36**5).to_s(36)
    if @@links_hash.has_key?(short_link_generate_five_symbol)
      get_random_short_symbol(links_hash)
    end
    short_link_generate_five_symbol
  end

  def sanitize(long_link)
    long_link.strip
    sanitize_url = long_link.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    "http://#{sanitize_url}"
  end

  def encode
    long_link = sanitize(params[:long_link])
    short_link = get_random_short_symbol
    @@links_hash[short_link] = {
      "long_link" => long_link,
      "short_link" => URI.parse(request.original_url) + short_link
    } 
    render json: { encoded_long_link_to_short: @@links_hash[short_link]["short_link"]}
  end

  def decode 
    short_link = sanitize(params[:short_link])
    get_short_symbol_after_domain = short_link.split("/").last
      if @@links_hash.has_key?(get_short_symbol_after_domain)
        if (@@links_hash[get_short_symbol_after_domain]["short_link"].to_s == short_link.to_s)
           @long_link_from_array = @@links_hash[get_short_symbol_after_domain]
           render json: { decode_short_link_to_long:  @long_link_from_array["long_link"]}
        else
          render json: { decode_short_link_to_long: "Not Found" }
        end
      else
        render json: { decode_short_link_to_long: "Not Found" }
      end
  end

end

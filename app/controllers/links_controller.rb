class LinksController < ApplicationController

  @@links_hash = {}

  def index
    link = get_random_short_symbol
    @@links_hash[link] = { "link" => link}
    @variable = @@links_hash
  end

  def get_random_short_symbol
    short_link = rand(36**5).to_s(36)
    if @@links_hash.has_key?(short_link)
      return get_random(links_hash)
    end
    short_link
  end



end

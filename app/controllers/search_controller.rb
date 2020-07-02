class SearchController < ApplicationController

  def index
    search_results = SearchResults.new
    @members = search_results.members(params[:state])
  end
end
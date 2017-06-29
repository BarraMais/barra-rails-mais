class SearchController < ApplicationController
  before_action :authenticate_user!
  
  def look_for
    query_param = params[:query_param]
    users = User.where("lower(first_name) LIKE :query_param OR lower(last_name) LIKE :query_param", query_param: "%#{query_param.downcase}%")
    events = Event.where('lower(name) LIKE :query_param OR lower(about) LIKE :query_param', query_param: "%#{query_param.downcase}%")
    groups = Group.where('lower(name) LIKE :query_param OR lower(about) LIKE :query_param', query_param: "%#{query_param.downcase}%")
    @search_results = users + events + groups
  end
end

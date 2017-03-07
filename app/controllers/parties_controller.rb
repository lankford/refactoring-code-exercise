class PartiesController < ApplicationController

  def index
    sort_field = params[:sort] || 'when'
    sort_order = (params[:asc].blank? || params[:asc] == 'true') ? 'DESC' : 'ASC'
    @parties = Party.order("#{sort_field} #{sort_order}").all
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(params[:party])

    if @party.save
      redirect_to parties_url
    else
      flash[:notice]="Party was incorrect."
      redirect_to new_party_url
    end

  end

end

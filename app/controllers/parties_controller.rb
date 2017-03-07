class PartiesController < ApplicationController

  def index
    @parties = Array.new

    if !params[:sort].blank?
      order = "#{params[:sort]} #{(params[:asc].blank? || params[:asc] == 'true') ? 'DESC' : 'ASC'}"
      Party.order(order).all.each do |party|
        @parties << party
      end
    else
      order = "when #{(params[:asc].blank? || params[:asc] == 'true') ? 'DESC' : 'ASC'}"
      @parties = Party.order(order).all
    end
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

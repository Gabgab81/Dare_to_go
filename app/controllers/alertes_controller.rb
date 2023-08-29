class AlertesController < ApplicationController
  def index
    @dares = current_user.dares.where(progress: "failed", display_alerte: "unshow")
    # .map{|dare| dare.challenge.name}
    if @dares.first
      @dare = @dares.first
      @dare.display_alerte = "fail"
      @dare.save
      name = @dare.challenge.name
    else
      name = nil
    end
    respond_to do |format|
        format.html
        format.json { render json: { alertes: name } }
      end
  end

end

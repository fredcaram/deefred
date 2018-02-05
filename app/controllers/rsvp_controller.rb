class RsvpController < ApplicationController
  def create
    @rsvp = Rsvp.create(save_params)
    if @rsvp.save
      flash[:message] = "Sua presença foi registrada com sucesso. Obrigado!"
    else
      flash[:message] = "Não foi possível registrar sua presença, por favor tente novamente"
    end
    redirect_back fallback_location: root_path
  end


  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def save_params
      params.require(:rsvp).permit(:name, :email)
    end

end

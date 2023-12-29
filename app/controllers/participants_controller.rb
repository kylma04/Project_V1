class ParticipantsController < ApplicationController
  def index
  end
  
  # before_action :set_participant, only: [:show, :edit, :update, :destroy]
  # def show
  #   @participant = Participant.new
  #   @administrator = Administrator.new
  # end

  
  # def create
  #   @participant = Participant.new(participant_params)
  #   if @participant.save
  #     redirect_to participants_path, notice: 'Enregistrement effectué avec succés'
  #   else
  #     redirect_to participants_path, notice: 'Enregistrement echoué'
  #   end
  # end


  # private
  # def set_participant
  #   @participant=Participant.find(params[:id])
  # end
  
  # def participant_params
  #   params.require(:participant).permit(:firstname, :lastname, :age, :email, :phone, :password)
  # end


  # index, show, new, create, edit, update, destroy
end

class ParticipantsController < ApplicationController

  before_action :set_participant, only: [:update, :edit, :destroy, :confirm_destroy]

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to admin_settings_path, notice: 'Participant a été crée avec succès.'
    else
      render :new
    end
  end

  # def update_password

  #   participant = Participant.find_by(session[:participant_id])

  #   if (participant.authenticate(params[:password]))
  #     participant.update()
  #     redirect_to calendriers_path, notice: "Modification effectuée avec succès"
  #   else
  #     redirect_to connexion_index_path, notice: "INVALID PASSWORD"
  #   end

  # end

  def edit
  end

  def update
    if @participant.update(participant_params)
      redirect_to calendriers_path, notice: 'Vos informations ont étés mise à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @participant.destroy
    redirect_to admin_settings_path
  end

  def show
    @participants = Participant.all
  end

  def confirm_destroy
  end



  private

  def set_participant
    @participant = Participant.find(params[:id])
  end
  
  def participant_params
    params.require(:participant).permit(:firstname, :lastname, :age, :email, :phone, :password)
  end
end
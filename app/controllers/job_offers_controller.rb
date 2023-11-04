class JobOffersController < ApplicationController
  
    def new
      @job_offer = JobOffer.new
    end

    def create
      @job_offer = current_user.job_offers.new(job_offer_params)
    
      if @job_offer.save
        redirect_to @job_offer, notice: 'Oferta de trabajo creada con éxito.'
      else
        render :new
      end
    end

    def show
      @job_offer = JobOffer.find(params[:id])
    end
    
    
    def job_offer_params
      params.require(:job_offer).permit(:title, :position, :description, :salary, :availability) # ... y cualquier otro campo que tengas en el formulario
    end

    def edit
      @job_offer = JobOffer.find(params[:id])
    end
    
    def update
      @job_offer = JobOffer.find(params[:id])
    
      if @job_offer.update(job_offer_params)
        redirect_to @job_offer, notice: 'Oferta de trabajo actualizada con éxito.'
      else
        render :edit
      end
    end
    

    
end
  
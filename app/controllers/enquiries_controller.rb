class EnquiriesController < ApplicationController
  before_action :require_admin,only: [:index]
  def index
    @enquiries=Enquiry.all
  end
  def new
    @enquiry=Enquiry.new
  end

  def create
    @enquiry=Enquiry.new(enquiry_params)

    if @enquiry.save
        flash[:notice]="Message Send Successfully"
        redirect_to root_path
    else
        render new_enquiry_path(@enquiry) , status: :unprocessable_entity
    end
end

  private
   def find_enquiry
      @enquiry=Enquiry.find(params[:id])
   end
   def enquiry_params
      params.require(:enquiry).permit(:name, :email,:subject,:meassage)
   end
   def require_admin
    if !current_user&.admin?
      flash[:alert]="Admin Featured Actions!"
      redirect_to contact_path
    end
   end
end

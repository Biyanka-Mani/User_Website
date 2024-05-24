class EnquiriesController < ApplicationController
  
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
        redirect_to new_enquiry_path
    else
        flash[:alert]="Message is not Send "
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
end

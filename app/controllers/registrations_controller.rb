# controller in progress for overriding devise
# not yet implemented

##########################################################
# still need to create unsubscribe token on registration #
##########################################################

class RegistrationsController < Devise::RegistrationsController

  def email_unsubscribe
  
    token = params[:token]
    email = params[:email]
    
    @user = User.where(:email => email, :cancel_token => token).first 
    
    @lamb = @user

    respond_to do |format|
      format.html
    end
    
  end

end
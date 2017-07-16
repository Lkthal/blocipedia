class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end

    def downgrade_account
        current_user.update_attribute(:role, 'standard')
        redirect_to :back
    end
end
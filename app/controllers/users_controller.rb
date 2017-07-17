class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end

    def downgrade_account
        current_user.update_attribute(:role, 'standard')
        current_user.wikis.each do |wiki|
            wiki.update_attribute(:private, false)
        end
        redirect_to :back
    end
end
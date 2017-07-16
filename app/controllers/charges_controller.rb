class ChargesController < ApplicationController

    after_action :upgrade_account, only: :create

    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "Premium Membership - #{current_user.name}",
            amount: 15_00
        }
    end

    def create
        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )

        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: 15_00,
            description: "Premium Membership - #{current_user.email}",
            currency: 'usd'
        )

        flash[:notice] = "Thanks for all the money, #{current_user.name}! Feel free to pay me again!"
        redirect_to user_path(current_user)

        rescue Stripe::CardError => e
            flash[:alert] = e.message
            redirect_to new_charge_path
    end

    private

    def upgrade_account
        current_user.update_attribute(:role, 'premium')
    end
end

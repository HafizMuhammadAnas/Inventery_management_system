class PaymentsController < ApplicationController
	before_action :set_payment, only: [:show, :edit, :update, :destroy]

	# GET /payments
	# GET /payments.json
	def index
		@payments = Payment.all
	end

	# GET /payments/1
	# GET /payments/1.json
	def show
	end

	# GET /payments/new
	def new
		@payment = Payment.new
	end

	# GET /payments/1/edit
	def edit
	end

	# POST /payments
	# POST /payments.json
	def create
		@payment = Payment.new(payment_params)

		if @payment.save
      redirect_to @payment
    else
      render :new, status: :unprocessable_entity
    end
	end

	# PATCH/PUT /payments/1
	# PATCH/PUT /payments/1.json
	def update
		respond_to do |format|
			if @payment.update(payment_params)
				format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
				format.json { render :show, status: :ok, location: @payment }
			else
				format.html { render :edit }
				format.json { render json: @payment.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /payments/1
	# DELETE /payments/1.json
	def destroy
		@payment.destroy
		respond_to do |format|
			format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_payment
			@payment = Payment.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def payment_params
			params.require(:payment).permit(:payment_date, :amount, :change_amount, :order_id)
		end
end

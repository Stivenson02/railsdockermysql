class CallapiController < ApplicationController
    
    def create
        data_form = {
            operator: params['operator'],
            phone: params['phone'],
            amount: params['amount'],
        }

        callapipracti = RestApiService.new(data_form: data_form).call
        responseapi = Responapi.new
        responseapi.estado = callapipracti[:response][:data]["estado"]
        responseapi.respuesta = callapipracti[:response][:data]["respuesta"]
        responseapi.saldo = callapipracti[:response][:data]["saldo"]
        responseapi.save

        respond_to do |format|
            format.html { redirect_to response_path }
        end
        
    end
  
    def show
        @response = Responapi.all
    end
  end
  
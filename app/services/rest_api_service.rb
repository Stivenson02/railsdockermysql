class RestApiService

    attr_accessor :response, :data, :api
  
    RETURNS = [
      SUCCESS = :success,
      FAILED = :failed
    ].freeze
  
    def initialize(data_form: nil)
        self.data = data_form.nil? ? nil : {
            "idcomercio":1425,
            "claveventa":1234,
            "idtrans":1,
            "celular": data_form['phone'],
            "operador": data_form['operator'],
            "valor": data_form['amount'],
            "jsonAdicional":""
        } 
        self.api ={ url: 'https://recargas.practisistemas.com/api_test/pracRec'}
    end
  
    def call
      begin
        conn = Faraday.new(:url => api[:url])
        self.response= conn.post do |req|
            req.headers['Content-Type'] = 'application/json'
            req.body =data.to_json
        end
      rescue => e
        { status: FAILED, response: { error: e.to_s } }
      end
      { status: SUCCESS, response: { data: JSON.parse(response.body) } }
    end
  end
  
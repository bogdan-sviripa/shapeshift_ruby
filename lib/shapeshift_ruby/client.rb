require 'rest-client'
require 'json'

module ShapeShiftRuby
  class Client
    API_URL = 'https://shapeshift.io'.freeze

    # GET Requests

    def rate(pair:)
      api_request(url: url("rate/#{pair}"), method: 'get')
    end

    def limit(pair:)
      api_request(url: url("limit/#{pair}"), method: 'get')
    end

    def market_info(pair:)
      api_request(url: url("marketinfo/#{pair}"), method: 'get')
    end

    def recent_transactions(max:)
      api_request(url: url("recenttx/#{max}"), method: 'get')
    end

    def transaction_status(deposit_address:)
      api_request(url: url("txStat/#{deposit_address}"), method: 'get')
    end

    def time_remaining(deposit_address:)
      api_request(url: url("timeremaining/#{deposit_address}"), method: 'get')
    end

    def coins
      api_request(url: url('getcoins'), method: 'get')
    end

    def validate_address(address:, coin_symbol:)
      api_request(url: url("validateAddress/#{address}/#{coin_symbol}"), method: 'get')
    end

    def transaction_by_api_key(api_key:)
      api_request(url: url("txbyapikey/#{api_key}"), method: 'get')
    end

    def transaction_by_address(address, api_key:)
      api_request(url: url("txbyaddress/#{address}/#{api_key}"), method: 'get')
    end

    # Post requests

    def shift(withdrawal:, pair:, return_address: '', dest_tag: '', rs_address: '', api_key: '')
      api_request(url: url('shift'), method: 'post', params: {
          pair: pair,
          withdrawal: withdrawal,
          returnAddress: return_address,
          destTag: dest_tag,
          rsAddress: rs_address,
          apiKey: api_key
      })
    end


    def mail(email:, transaction_id:)
      api_request(url: url('mail'), method: 'post', params: { email: email, txid: transaction_id })
    end

    def fixed_amount_transaction(withdrawal:, pair:, amount:, return_address: '', dest_tag: '', rs_address: '', api_key: '')
      api_request(url: url('sendamount'), method: 'post', params: {
          amount: amount,
          pair: pair,
          withdrawal: withdrawal,
          returnAddress: return_address,
          destTag: dest_tag,
          rsAddress: rs_address,
          apiKey: api_key
      })
    end

    def cancel_pending(address:)
      api_request(url: url('cancelpending'), method: 'post', params: { address: address })
    end

    private

    def url(path)
      "#{API_URL}/#{path}"
    end

    def api_request(url:, method:, params: {})
      data = RestClient::Request.execute(
          method: method,
          url: url,
          payload: params,
      )
      JSON.parse(data)
    end
  end
end
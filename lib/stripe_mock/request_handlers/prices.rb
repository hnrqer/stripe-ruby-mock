module StripeMock
  module RequestHandlers
    module Prices
      def self.included(base)
        base.add_handler 'post /v1/prices',        :create_price
        base.add_handler 'get /v1/prices/(.*)',    :retrieve_price
        base.add_handler 'post /v1/prices/(.*)',   :update_price
        base.add_handler 'get /v1/prices',         :list_price
      end

      def create_price(_route, _method_url, params, _headers)
        params[:id] ||= new_id('price')
        validate_create_price_params(params)
        prices[params[:id]] = Data.mock_price(params)
      end

      def retrieve_price(route, method_url, _params, _headers)
        # id = method_url.match(route).captures.first
        # assert_existence :product, id, products[id]
      end

      def update_price(route, method_url, params, _headers)
        # id = method_url.match(route).captures.first
        # product = assert_existence :product, id, products[id]

        # product.merge!(params)
      end

      def list_price(_route, _method_url, params, _headers)
        # limit = params[:limit] || 10
        # Data.mock_list_object(products.values.take(limit), params)
      end
    end
  end
end

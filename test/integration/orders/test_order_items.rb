require 'integration_helper'
require 'mws/orders'

class OrderItemsTest < IntegrationTest
  self.api = MWS::Orders

  def sample_amazon_order_id(client)
    order = client.list_orders(created_after: Date.today - 365).to_a.sample
    order.amazon_order_id
  end

  def test_list_order_items
    @clients.each do |client|
      amazon_order_id = sample_amazon_order_id(client)
      order_items = client.list_order_items(amazon_order_id)
      refute_empty order_items
    end
  end
end

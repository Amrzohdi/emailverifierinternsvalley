price_rate_conf_array = [{price: 15, shipping_cost_rate: 0.75}, {price: 25, shipping_cost_rate: 0.775},
                         {price: 50, shipping_cost_rate: 0.8}, {price: 75, shipping_cost_rate: 0.825},
                         {price: 100, shipping_cost_rate: 0.85}, {price: 200, shipping_cost_rate: 0.875},
                         {price: 400, shipping_cost_rate: 0.9}, {price: 600, shipping_cost_rate: 0.925},
                         {price: Float::INFINITY, shipping_cost_rate: 0.95}]



price_rate_conf_array.each do |price_rate_conf|
  if price_reference < price_rate_conf[:price]
    @price_original = (price_reference - product_database.shipping_cost * price_rate_conf[:shipping_cost_rate])
    break
  end
end

if brand.rating == high
  @price_original = @price_original * 1.1
elsif brand.rating == low
  @price_original = @price_original * 0.9
end
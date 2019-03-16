price_rate_conf_array = [
    {price: 15, shipping_cost_rate: 0.75},
    {price: 25, shipping_cost_rate: 0.775},
    {price: 50, shipping_cost_rate: 0.8},
    {price: 75, shipping_cost_rate: 0.825},
    {price: 100, shipping_cost_rate: 0.85},
    {price: 200, shipping_cost_rate: 0.875},
    {price: 400, shipping_cost_rate: 0.9},
    {price: 600, shipping_cost_rate: 0.925},
    {price: Float::INFINITY, shipping_cost_rate: 0.95}
]


price_original =
    case brand.rating
      when high
        1.1
      when low
        0.9
      else
        1
    end

price_rate_conf_array.each do |price_rate_conf|
  if price_reference < price_rate_conf[:price]
    price_original = price_original * (price_reference - product_database.shipping_cost * price_rate_conf[:shipping_cost_rate])
    break
  end
end


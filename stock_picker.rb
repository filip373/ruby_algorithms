def stock_picker days
  buy = sell = -1
  day_buy = day_sell = -1
  for i in 0..(days.length - 2)
    cur_buy = days[i]
    cur_sell = days[(i + 1)..-1].max
    if cur_sell > cur_buy && cur_sell - cur_buy > sell - buy
      buy = cur_buy
      sell = cur_sell
      day_buy = i
      day_sell = days[(i + 1)..-1].index(cur_sell) + i + 1
    end
  end
  return [day_buy, day_sell]
end

p stock_picker([17,3,6,9,15,8,6,1,10])

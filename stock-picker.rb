def stock_picker(array)
  profit_possibilities = {}
  array.each_with_index do |price, index|
    cut_array = array.slice(index, array.length)
    buy_price = cut_array[0]
    profitable = cut_array.select { |sell_price| sell_price > buy_price }
    next if profitable.empty?
    margins =  profitable.map { |sell_price| sell_price - buy_price }
    jackpot = []
    jackpot.push(profitable.max).push(margins.max)
    profit_possibilities[buy_price] = jackpot
  end
sell_price = profit_possibilities.values.max[0]
buy_price = profit_possibilities.select { |key, value|  value[1] == (profit_possibilities.values.max[1]) }.keys[0]
profit = profit_possibilities.values.max[1]
investment_days = [array.index(buy_price), array.index(sell_price)]
"#{investment_days} for a profit of $#{sell_price} - $#{buy_price} == $#{profit}"
end


p stock_picker([17,3,6,9,15,8,6,1,10])
#  => [1,4] for a profit of $15 - $3 == $12
p stock_picker([17,3,6,9,15,8,6,1,10].shuffle)
p stock_picker([1000, 100, 50, 8, 100, 100, 50, 65, 80, 1])

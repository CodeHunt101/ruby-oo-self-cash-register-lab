class CashRegister
  attr_accessor :total, :discount
  attr_reader :items, :transaction_tracker

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
    @transaction_tracker = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    i = quantity
    while i > 0
      @items << title
      i-=1
    end
    @transaction_tracker << {:title=>title, :totalItem=>price*quantity}
    puts (@transaction_tracker.inspect)
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = @total - @total*(@discount)/100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @transaction_tracker[-1][:totalItem]
    @items.pop
    @transaction_tracker.pop
  end

end

module ApplicationHelper
  def items_number
    if @cart.line_items.count > 0
      counter = 0
      @cart.line_items.each do |item|
        counter += item.quantity
    end
  end
        return "<span> #{counter}</span>".html_safe
  end

  def cart_has_items
    return @cart.line_items.count > 0
  end

end

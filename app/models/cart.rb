class Cart < ApplicationRecord

belongs_to :user
has_many :line_items
has_many :items, through: :line_items

# before_save :update_total
# before_create :update_status


  def add_item(item)
    current_item = line_items.find_by(item_id: item.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(item_id: item.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |line_item| line_item.total_price }
  end

  def calculate_total
    self.line_items.collect { |item| item.product.price * item.quantity }.sum
  end

  private

  def update_status
    if self.status == nil?
      self.status = "In progress"
    end
  end

  def update_total
    self.total_price = calculate_total
  end
  
end
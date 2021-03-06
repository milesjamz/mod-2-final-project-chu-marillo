class Cart < ApplicationRecord

belongs_to :user
has_many :line_items
has_many :items, through: :line_items

before_save :update_total, :give_points


  def add_item(item, quantity)
    current_item = line_items.find_by(item_id: item.id)
    if current_item
      current_item.quantity += quantity.to_i
    else
      current_item = line_items.build(item_id: item.id)
      current_item.quantity += quantity.to_i - 1
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |line_item| line_item.total_price }
  end

  def calculate_total
    self.line_items.collect { |item| item.item.price * item.quantity }.sum
  end

#   def find_deals
    
# end

  # def name_deal
  #   if self.user.name == "carty perry"
  #     self.update_attribute(:total_price,(self.total_price * 0.5))
  # end
# end

  # def what_i_got
  #   self.line_items.map { |line_item| line_item.category.name }
  # end


    def give_points
      current_points = self.user.points
      final_points = current_points + self.total_price
      self.user.update_attribute(:points,final_points)
    end


  private

  def update_total
    self.total_price = calculate_total
  end
  
end
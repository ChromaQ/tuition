class AddCostEstimateToCourse < ActiveRecord::Migration[6.0]
  def up
    add_monetize :courses, :cost_estimate
    execute 'update courses set cost_estimate_cents = cost*100'
  end

  def down

  end
end

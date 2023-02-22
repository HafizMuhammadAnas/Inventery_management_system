require 'csv'

class ExportCommand
  def self.call
    sleep 10
    orders = Order.all
      columns = %w{id order_date grand_total status_name }
      file =   CSV.generate(headers: true) do |csv|
        csv << columns
        orders.each do |order|
          csv << columns.map{ |attr| order.send(attr) }
        end
      end
      file
  end
end

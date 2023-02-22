
class OrderExportJob
  # queue_as :default
  require 'csv'
  include Sidekiq::Worker

    def perform(export_file_id)

      return if export_file_id.blank?
      csv_content = ExportCommand.call
      ActionCable.server.broadcast(
        "export_channel_#{export_file_id}",
        csv_file: {
          file_name: 'data.csv',
          content: csv_content
        }
      )
      Export.where(status: 'Panding').update(status: 'completed') if export_file_id.present?
      # ExportChannel.broadcast_to(file_name)
    end
  end

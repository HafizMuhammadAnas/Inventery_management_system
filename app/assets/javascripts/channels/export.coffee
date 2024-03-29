# App.export = App.cable.subscriptions.create "ExportChannel",
  # connected: ->
    # Called when the subscription is ready for use on the server

  # disconnected: ->
    # Called when the subscription has been terminated by the server

  # received: (data) ->
    # Called when there's incoming data on the websocket for this channel
# This is to call this function in a nother coffee file

window.ExportChannel ?= {}
window.ExportChannel.Subscribe = (export_file_id, callback) ->
  App.export = App.cable.subscriptions.create({
    channel: 'ExportChannel'

    export_id: export_file_id
  },
    connected: -> callback()
    disconnected: ->
    received: (data) ->
      blob = new Blob([data['csv_file']['content']]);

      console.log(data)
      # Create a link with the data and trigger click event to download the file
      csv_download_link = document.createElement('a');
      csv_download_link.href = window.URL.createObjectURL(blob);
      csv_download_link.download = data['csv_file']['file_name'];
      csv_download_link.click();

      # Re-enable export btn
      $(".export-btn").html("Export Data")
      $(".export-btn").removeClass("disabled");

      App.export.unsubscribe()
      App.cable.disconnect()
      delete App.export
      return
  )
  return

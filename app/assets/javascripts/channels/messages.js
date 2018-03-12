
App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    if (App.userName == data.username)
      return "<p> <span class='text-success'>" + data.username + "</span>: <b>" + data.message + "</b></p>";
    else 
      return "<p>" + data.username + ": " + data.message + "</p>";
  }
});
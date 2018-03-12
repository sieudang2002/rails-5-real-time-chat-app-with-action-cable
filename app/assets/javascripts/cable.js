
(function() {
  this.App || (this.App = {});
  App.cable = ActionCable.createConsumer();
  App.userName = '';
}).call(this);

$(document).on('turbolinks:load', function() {
  submitNewMessage();
});

function submitNewMessage() {
  $('textarea#message_content').keydown(function(e) {
    if (e.keyCode == 13) {
      $('[data-send="message"]').click();
      return false;
    }
  });

  $('#new_message').bind('ajax:complete', function() {
    $('textarea[name="message[content]"]').val(" ");
  });
}
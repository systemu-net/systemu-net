$(document).ready(function(){
  $(document).on('click', ".msg_send_btn", function(event){
    $this = $(this)
    var inputField = $(".write_msg");
    if ($.trim(inputField.val()).length > 1) {
      App.personal_chat.send_message(inputField.val(), inputField.data("conversation-id"))
      inputField.val('')
    }
    event.preventDefault()
    return false;
  });
});

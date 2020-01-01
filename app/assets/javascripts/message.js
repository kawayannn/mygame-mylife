window.addEventListener("load", function() {
  let btn = document.querySelector("#group-header__right");
  group_id = $("#group-header__right").data('group-id');

  function formHTML(group){
    var html = `<div class="build-form shadow-lg p-3 mb-5 bg-white rounded">
                  <form class="new_message" id="new_message" action="/groups/${group_id}/messages" accept-charset="UTF-8" method="post">
                    <div class="new_message__uper">
                      <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token">
                      <textarea placeholder="メッセージを入力してください" name="message[content]" id="message_content"></textarea>
                    <div class="new_message__lower">
                      <div class="new_message__lower--right">
                        <button type="submit" class="btn btn-primary btn-sm" name="commit" data-disable-with="送信">
                          送信
                        </button>
                      </div>
                    </div>
                  </form>
                </div>`
    return html
  }
  btn.addEventListener("click", function() {
    $("main.group").append(formHTML);
  });

  $(document).on("click", ".close", function(){
    $(".build-form").remove();
  })
});
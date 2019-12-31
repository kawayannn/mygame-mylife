window.addEventListener("load", function() {
  let btn = document.querySelector("#group-header__right");
  group_id = $("#group-header__right").data('group-id');

  function formHTML(group){
    var html = `<form class="new_message" id="new_message" action="/groups/${group_id}/messages" accept-charset="UTF-8" method="post">
                  <input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="gO0bQLrR4G1nTEVNHEULfiDge6db6kSjHDFyoJ+MliQdlGWfMpbhXD8JOp/C0h12sSGzwVXK1OlPfAnheYoVSg==">
                    <textarea name="message[content]" id="message_content">
                    </textarea>
                  <input type="submit" name="commit" value="送信" data-disable-with="送信">
                </form>`
    return html
  }
  btn.addEventListener("click", function() {
    $("main.group").append(formHTML);
  });
});
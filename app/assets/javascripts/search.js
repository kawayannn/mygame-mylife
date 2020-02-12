$(function(){

    var search_list = $("#gametitle-search-results");
    var search_all = `
    <li>
      <a class="gametitle-search-result" data-method="get" href="/">
        <button type="button" class="btn btn-outline-secondary">
          <i class="fa fa-tag tags__tag--icon">
          </i>
          全てのゲーム
        </button>
      </a>
     </li>
    `

    function appendResult(result){

      var html = `
      <li>
        <a class="gametitle-search-result" data-method="get" href="/articles?gametitle_id=${result.id}">
          <button type="button" class="btn btn-outline-secondary">
            <i class="fa fa-tag tags__tag--icon">
            </i>
            ${result.name}
          </button>
        </a>
      </li>
      `
      search_list.append(html);
    }

    function appendNoGametitle(){
      
      var html = `<li>
                    <i class="no_title">一致するゲームが見つかりません</div>
                  </li>  
                  `
                  
      return html;
    }

  $("#gametitle-search-field").on("keyup", function(){
    var input = $("#gametitle-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/gametitles/search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(results){
      $("#gametitle-search-results").empty();
      if (results.length !== 0) {
        search_list.append(search_all)
        results.forEach(function(result){
          appendResult(result);
        });
      }
      else if(input.length == 0) {
      }
      else{
        search_list.append(appendNoGametitle);
      }
    })
  });





  // グループ検索

  function appendResultGroupSearch(result){

    var html = `
    <li>
      <a class="gametitle-search-result" data-method="get" href="/groups?gametitle_id=${result.id}">
        <button type="button" class="btn btn-outline-secondary">
          <i class="fa fa-tag tags__tag--icon">
          </i>
          ${result.name}
        </button>
      </a>
    </li>
    `
    search_list.append(html);
  }

  var group_search_all = `
  <li>
    <a class="gametitle-search-result" data-method="get" href="/groups">
      <button type="button" class="btn btn-outline-secondary">
        <i class="fa fa-tag tags__tag--icon">
        </i>
        全てのゲーム
      </button>
    </a>
   </li>
  `
  

  $("#group-search-field").on("keyup", function(){
    var input = $("#group-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/gametitles/search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(results){
      $("#gametitle-search-results").empty();
      if (results.length !== 0) {
        search_list.append(group_search_all)
        results.forEach(function(result){
          appendResultGroupSearch(result);
        });
      }
      else if(input.length == 0) {
      }
      else{
        search_list.append(appendNoGametitle);
      }
    })
  });

// 記事へのタグ追加

  function buildGametitleList(result){
    var html = `
                <li class="add-gametitle" data-gametitle-id="${result.id}" data-gametitle-name="${result.name}">
                  ${result.name}
                </li>
              `
    $("#add-gametitle-search-results").append(html);
}

  function addedGametitleList(name, id){
    var html = `
                <li>
                  <div class="btn btn-outline-secondary">
                  <input class="added-gametitle" type="hidden" value="${id}" name="article[gametitle_ids][]" id="article_gametitle_ids_"${id}">
                    <i class="fa fa-tag"></i>
                    ${name}
                  </div>
                </li>
            `
  $("#added-gametitles").append(html);
}

  const addedGametitles = []

  $("#add-gametitle-search-field").on("keyup", function(){
    input = $("#add-gametitle-search-field").val();
    
    $.ajax({
      type: 'GET',
      url: '/gametitles/search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(results){
      $("#add-gametitle-search-results").empty();
      if (results.length !== 0) {
        results.forEach(function(result) {
          if (addedGametitles.indexOf(result.id) == -1) {
            buildGametitleList(result);
          }
        });
      }
      else if(input.length == 0) {

      }
      else{
        $("#add-gametitle-search-results").append(appendNoGametitle);
      }
    })
  });
  
  $(document).on("click", ".add-gametitle", function() {
    
    const gametitleName = $(this).attr("data-gametitle-name");
    const gametitleId = $(this).attr("data-gametitle-id");
    addedGametitles.push(Number($(this).attr("data-gametitle-id")))
    
    $(this)
      .remove();
    addedGametitleList(gametitleName, gametitleId);
    
  });

});
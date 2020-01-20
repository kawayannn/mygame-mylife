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
      
      var html = `<i class="no_title">一致するゲームが見つかりません</div>`

      search_list.append(html);
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
        appendNoGametitle();
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
        appendNoGametitle();
      }
    })
  });

});
$( document ).on('turbolinks:load', function() {
  $("#checkAll").change(function () {
      $("input:checkbox").prop('checked', $(this).prop("checked"));
  });
  $("#clear").click(function () {
    var id = $("#clear").data().id
    window.location.href = "/collections/" + id
  });
});
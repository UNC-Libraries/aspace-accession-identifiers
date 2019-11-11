$(function () {
  var generate_accession_id = function () {
    $.ajax({
      url: APP_PATH + "plugins/generate_accession_identifier/generate",
      data: {},
      type: "POST",
      success: function(identifier) {
        $('#accession_id_1_').val(identifier.number);
      },
    })
  };


  var identifier_is_blank = function () {
    $("#accession_id_1_").val() !== "";
  };



  if (identifier_is_blank()) {
    generate_accession_id();
  }

});


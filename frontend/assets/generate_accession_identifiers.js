$(function () {
  var generate_accession_id = function () {
    $.ajax({
      url: APP_PATH + "plugins/generate_accession_identifier/generate",
      data: {},
      type: "POST",
      success: function(identifier) {
        $('#accession_id_1_').val(identifier.number);

        $('#accession_id_1_').enable();
        $('#accession_id_2_').enable();
      },
    })
  };


  var identifier_is_blank = function () {
    for (var i = 0; i < 4; i++) {
      if ($("#accession_id_" + i + "_").val() !== "") {
        return false;
      }
    }

    return true;
  };



  if (identifier_is_blank()) {
    generate_accession_id();
  }

});


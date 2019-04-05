$(document).ready(function() {

    var clients_suggested = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace("name"),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: window.location.origin + '/clients_suggestion',
      remote: {
        url: window.location.origin + '/clients_suggestion?query=%QUERY',
        wildcard: '%QUERY'
      }
    });

    $('#sale_client').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
    },
    {
      displayKey: 'name',
      source: clients_suggested,
      templates: {
        suggestion: function (client) {
            return '<p>' + client.name + '</p>';
        }
      }
    });


    $('#sale_client').typeahead('val', $('#sale_client_name').val() );

    $('#sale_client').on('typeahead:select', function(object, datum){
        $('#sale_client_id').val(datum.id);
    });

    $('#sale_client').on('typeahead:change', function(event, data){
        $('#sale_client_id').val(data);
        $(this).trigger('typeahead:_propia', data)
    });

    $('#sale_client').on('blur', function() {
        data = $('#sale_client').val();
        $(this).trigger('typeahead:_propia', data)
        url = '/validate_suggested_client';
        $.ajax({
            url: url,
            data: { client_name: data },
            success: function(res){
                if (res["0"].valid == false){
                    // Marca no válida
                    $('#sale_client').css('border-color', 'red');
                }else{
                    // Marca correcta
                    $('#sale_client_id').val(res["0"].id.toString());
                    $('#sale_client').css('border-color', '#ccc');
                }
            }
        });
    });

    $('#sale_client').on('typeahead:_propia', function(evt, datum){
    });
});

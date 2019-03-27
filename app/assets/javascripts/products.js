$(document).ready(function() {

    var brands_suggested = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace("name"),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: window.location.origin + '/brands_suggestion',
      remote: {
        url: window.location.origin + '/brands_suggestion?query=%QUERY',
        wildcard: '%QUERY'
      }
    });

    $('#product_brand').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
    },
    {
      displayKey: 'name',
      source: brands_suggested,
      templates: {
        suggestion: function (brand) {
            return '<p>' + brand.name + '</p>';
        }
      }
    });


    $('#product_brand').typeahead('val', $('#product_brand_name').val() );

    $('#product_brand').on('typeahead:select', function(object, datum){
        $('#product_brand_id').val(datum.id);
    });

    $('#product_brand').on('typeahead:change', function(event, data){
        $('#product_brand_id').val(data);
        $(this).trigger('typeahead:_propia', data)
    });

    $('#product_brand').on('blur', function() {
        data = $('#product_brand').val();
        $(this).trigger('typeahead:_propia', data)
        url = '/validate_suggested_brand';
        $.ajax({
            url: url,
            data: { brand_name: data },
            success: function(res){
                if (res["0"].valid == false){
                    // Marca no válida
                    $('#product_brand').css('border-color', 'red');
                }else{
                    // Marca correcta
                    $('#product_brand_id').val(res["0"].id.toString());
                    $('#product_brand').css('border-color', '#ccc');
                }
            }
        });
    });

    $('#product_brand').on('typeahead:_propia', function(evt, datum){
    });
});

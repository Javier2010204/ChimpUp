$(document).ready(function(){

    $(document).on("shown.bs.modal", "#new-detail-modal", function() {


    	var products_suggested = new Bloodhound({
    	  datumTokenizer: Bloodhound.tokenizers.obj.whitespace("description"),
    	  queryTokenizer: Bloodhound.tokenizers.whitespace,
          prefetch: window.location.origin + '/products_suggestion',
    	  remote: {
            url: window.location.origin + '/products_suggestion?query=%QUERY',
        	wildcard: '%QUERY'
    	  }
    	});

    	$('#sale_details_product').typeahead({
    		  hint: true,
    		  highlight: true,
    		  minLength: 1
    	},
    	{
    	  displayKey: 'description',
    	  source: products_suggested,
          templates: {
            suggestion: function (product) {
                return '<p>' + product.description + '</p>';
            }
          }
    	});

        $('#sale_details_product').focus();

    	$('#sale_details_product').typeahead('val', $('#sale_details_product_description').val() );

    	$('#sale_details_product').on('typeahead:select', function(object, datum){
            $('#sale_details_product').val(datum.id);
            $('#sale_details_qty').focus();
            subtotal();
        });

        $('#sale_details_product').on('typeahead:change', function(event, data){
            $('#sale_details_product').val(data);
        });

        $('#sale_details_product').on('blur', function() {
        	data = $('#sale_details_product').val();
        	url = '/validate_suggested_product';
        	$.ajax({
        		url: url,
        		data: { product_description: data },
        		success: function(res){
        			if (res["0"].valid == false){
        				// Item no válido
        				$('#sale_details_product').css('border-color', 'red');
        			}else{
        				// Item correcto
                        $('#sale_details_product_id').val(res["0"].id.toString());
                        $('#sale_details_price').val(res["0"].price.toString());
        				$('#sale_details_product').css('border-color', '#ccc');
                        subtotal();
        			}
        		}
        	});
        });

        function subtotal() {
            $('#sale_details_subtotal').val($('#sale_details_qty').val() * $('#sale_details_price').val());
        };

        $('#sale_details_qty').blur(function(){
             subtotal();
        });

        $('#sale_details_price').blur(function(){
             subtotal();
        });

    });
});

$('document').ready(function(){
	$('.dps').datepicker();
	var collection =[]
	oTable = $('#properties').dataTable()
	$('.myclass').click(function(e){
		e.preventDefault();
		collection = [];
		
		$("input:checked", oTable.fnGetNodes()).each(function() {
		  return collection.push($(this).val());
		});
		$.ajax({
	  		type: "POST",
			url: '/favorites',
			data: {favorite: {prop_list: collection}},
			dataType: 'script'


		});
	})
})




  	
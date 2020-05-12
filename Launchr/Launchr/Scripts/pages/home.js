$(document).ready(function () {
	$('#txtSearchHero').keyup(function () {
		var queryString = $('#txtSearchHero').val();
		console.log(queryString);
		if (queryString != '') {
			$('#btnSearchHero').attr('href', "search-result?query=" + queryString);
		}
		else {
			$('#btnSearchHero').attr('href', "#");
		}
	});
});
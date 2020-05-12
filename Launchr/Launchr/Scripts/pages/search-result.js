$(document).ready(function () {
	size_search_card = $("#search-result-display .search-card").length;
	console.log(size_search_card);
	x = 5;
	$('#search-result-display .search-card:lt(' + x + ')').show();
	$('#see-more-result').click(function () {
		x = (x + 5 <= size_search_card) ? x + 5 : size_search_card;
		$('#search-result-display .search-card:lt(' + x + ')').show();
		if (x == size_search_card) {
			$('#see-more-result').hide();
		}
	});
	if (size_search_card < 6) {
		$('#see-more-result').hide();
		if (size_search_card < 1) {
			$('#no-result').removeClass("d-none");
		}
	}
});
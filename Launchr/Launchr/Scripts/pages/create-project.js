var easyMDE = new EasyMDE({ element: document.getElementById('content_txtContentFaux') });

function updatetxtContent() {
	document.getElementById('content_txtContent').value = easyMDE.value();
}

$(document).ready(function () {
	$('#content_filPhoto').change(function () {
		var files = $(this)[0].files;
		if (files.length > 6) {
			alert("Only maximum of 6 photos are allowed.");
			document.getElementById("content_filPhoto").value = '';
			return false;
		}
	});
	setInterval(updatetxtContent, 1000);
	$('[data-toggle="tooltip"]').tooltip();
});	

$(function() {

	// page-scroll
	$('.jscroll').jscroll({
	   contentSelector: '.page-list',
	   nextSelector: 'span.next:last a',
	   loadingHtml: '読み込み中'
	});

	// 複数タブ,クリックアクション用
	$(".page-1").click(function(){
		$('.jscroll').jscroll({
		   contentSelector: '.page-list',
		   nextSelector: 'span.next:last a',
		   loadingHtml: '読み込み中'
		});
	});

	$(".page-2").click(function(){
		$('.jscroll-2').jscroll({
		   contentSelector: '.page-list-2',
		   nextSelector: 'span.next:last a',
		   loadingHtml: '読み込み中'
		});
	});

	$(".page-3").click(function(){
		$('.jscroll-3').jscroll({
		   contentSelector: '.page-list-3',
		   nextSelector: 'span.next:last a',
		   loadingHtml: '読み込み中'
		});
	});

	$(".page-4").click(function(){
		$('.jscroll-4').jscroll({
		   contentSelector: '.page-list-4',
		   nextSelector: 'span.next:last a',
		   loadingHtml: '読み込み中'
		});
	});


	// notice-messege
	$(function(){
	  setTimeout("$('.time-limit').fadeOut('slow')", 2000) 
	})
});


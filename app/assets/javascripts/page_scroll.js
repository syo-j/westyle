
$(function() {
	$('.jscroll').jscroll({
	   contentSelector: '.page-list',
	   nextSelector: 'span.next:last a',
	   loadingHtml: '読み込み中'
	  });

	// 複数タブ用クリックアクション用
	$(".page-1").click(function(){
		$('.jscroll').jscroll({
		   contentSelector: '.page-list',
		   nextSelector: 'span.next:last a',
		   loadingHtml: '読み込み中',
		});
	});

	$(".page-2").click(function(){
		$('.jscroll-2').jscroll({
		   contentSelector: '.page-list-2',
		   nextSelector: 'span.next:last a',
		   loadingHtml: '読み込み中',
		});
	});



});

$(function() {
	$('.summernote').summernote({
		height : 300,
		lang : 'ko-KR',
		toolbar : [
				// 글꼴 설정
				[ 'fontname', [ 'fontname' ] ],
				// 글자 크기 설정
				[ 'fontsize', [ 'fontsize' ] ],
				// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				['style', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear' ] ],
				// 글자색
				[ 'color', [ 'forecolor', 'color' ] ],
				// 표만들기
				[ 'table', [ 'table' ] ],
				// 글머리 기호, 번호매기기, 문단정렬
				[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
				// 그림첨부
				[ 'insert', [ 'picture','link','video' ] ],
				// 줄간격
				[ 'height', [ 'height' ] ], 
				// 보기(전체화면, 코드보기, 도움말)
				['view', ['fullscreen', 'codeview', 'help']],
				],
		fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
				'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체',
				'바탕체' ],
		// 추가한 폰트사이즈
		fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
				'20', '22', '24', '28', '30', '36', '50', '72' ],
	});
	
});
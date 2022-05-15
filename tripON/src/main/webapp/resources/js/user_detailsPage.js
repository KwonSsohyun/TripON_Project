'use strict';

let selectCnt = 0;
let selectIdx = new Array;
let eventIdx;
let number1 = 0;
let number2 = 0;
let number3 = 0;
let number4 = 0;

let sumPrice1;
let sumPrice2;
let sumPrice3;
let sumPrice4;
let totalPrice;

// 날짜선택
function dateOnChange(event) {
	const text = event.options[event.selectedIndex].text;
	document.getElementById('innerDate01').innerText = text;
	document.getElementById('innerDate02').innerText = text;
	document.getElementById('innerDate03').innerText = text;
	document.getElementById('innerDate04').innerText = text;
}

// 상품선택
function selectOnChange(event) {
	selectCnt++;
	if (selectCnt == 5) selectCnt = 4;
	$('#purchase_button').prop('disabled', false);
	$('#decrease0' + selectCnt).show();
	$('#quantity0' + selectCnt).show();
	$('#increase0' + selectCnt).show();
	$('#delOption0' + selectCnt).show();
	selectIdx[selectCnt-1] = event.selectedIndex;
	const text = event.options[event.selectedIndex].text;
	document.getElementById('inner0' + selectCnt).innerText = text;

	eventIdx = event.selectedIndex;
	if (eventIdx === 1) number1 = 1;
	if (eventIdx === 2) number2 = 1;
	if (eventIdx === 3) number3 = 1;
	if (eventIdx === 4) number4 = 1;
	sumPrice1 = price1 * number1;
	sumPrice2 = price2 * number2;
	sumPrice3 = price3 * number3;
	sumPrice4 = price4 * number4;
	totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
	document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
}

// 증가&감소 버튼
function count01(type) {
	if (selectIdx[0] === 1) {
		const quantity01Element = document.getElementById('quantity01');
		number1 = quantity01Element.innerText;

		if (type === 'increase') number1 = parseInt(number1) + 1;
			else if (type === 'decrease') number1 = parseInt(number1) - 1;

		let decrease = document.getElementById('decrease01');
		let increase = document.getElementById('increase01');
		if (number1 == 1) decrease.disabled = true;
			else if (number1 !== 1) decrease.disabled = false;
		if (number1 == 30) increase.disabled = true;
			else if (number1 !== 30) increase.disabled = false;

		quantity01Element.innerText = number1;
		sumPrice1 = price1 * number1;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[0] === 2) {
		const quantity01Element = document.getElementById('quantity01');
		number2 = quantity01Element.innerText;

		if (type === 'increase') number2 = parseInt(number2) + 1;
			else if (type === 'decrease') number2 = parseInt(number2) - 1;

		let decrease = document.getElementById('decrease01');
		let increase = document.getElementById('increase01');
		if (number2 == 1) decrease.disabled = true;
			else if (number2 !== 1) decrease.disabled = false;
		if (number2 == 30) increase.disabled = true;
			else if (number2 !== 30) increase.disabled = false;

		quantity01Element.innerText = number2;
		sumPrice2 = price2 * number2;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[0] === 3) {
		const quantity01Element = document.getElementById('quantity01');
		number3 = quantity01Element.innerText;

		if (type === 'increase') number3 = parseInt(number3) + 1;
			else if (type === 'decrease') number3 = parseInt(number3) - 1;

		let decrease = document.getElementById('decrease01');
		let increase = document.getElementById('increase01');
		if (number3 == 1) decrease.disabled = true;
			else if (number3 !== 1) decrease.disabled = false;
		if (number3 == 30) increase.disabled = true;
			else if (number3 !== 30) increase.disabled = false;

		quantity01Element.innerText = number3;
		sumPrice3 = price3 * number3;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[0] === 4) {
		const quantity01Element = document.getElementById('quantity01');
		number4 = quantity01Element.innerText;

		if (type === 'increase') number4 = parseInt(number4) + 1;
			else if (type === 'decrease') number4 = parseInt(number4) - 1;

		let decrease = document.getElementById('decrease01');
		let increase = document.getElementById('increase01');
		if (number4 == 1) decrease.disabled = true;
			else if (number4 !== 1) decrease.disabled = false;
		if (number4 == 30) increase.disabled = true;
			else if (number4 !== 30) increase.disabled = false;

		quantity01Element.innerText = number4;
		sumPrice4 = price4 * number4;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	}
}
function count02(type) {
	if (selectIdx[1] === 1) {
		const quantity02Element = document.getElementById('quantity02');
		number1 = quantity02Element.innerText;

		if (type === 'increase') number1 = parseInt(number1) + 1;
			else if (type === 'decrease') number1 = parseInt(number1) - 1;

		let decrease = document.getElementById('decrease02');
		let increase = document.getElementById('increase02');
		if (number1 == 1) decrease.disabled = true;
			else if (number1 !== 1) decrease.disabled = false;
		if (number1 == 30) increase.disabled = true;
			else if (number1 !== 30) increase.disabled = false;

		quantity02Element.innerText = number1;
		sumPrice1 = price1 * number1;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[1] === 2) {
		const quantity02Element = document.getElementById('quantity02');
		number2 = quantity02Element.innerText;

		if (type === 'increase') number2 = parseInt(number2) + 1;
			else if (type === 'decrease') number2 = parseInt(number2) - 1;

		let decrease = document.getElementById('decrease02');
		let increase = document.getElementById('increase02');
		if (number2 == 1) decrease.disabled = true;
			else if (number2 !== 1) decrease.disabled = false;
		if (number2 == 30) increase.disabled = true;
			else if (number2 !== 30) increase.disabled = false;

		quantity02Element.innerText = number2;
		sumPrice2 = price2 * number2;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[1] === 3) {
		const quantity02Element = document.getElementById('quantity02');
		number3 = quantity02Element.innerText;

		if (type === 'increase') number3 = parseInt(number3) + 1;
			else if (type === 'decrease') number3 = parseInt(number3) - 1;

		let decrease = document.getElementById('decrease02');
		let increase = document.getElementById('increase02');
		if (number3 == 1) decrease.disabled = true;
			else if (number3 !== 1) decrease.disabled = false;
		if (number3 == 30) increase.disabled = true;
			else if (number3 !== 30) increase.disabled = false;

		quantity02Element.innerText = number3;
		sumPrice3 = price3 * number3;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[1] === 4) {
		const quantity02Element = document.getElementById('quantity02');
		number4 = quantity02Element.innerText;

		if (type === 'increase') number4 = parseInt(number4) + 1;
			else if (type === 'decrease') number4 = parseInt(number4) - 1;

		let decrease = document.getElementById('decrease02');
		let increase = document.getElementById('increase02');
		if (number4 == 1) decrease.disabled = true;
			else if (number4 !== 1) decrease.disabled = false;
		if (number4 == 30) increase.disabled = true;
			else if (number4 !== 30) increase.disabled = false;

		quantity02Element.innerText = number4;
		sumPrice4 = price4 * number4;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	}
}
function count03(type) {
	if (selectIdx[2] === 1) {
		const quantity03Element = document.getElementById('quantity03');
		number1 = quantity03Element.innerText;

		if (type === 'increase') number1 = parseInt(number1) + 1;
			else if (type === 'decrease') number1 = parseInt(number1) - 1;

		let decrease = document.getElementById('decrease03');
		let increase = document.getElementById('increase03');
		if (number1 == 1) decrease.disabled = true;
			else if (number1 !== 1) decrease.disabled = false;
		if (number1 == 30) increase.disabled = true;
			else if (number1 !== 30) increase.disabled = false;

		quantity03Element.innerText = number1;
		sumPrice1 = price1 * number1;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[2] === 2) {
		const quantity03Element = document.getElementById('quantity03');
		number2 = quantity03Element.innerText;

		if (type === 'increase') number2 = parseInt(number2) + 1;
			else if (type === 'decrease') number2 = parseInt(number2) - 1;

		let decrease = document.getElementById('decrease03');
		let increase = document.getElementById('increase03');
		if (number2 == 1) decrease.disabled = true;
			else if (number2 !== 1) decrease.disabled = false;
		if (number2 == 30) increase.disabled = true;
			else if (number2 !== 30) increase.disabled = false;

		quantity03Element.innerText = number2;
		sumPrice2 = price2 * number2;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[2] === 3) {
		const quantity03Element = document.getElementById('quantity03');
		number3 = quantity03Element.innerText;

		if (type === 'increase') number3 = parseInt(number3) + 1;
			else if (type === 'decrease') number3 = parseInt(number3) - 1;

		let decrease = document.getElementById('decrease03');
		let increase = document.getElementById('increase03');
		if (number3 == 1) decrease.disabled = true;
			else if (number3 !== 1) decrease.disabled = false;
		if (number3 == 30) increase.disabled = true;
			else if (number3 !== 30) increase.disabled = false;

		quantity03Element.innerText = number3;
		sumPrice3 = price3 * number3;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[2] === 4) {
		const quantity03Element = document.getElementById('quantity03');
		number4 = quantity03Element.innerText;

		if (type === 'increase') number4 = parseInt(number4) + 1;
			else if (type === 'decrease') number4 = parseInt(number4) - 1;

		let decrease = document.getElementById('decrease03');
		let increase = document.getElementById('increase03');
		if (number4 == 1) decrease.disabled = true;
			else if (number4 !== 1) decrease.disabled = false;
		if (number4 == 30) increase.disabled = true;
			else if (number4 !== 30) increase.disabled = false;

		quantity03Element.innerText = number4;
		sumPrice4 = price4 * number4;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	}
}
function count04(type) {
	if (selectIdx[3] === 1) {
		const quantity04Element = document.getElementById('quantity04');
		number1 = quantity04Element.innerText;

		if (type === 'increase') number1 = parseInt(number1) + 1;
			else if (type === 'decrease') number1 = parseInt(number1) - 1;

		let decrease = document.getElementById('decrease04');
		let increase = document.getElementById('increase04');
		if (number1 == 1) decrease.disabled = true;
			else if (number1 !== 1) decrease.disabled = false;
		if (number1 == 30) increase.disabled = true;
			else if (number1 !== 30) increase.disabled = false;

		quantity04Element.innerText = number1;
		sumPrice1 = price1 * number1;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[3] === 2) {
		const quantity04Element = document.getElementById('quantity04');
		number2 = quantity04Element.innerText;

		if (type === 'increase') number2 = parseInt(number2) + 1;
			else if (type === 'decrease') number2 = parseInt(number2) - 1;

		let decrease = document.getElementById('decrease04');
		let increase = document.getElementById('increase04');
		if (number2 == 1) decrease.disabled = true;
			else if (number2 !== 1) decrease.disabled = false;
		if (number2 == 30) increase.disabled = true;
			else if (number2 !== 30) increase.disabled = false;

		quantity04Element.innerText = number2;
		sumPrice2 = price2 * number2;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[3] === 3) {
		const quantity04Element = document.getElementById('quantity04');
		number3 = quantity04Element.innerText;

		if (type === 'increase') number3 = parseInt(number3) + 1;
			else if (type === 'decrease') number3 = parseInt(number3) - 1;

		let decrease = document.getElementById('decrease04');
		let increase = document.getElementById('increase04');
		if (number3 == 1) decrease.disabled = true;
			else if (number3 !== 1) decrease.disabled = false;
		if (number3 == 30) increase.disabled = true;
			else if (number3 !== 30) increase.disabled = false;

		quantity04Element.innerText = number3;
		sumPrice3 = price3 * number3;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	} else if (selectIdx[3] === 4) {
		const quantity04Element = document.getElementById('quantity04');
		number4 = quantity04Element.innerText;

		if (type === 'increase') number4 = parseInt(number4) + 1;
			else if (type === 'decrease') number4 = parseInt(number4) - 1;

		let decrease = document.getElementById('decrease04');
		let increase = document.getElementById('increase04');
		if (number4 == 1) decrease.disabled = true;
			else if (number4 !== 1) decrease.disabled = false;
		if (number4 == 30) increase.disabled = true;
			else if (number4 !== 30) increase.disabled = false;

		quantity04Element.innerText = number4;
		sumPrice4 = price4 * number4;
		totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
		document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	}
}

// 옵션초기화
function delOption(type, idx) {
	selectCnt--;
	if (selectCnt == 0) $('#purchase_button').prop('disabled', true);
    if (selectCnt !== 0) $('#purchase_button').prop('disabled', false);
	let delOption = document.getElementById('dateScroll');
	let check = selectIdx[idx-1];
	
	if (check === 1) number1 = 0;
	if (check === 2) number2 = 0;
	if (check === 3) number3 = 0;
	if (check === 4) number4 = 0;

	sumPrice1 = price1 * number1;
	sumPrice2 = price2 * number2;
	sumPrice3 = price3 * number3;
	sumPrice4 = price4 * number4;
	totalPrice = sumPrice1 + sumPrice2 + sumPrice3 + sumPrice4;
	document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
	$('#optionScroll option:eq(' +check+ ')').prop('hidden', false);
	delete selectIdx[idx-1];

	if (selectCnt == -1) selectCnt = 0;
	if (selectCnt == 0) $('#dateScroll option:eq(0)').prop('selected', true);
	if (type === 'delOption01') {
		$('#option_box01').hide();
		$('#inner01').text('');
		$('#quantity01').text(1);
	} else if (type === 'delOption02') {
		$('#option_box02').hide();
		$('#inner02').text('');
		$('#quantity02').text(1);
	} else if(type === 'delOption03') {
		$('#option_box03').hide();
		$('#inner03').text('');
		$('#quantity03').text(1);
	} else if(type === 'delOption04') {
		$('#option_box04').hide();
		$('#inner04').text('');
		$('#quantity04').text(1);
	}
	if (selectCnt == 0) {
		delOption.disabled = false;
		$('#optionScroll option[value*="상품선택"]').prop('hidden', false);
		$('#optionScroll option[value*="option1"]').prop('hidden', true);
		$('#optionScroll option[value*="option2"]').prop('hidden', true);
		$('#optionScroll option[value*="option3"]').prop('hidden', true);
		$('#optionScroll option[value*="option4"]').prop('hidden', true);
	} else if (selectCnt !== 4) {
		$('#optionScroll').prop('disabled', false);
	}
}

$(document).ready(function() {

	// 옵션선택
	$('#payMent #option_box01').hide();
	$('#payMent #option_box02').hide();
	$('#payMent #option_box03').hide();
	$('#payMent #option_box04').hide();
	$('#decrease01').hide();
	$('#quantity01').hide();
	$('#increase01').hide();
	$('#delOption01').hide();

	$('#optionScroll option[value*="상품선택"]').prop('hidden', false);
	$('#optionScroll option[value*="option1"]').prop('hidden', true);
	$('#optionScroll option[value*="option2"]').prop('hidden', true);
	$('#optionScroll option[value*="option3"]').prop('hidden', true);
	$('#optionScroll option[value*="option4"]').prop('hidden', true);

	$('#dateScroll option:selected').val();
	$('#dateScroll option').index($('#dateScroll option:selected'));
	$('#dateScroll').change(function() {		// 날짜선택
		
		$('#option_box01').show();
		$('#dateScroll').prop('disabled', true);
		$('#optionScroll option[value*="상품선택"]').prop('hidden', true);
		$('#optionScroll option[value*="option1"]').prop('hidden', false);
		$('#optionScroll option[value*="option2"]').prop('hidden', false);
		$('#optionScroll option[value*="option3"]').prop('hidden', false);
		$('#optionScroll option[value*="option4"]').prop('hidden', false);
	});

	$('#optionScroll option:selected').val();
	$('#optionScroll option').index($('#optionScroll option:selected'));
	$('#optionScroll').change(function() {		// 상품선택
		if (selectCnt == 4) $('#optionScroll').prop('disabled', true);
		$('#option_box0' + selectCnt).show();
		$('#optionScroll option:selected').prop('hidden', true);
		$('#optionScroll option:eq(0)').prop('selected', true);
	});
	
	// 탭메뉴
	$('ul.panel li:not(' +$('ul.tab li a.selected').attr('href')+ ')').hide();
	$('ul.tab li a').click(function() {
		$('ul.tab li a').removeClass('selected');
		$(this).addClass('selected');
		$('ul.panel li').hide();
		$($(this).attr('href')).show();
		return false;
	});

});

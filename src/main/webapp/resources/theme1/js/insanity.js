/*1. INSANITY TEXT EFFECT*/
function insanity(){
	var glow = $('.insanity');
	setInterval(function() {
		glow.hasClass('glow') ? glow.removeClass('glow') : glow
		.addClass('glow');
	}, 4000);
}

$.fn.articleTypeHeader = function(){
	return this.each(function() {
		var a = $(this).text().trim();
		var b = "INSANITY";
		if(a.localeCompare("news") == 0) b = "TIN TỨC";
		if(a.localeCompare("news_enterprise") == 0) b = "TIN TỨC BẤT ĐỘNG SẢN";
		if(a.localeCompare("news_finance_banking") == 0) b = "TIN TỨC TÀI CHÍNH NGÂN HÀNG";
		if(a.localeCompare("news_real_estate") == 0) b = "TIN TỨC BẤT ĐỘNG SẢN";
		if(a.localeCompare("news_goods_materials") == 0) b = "TIN TỨC HÀNG HÓA - NGUYÊN LIỆU";
		if(a.localeCompare("news_macroeconomics") == 0) b = "TIN KINH TẾ VĨ MÔ";
		if(a.localeCompare("news_international") == 0) b = "TIN QUỐC TẾ";
		if(a.localeCompare("market") == 0) b = "THỊ TRƯỜNG";
		if(a.localeCompare("market_general") == 0) b = "TỔNG QUAN THỊ TRƯỜNG";
		if(a.localeCompare("market_trading_results") == 0) b = "KẾT QUẢ GIAO DỊCH";
		if(a.localeCompare("market_foreign_results") == 0) b = "KẾT QUẢ GIAO DỊCH KHỐI NGOẠI";
		if(a.localeCompare("analyze") == 0) b = "PHÂN TÍCH KỸ THUẬT";
		if(a.localeCompare("analyze_technical_chart") == 0) b = "BIỂU ĐỒ KỸ THUẬT";
		if(a.localeCompare("analyze_portfolio") == 0) b = "DANH MỤC KHUYẾN NGHỊ";
		if(a.localeCompare("analyze_recommended_stock") == 0) b = "CỔ PHIẾU KHUYẾN NGHỊ";
		if(a.localeCompare("announcement") == 0) b = "THÔNG BÁO";
		if(a.localeCompare("announcement_common") == 0) b = "THÔNG BÁO CHUNG";
		if(a.localeCompare("announcement_recruitment") == 0) b = "TUYỂN DỤNG";
		$(this).text(b);
	})
}

$.fn.digits = function() {
	return this.each(function() {
		$(this).text(
				$(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
	})
};

$.fn.digits2 = function() {
	return this.each(function() {
		var a = parseFloat($(this).text());
		$(this).text(accounting.formatMoney(a));
	})
};

$.fn.formatTime = function() {
	return this.each(function() {
		var a = ($(this).text());
		$(this).text(a.substring(10, 19) + " "+ a.substring(8, 10) + "/"+a.substring(5, 7)+"/"+a.substring(0, 4) );
	})
};

$.fn.formatPercent = function() {
	return this.each(function() {
		var a = parseFloat($(this).text());
		var b = Math.round(a * 100) / 100;
		$(this).text(b +"%");
	})
};

function confirmDelete() {
	var x = 2;
	bootbox.prompt("Hãy nhập OK để xác nhận xóa tài khoản", function(result) {                
		  if (result == "OK") {
			  x = 4;
			  alert(x>3);
		  }
	});
	
	return x>3;
};

accounting.settings = {
	currency : {
		symbol : " đ", // default currency symbol is '$'
		format : "%v%s", // controls output: %s = symbol, %v = value/number (can be object: see below)
		decimal : ".", // decimal point separator
		thousand : ",", // thousands separator
		precision : 0
	// decimal places
	},
	number : {
		precision : 0, // default precision on numbers is 0
		thousand : ",",
		decimal : "."
	}
}; 


$.fn.formatPercent2 = function() {
	return this.each(function() {
		var a = parseFloat($(this).text());
		var b = Math.round(a * 100) ;
		$(this).text(b +"%");
	})
};

$.fn.formatQuantity = function() {
	return this.each(function() {
		var a = parseFloat($(this).text());
		var str = accounting.formatMoney(a);
		$(this).text(str.substring(0, str.length - 2));
	})
};

		$(function() {
			var menu=$('.inner-nav>ul>li');
			menu.hover(function() {
				$(this).find('ul').slideDown(600).parent().siblings().children('ul').slideUp(60);
			}, function() {
				$('.inner-nav ul ul').slideUp(60);
			}, function() {
				$('.inner-nav ul li ul li').mouseout();
			});
		});

		$(function() {
			var menu=$('.inner-nav>ul>li');
			menu.hover(function() {
				$(this).find('ul').css("background-color", "#8C8C8C", "opacity", "0.75");
			})
		});
		
//= require jsB/lumino.glyphs
//= require jsB/jquery-1.11.1.min
//= require jsB/bootstrap.min
//= require jsB/chart.min
//= require jsB/chart-data
//= require jsB/easypiechart
//= require jsB/easypiechart-data
//= require jsB/bootstrap-datepicker
//= require jsB/bootstrap-table



//= require jquery_ujs


$('#calendar').datepicker({
		});

		



!function ($) {
      $(document).on("click","ul.nav li.parent > a > span.icon", function(){      
        $(this).find('em:first').toggleClass("glyphicon-minus");    
      }); 
      $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
      if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
      if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })
$(document).ready(function() {
      /*if($("#markItUp_admin").length > 0) $("#markItUp_admin").markItUp(userSettings);*/
      if($("#markItUp_user").length > 0) $("#markItUp_user").markItUp(userSettings);
      $.fn.show_alert_notice = function() {
      	$(this).animate({
      			opacity: 1,
          		height: 'toggle'
        	}, 1000, function() {
        		$(this).hide(1000);
        	});
      }
   });

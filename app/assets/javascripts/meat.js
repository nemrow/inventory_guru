var DOMInteration = {
	init: function(){
		$('.options-btn').click(function(e){
			e.preventDefault();
			DOMInteration.openOptionsPanel();
		});

		$('#hidden-full-overlay').click(function(){
			DOMInteration.closeOptionsPanel();
		});

		$('.day_selector li').click(function(){
			DOMInteration.toggleActiveday($(this));
		});

		$('.supplier-dropdown-button').click(function(){
			DOMInteration.toggleSupplierDropDown();
		});

		// testing!!!

		// toggle buttons
		$(document).on('click', '.order-delivery-toggle-buttons p', function(){
			$('.order-delivery-toggle-buttons p').removeClass('toggle-active');
			$(this).addClass('toggle-active');
			$(this).closest('.order-delivery-entire-shell').attr('data-active', $(this).data('type'));
		});

		$('.indi-day').click(function(){
			var $parentDiv = $(this).closest('.order-delivery-entire-shell');
			if ($parentDiv.attr('data-active') == 'order' 
				&& $(this).parent().hasClass('supplier-dates-top-container')){
				$('.supplier-dates-bottom-container').slideDown();
				var dayNum = $(this).index();
				$('.supplier-dates-top-container').children().removeClass('day-selector-not-active').removeClass('order-day-selector-active').slice(0,dayNum).addClass('day-selector-not-active');
				$('.supplier-dates-shell p').slice(dayNum+1, 14).addClass('indi-day-choose-delivery');
				$(this).addClass('order-day-selector-active');
				$parentDiv.attr('data-order-day',$(this).data('day')).attr('data-order-num', dayNum);
				chooseDelivery(dayNum);
			} else if ($parentDiv.attr('data-active') == 'deliver') {
				$('.indi-day').removeClass('delivery-day-selector-active');
				$(this).addClass('delivery-day-selector-active');
				var dayNum = $(this).index();
				var orderDay = parseInt($parentDiv.attr('data-order-num'));
				var deliverDays = dayNum - orderDay;
				$parentDiv.attr('data-deliver-num', deliverDays);
				$('.post-delivered-not-active').removeClass('post-delivered-not-active');
				$('.supplier-dates-shell p').slice(dayNum+1, 14).addClass('post-delivered-not-active');
				$('.supplier-dates-shell p').removeClass('being-delivered-active').slice(orderDay+1, dayNum).addClass('being-delivered-active');
			};
		});

		$('.order-delivery-toggle-buttons p').click(function(){
			$('.order-delivery-toggle-buttons p').removeClass('toggle-active');
			$(this).addClass('toggle-active');
		});

		// testing!!!
		var order1 = new Order

		$('.get-new-order-set-partial').click(function(e){
			$.post('/supplier_order_days', function(data){
				$('.order-delivery-sets-container').append(data)
			})
		});

		DOMInteration.setDaySelectorToggles();
	},

	setDaySelectorToggles: function(){
		$('.day_selector').each(function(){
			var model = $(this).data('model')
			$(this).children('li').each(function(){
				var day = $(this).data('day');
				var status = $('.'+model+'-'+day).val();
				if (status == 't'){
					$(this).addClass('day_active').data('status', true);
				} else {
					$(this).data('status', false);
				}
			});
		});
	},

	toggleSupplierDropDown: function(){
		$('.inventory-drop-down-sub-header-container').slideToggle();
		$('.supplier-dropdown-button').toggleClass('supplier-dropdown-button-active');
	},

	openOptionsPanel: function(){
		$('#hidden-full-overlay').show();
		$('#options-panel').animate({
			left: '0%'
		})
	},

	closeOptionsPanel: function(){
		$('#hidden-full-overlay').hide();
		$('#options-panel').animate({
			left: '-100%'
		})
	},

	toggleActiveday: function($element){
		var model = $element.closest('.day_selector').data('model')
		var day = $element.data('day');
		var status = $element.data('status');
		DOMInteration.toggleHiddenInputRecords(model, day, status);
		DOMInteration.toggleDaySelectorButtons($element, status);
	},

	toggleHiddenInputRecords: function(model, day, status){
		var new_status = this.toggleStatus(status);
		$('.'+model+'-'+day).val(new_status);
	},

	toggleDaySelectorButtons: function($element, status){
		var new_status = this.toggleStatus(status);
		$element.toggleClass('day_active').data('status', new_status);
	},

	toggleStatus: function(status){
		return (status == false ? true : false);
	}
}

var Order = function(id){
	this.orderDay = null;
	this.orderNum = null;
	this.deliveryDayNum = null;
	this.deliveryDuration = null;
	this.activeInput = 'order';
	this.id = id;
};
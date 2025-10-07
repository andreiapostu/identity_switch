/*
 * 	Identity switch RoundCube Bundle
 *
 *	@copyright	(c) 2024 - 2025 Florian Daeumling, Germany. All right reserved
 * 	@license 	https://github.com/toteph42/identity_switch/blob/master/LICENSE
 */

$(function() {

	// Reformat tables
    var fld = $('table[class="propform"]');
    fld.attr('class', 'propform cols-sm-6-6');
    var fld = $('td[class="title col-sm-4"]');
    fld.attr('class', 'title col-sm-6');
    var fld = $('td[class="col-sm-8"]');
    fld.attr('class', 'col-sm-6');
    
	var fld = $('input[name="_enabled"]');
    if (fld.prop('value') == 0)
    	fld.prop('checked', false);
    	
	identity_switch_enabled(); 
});

function identity_switch_enabled() {
	
	var fld = $('input[name="_enabled"]');
	
	if (fld.prop('value') == undefined)
		return;
	
	if (!fld.is(':checked')) {
		var val = 0;
		var dis = true;
	} else {
		var val = 1;
		var dis = false;
	}
	
	fld.prop('value', val);
	$('input[name="_label"]').attr('disabled', dis);
	
	$('input[name="_imap_user"]').attr('disabled', dis);
	$('input[name="_imap_pwd"]').attr('disabled', dis);
	$('input[name="_imap_host"]').attr('disabled', dis);
	$('input[name="_imap_port"]').attr('disabled', dis);
	$('select[name="_imap_auth"]').attr('disabled', dis);
	$('input[name="_imap_delim"]').attr('disabled', dis);
	
	$('input[name="_smtp_user"]').attr('disabled', dis);
	$('input[name="_smtp_pwd"]').attr('disabled', dis);
	$('input[name="_smtp_host"]').attr('disabled', dis);
	$('input[name="_smtp_port"]').attr('disabled', dis);
	$('select[name="_smtp_auth"]').attr('disabled', dis);
	
	$('input[name="_check_all_folder"]').attr('disabled', dis);
	$('input[name="_notify_basic"]').attr('disabled', dis);
	$('input[name="_notify_desktop"]').attr('disabled', dis);
	$('select[name="_notify_timeout"]').attr('disabled', dis);
	$('input[name="_notify_sound"]').attr('disabled', dis);
	$('select[name="_refresh_interval"]').attr('disabled', dis);
	
	// disable all links
	$('a[name^="_notify"]').each(function(i, obj) {
		if (dis) {
	  		obj.setAttribute('save', obj.getAttribute('onclick'));
	   		obj.removeAttribute('href');
	   		obj.removeAttribute('onclick');
	   	} else {
  			if (obj.getAttribute('save'))	
  				obj.setAttribute('onclick', obj.getAttribute('save'));
   			obj.setAttribute('href', '#');
		}
	});
}
 
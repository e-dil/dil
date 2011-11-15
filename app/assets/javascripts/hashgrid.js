var hashgrid = function(set) {
	var options = {
			id: 'grid',             
			modifierKey: null,     
			showGridKey: 'g',     
			holdGridKey: 'h',    
			foregroundKey: 'f', 
			jumpGridsKey: 'j', 
			numberOfGrids: 1,  
			classPrefix: 'grid-',
			cookiePrefix: 'hashgrid'
		},
		classNumber = 1,
		gridLines,
		gridWidth,
		i,
		line,
		lineHeight,
		numGridLines,
		overlay,
		overlayCookie,
		overlayEl,
		overlayOn = false,
		overlayVert,
		overlayZState = 'B',
		overlayZBackground = -1,
		overlayZForeground = 9999,
		pageHeight,
		setKey,
		state,
		sticky = false,
		top;

	// Apply options
	if (typeof set == 'object') for (setKey in set) options[setKey] = set[setKey];
	else if (typeof set == 'string') options.id = set;

	// Remove any conflicting overlay
	if ($('#' + options.id).length > 0) $('#' + options.id).remove();

	// Create overlay, hidden before adding to DOM
	overlayEl = $('<div></div>');
	overlayEl.attr('id', options.id).css({display: 'none','pointer-events': 'none'});
	$("#main").prepend(overlayEl);
	overlay = $('#' + options.id);

	// Unless a custom z-index is set, ensure the overlay will be behind everything
	if (overlay.css('z-index') == 'auto') overlay.css('z-index', overlayZBackground);

	// Override the default overlay height with the actual page height
	pageHeight = parseFloat($(document).height());
	overlay.height(pageHeight);

	// Add the first grid line so that we can measure it
	overlay.append('<div id="' + options.id + '-horiz" class="horiz first-line">');

	// Position off-screen and display to calculate height
	top = overlay.css("top");
	overlay.css({
		top: "-999px",
		display: "block"
	});

	// Calculate the number of grid lines needed
	line = $('#' + options.id + '-horiz');
	lineHeight = line.outerHeight();
	overlay.css({display: "none", top: top});
	if (lineHeight <= 0) return false;
	numGridLines = Math.floor(pageHeight / lineHeight);
	gridLines = '';
	for (i = numGridLines - 1; i >= 1; i--) {
		gridLines += '<div class="horiz"></div>';
	}
	overlay.append(gridLines);
	overlay.append($('<div class="vert-container"></div>'));
	overlayVert = overlay.children('.vert-container');
	gridWidth = overlay.width();
	overlayVert.css({width: gridWidth, position: 'absolute', top: 0});
	overlayVert.append('<div class="vert first-line">&nbsp;</div>');
	gridLines = '';
	for (i = 0; i < 30; i++) gridLines += '<div class="vert">&nbsp;</div>'
	overlayVert.append(gridLines);
	overlayVert.children().height(pageHeight).css({ display: 'inline-block' });
	overlayCookie = readCookie(options.cookiePrefix + options.id);
	if (typeof overlayCookie == 'string') {
		state = overlayCookie.split(',');
		state[2] = Number(state[2]);
		if ((typeof state[2] == 'number') && !isNaN(state[2])) {
			classNumber = state[2].toFixed(0);
			overlay.addClass(options.classPrefix + classNumber);
		}
		if (state[1] == 'F') {
			overlayZState = 'F';
			overlay.css('z-index', overlayZForeground);
		}
		if (state[0] == '1') {
			overlayOn = true;
			sticky = true;
			showOverlay();
		}
	}
	else overlay.addClass(options.classPrefix + classNumber);
	$(document).bind('keydown', keydownHandler);
	$(document).bind('keyup', keyupHandler);

	function getModifier(e) {
		if (options.modifierKey == null) return true; // Bypass by default
		var m = true;
		switch(options.modifierKey) {
			case 'ctrl': m = (e.ctrlKey ? e.ctrlKey : false);	break;
			case 'alt':	m = (e.altKey ? e.altKey : false); break;
			case 'shift':	m = (e.shiftKey ? e.shiftKey : false); break;
		}
		return m;
	}

	function getKey(e) {
		var k = false, c = (e.keyCode ? e.keyCode : e.which);
		k = (c == 13) ? 'enter' : String.fromCharCode(c).toLowerCase();
		return k;
	}

	function saveState() {
		createCookie(options.cookiePrefix + options.id, (sticky ? '1' : '0') + ',' + overlayZState + ',' + classNumber, 1);
	}

	function showOverlay() {
		overlay.show();
		overlayVert.css({width: overlay.width()});
		// hide any vertical blocks that aren't at the top of the viewport
		overlayVert.children('.vert').each(function () {
			$(this).css('display','inline-block');
			if ($(this).offset().top > 0)	$(this).hide();
		});
	}

	function keydownHandler(e) {
		var k, m, source = e.target.tagName.toLowerCase();
		if ((source == 'input') || (source == 'textarea') || (source == 'select')) {
			return true;
		}
		m = getModifier(e);
		if (!m) return true;
		k = getKey(e);
		if (!k) return true;
		switch(k) {
			case options.showGridKey:
				if (!overlayOn) {
					showOverlay();
					overlayOn = true;
				}
				else if (sticky) {
					overlay.hide();
					overlayOn = false;
					sticky = false;
					saveState();
				}
				break;
			case options.holdGridKey:
				if (overlayOn && !sticky) {
					// Turn sticky overlay on
					sticky = true;
					saveState();
				}
				break;
			case options.foregroundKey:
				if (overlayOn) {
					// Toggle sticky overlay z-index
					if (overlay.css('z-index') == overlayZForeground) {
						overlay.css('z-index', overlayZBackground);
						overlayZState = 'B';
					}
					else {
						overlay.css('z-index', overlayZForeground);
						overlayZState = 'F';
					}
					saveState();
				}
				break;
			case options.jumpGridsKey:
				if (overlayOn && (options.numberOfGrids > 1)) {
					// Cycle through the available grids
					overlay.removeClass(options.classPrefix + classNumber);
					classNumber++;
					if (classNumber > options.numberOfGrids) classNumber = 1;
					overlay.addClass(options.classPrefix + classNumber);
					showOverlay();
					if (/webkit/.test( navigator.userAgent.toLowerCase() )) {
						forceRepaint();
					}
					saveState();
				}
				break;
		}

		return true;
	}

	function keyupHandler(e) {
		var k, m = getModifier(e);
		if (!m) return true;
		k = getKey(e);
		if (k && (k == options.showGridKey) && !sticky) {
			overlay.hide();
			overlayOn = false;
		}
		return true;
	}

	function createCookie(name, value, days) {
		var date, expires = "";
		if (days) {
			date = new Date();
			date.setTime( date.getTime() + (days*24*60*60*1000) );
			expires = "; expires=" + date.toGMTString();
		}
		document.cookie = name + "=" + value + expires + "; path=/";
	}

	function readCookie(name) {
		var c,
			ca = document.cookie.split(';'),
			i = 0,
			len = ca.length,
			nameEQ = name + "=";

		for (; i < len; i++) {
			c = ca[i];
			while (c.charAt(0) == ' ') c = c.substring(1, c.length);
			if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
		}
		return null;
	}

	function eraseCookie(name) {
		createCookie(name, "", -1);
	}

	function forceRepaint() {
		var ss = document.styleSheets[0];
		try {
			ss.addRule('.xxxxxx', 'position: relative');
			ss.removeRule(ss.rules.length - 1);
		} catch(e) {}
	}
	return {};
};

$(document).ready(function() {var grid = new hashgrid({numberOfGrids: 1});});

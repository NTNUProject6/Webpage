
function addEvent(element, type, handler) {
	if (!handler.$$guid) handler.$$guid = addEvent.guid++;
	if (!element.events) element.events = {};
	var handlers = element.events[type];
	if (!handlers) {
		handlers = element.events[type] = {};
		if (element["on" + type]) {
			handlers[0] = element["on" + type];
		}
	}
	handlers[handler.$$guid] = handler;
	element["on" + type] = handleEvent;
};
addEvent.guid = 1;

function removeEvent(element, type, handler) {
	if (element.events && element.events[type]) {
		delete element.events[type][handler.$$guid];
	}
};

function handleEvent(event) {
	var returnValue = true;
	event = event || fixEvent(window.event);
	var handlers = this.events[event.type];
	for (var i in handlers) {
		this.$$handleEvent = handlers[i];
		if (this.$$handleEvent(event) === false) {
			returnValue = false;
		}
	}
	return returnValue;
};

function fixEvent(event) {
	event.preventDefault = fixEvent.preventDefault;
	event.stopPropagation = fixEvent.stopPropagation;
	return event;
};
fixEvent.preventDefault = function() {
	this.returnValue = false;
};
fixEvent.stopPropagation = function() {
	this.cancelBubble = true;
};

function createElement(element) {
	if (typeof document.createElementNS != 'undefined') {
		return document.createElementNS('http://www.w3.org/1999/xhtml', element);
	}
	if (typeof document.createElement != 'undefined') {
		return document.createElement(element);
	}
	return false;
}
function getEventTarget(e) {
	var targ;
	if (!e) {
		e = window.event;
	}
	if (e.target) {
		targ = e.target;
	} else if (e.srcElement) {
		targ = e.srcElement;
	}
	if (targ.nodeType == 3) { 
		targ = targ.parentNode;
	}

	return targ;
}


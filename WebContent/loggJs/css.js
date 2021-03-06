
var css = {
	
	getElementsByClass : function(node, searchClass, tag) {
		var classElements = new Array();
		var els = node.getElementsByTagName(tag);
		var elsLen = els.length;
		var pattern = new RegExp("(^|\\s)"+searchClass+"(\\s|$)");
		
		
		for (var i = 0, j = 0; i < elsLen; i++) {
			if (this.elementHasClass(els[i], searchClass) ) {
				classElements[j] = els[i];
				j++;
			}
		}
		return classElements;
	},


	privateGetClassArray: function(el) {
		return el.className.split(' '); 
	},

	
	privateCreateClassString: function(classArray) {
		return classArray.join(' ');
	},

	elementHasClass: function(el, classString) {
		if (!el) {
			return false;
		}
		
		var regex = new RegExp('\\b'+classString+'\\b');
		if (el.className.match(regex)) {
			return true;
		}

		return false;
	},

	
	addClassToId: function(idString, classString) {
		this.addClassToElement(document.getElementById(idString), classString);
	},

	
	addClassToElement: function(el, classString) {
		var classArray = this.privateGetClassArray(el);

		if (this.elementHasClass(el, classString)) {
			return; 
		}

		classArray.push(classString);

		el.className = this.privateCreateClassString(classArray);
	},

	
	removeClassFromId: function(idString, classString) {
		this.removeClassFromElement(document.getElementById(idString), classString);
	},

	removeClassFromElement: function(el, classString) {
		var classArray = this.privateGetClassArray(el);

		for (x in classArray) {
			if (classString == classArray[x]) {
				classArray[x] = '';
				break;
			}
		}

		el.className = this.privateCreateClassString(classArray);
	}
}
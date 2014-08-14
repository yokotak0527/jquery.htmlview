(($)->
	$.fn.htmlview = (ops)->
		# ----------------------------------------------------------------------
		_escape = (str)->
			if(str && typeof str == 'string')
				str = str.replace(/\&lt;/g,'<')
				str = str.replace(/\&gt;/g,'>')
				return str.replace(/[&<>"']/g,($0)->
					return {
						'\&' : '&#38;'
						'\<' : '&#60;'
						'\>' : '&#62;'
						'\"' : '&#34;'
						'\'' : '&#39;'
					}[$0]
				)
			return
		# ----------------------------------------------------------------------
		return this.each(()->
			$(this).html(_escape($(this).html()))
			return
		)
)(jQuery)
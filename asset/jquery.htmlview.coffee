(($)->
	$.fn.htmlview = (ops)->
		# ----------------------------------------------------------------------
		config = $.extend({
			'posFix' : true
		},ops)
		# ----------------------------------------------------------------------
		_escape = (str)->
			str = str.replace(/^[\s\S]/,'')
			str = str.replace(/[\s]$/,'')
			# str = str.replace(/\&lt;/g,'<')
			# str = str.replace(/\&gt;/g,'>')
			# 
			if(config.posFix)
				trimSpace = null
				str       = str.replace(/^([\s]*)(?=\S)/,($0)->
					trimSpace = $0;
					return $0;
				)
				strArr = str.split(/\r\n|\r|\n/)
				l      = strArr.length
				str    = ''
				for line,i in strArr
					line = line.replace(trimSpace,'')
					str += if(i != l-1) then line + '\n' else line
			return str
		# ----------------------------------------------------------------------
		return this.each(()->
			str = $(this).html()
			if(str && typeof str == 'string') then $(this).text(_escape(str))
			return this
		)
)(jQuery)
(function($) {
  return $.fn.htmlview = function(ops) {
    var config, _escape;
    config = $.extend({
      'posFix': true
    }, ops);
    _escape = function(str) {
      var i, l, line, strArr, trimSpace, _i, _len;
      str = str.replace(/^[\s\S]/, '');
      str = str.replace(/[\s]$/, '');
      if (config.posFix) {
        trimSpace = null;
        str = str.replace(/^([\s]*)(?=\S)/, function($0) {
          trimSpace = $0;
          return $0;
        });
        strArr = str.split(/\r\n|\r|\n/);
        l = strArr.length;
        str = '';
        for (i = _i = 0, _len = strArr.length; _i < _len; i = ++_i) {
          line = strArr[i];
          line = line.replace(trimSpace, '');
          str += i !== l - 1 ? line + '\n' : line;
        }
      }
      return str;
    };
    return this.each(function() {
      var str;
      str = $(this).html();
      if (str && typeof str === 'string') {
        $(this).text(_escape(str));
      }
      return this;
    });
  };
})(jQuery);

//# sourceMappingURL=jquery.htmlview.js.map

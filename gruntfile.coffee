'use strict'

module.exports = (grunt) ->
	grunt.loadNpmTasks('grunt-contrib-coffee')
	grunt.config.init({
		coffee : 
			compile : 
				options : 
					sourceMap    : true
					bare         : true
					sourceMapDir : 'build/'
				expand  : false
				flatten : true
				files   : 
					'build/jquery.htmlview.js' : 'asset/jquery.htmlview.coffee'
	})

	grunt.registerTask 'compile', ()->
		grunt.task.run('coffee:compile')
		return
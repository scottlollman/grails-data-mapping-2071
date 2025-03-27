package grails.data.mapping.bug

class BootStrap {

	def init = { servletContext ->
		log.info("Demonstrating https://github.com/apache/grails-data-mapping/issues/2071\n\nExample.exists( 0 )")
		Example.exists(0)

		log.info("A viable workaround is to use countById\n\nExample.countById( 0 )")
		Example.countById(0)
	}
	def destroy = {
	}
}
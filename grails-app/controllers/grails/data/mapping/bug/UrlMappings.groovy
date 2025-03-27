package grails.data.mapping.bug

class UrlMappings {
	static mappings = {
		"/"(view: "/index")
		"500"(view:'/index')
		"404"(view:'/index')
	}
}

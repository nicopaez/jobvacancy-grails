class UrlMappings {

	static mappings = {
		
		"/" {
			controller = "Home"
			action = "index"
		 }
		
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "500"(view:'/error')
	}
}

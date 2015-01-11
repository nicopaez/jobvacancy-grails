package com.jobvacancy

class JobOffer {

	String title
	String location
	String description
	
    static constraints = {
		title(blank:false)
		location(nullable: true)
		description(nullable: true)
    }

}

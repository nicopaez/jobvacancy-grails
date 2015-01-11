import com.jobvacancy.JobOffer

class BootStrap {

	def init = { servletContext ->

		if (JobOffer.count() < 1) {
			def javaOffer = new JobOffer(title: "Java Programmer", location: "Buenos Aires", description:"Spring expirience required").save(flush:true);
			def pythonOffer = new JobOffer(title: "Python Programmer", location: "La Plata", description:"Dyango expirience required").save(flush:true);
		}
	}

	def destroy = {
	}
}

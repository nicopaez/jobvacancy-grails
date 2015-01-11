package com.jobvacancy

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(JobOffer)
class JobOfferSpec extends Specification {

    void "not valid with blank title"() {
		
		setup:
			def jobOffer = new JobOffer();
			
		when: 
			def isValid = jobOffer.validate();
			
		then:
			isValid == false;
    }
	
	void "valid with only title"() {
		
		setup:
			def jobOffer = new JobOffer();
			jobOffer.setTitle("My job offer");
			
		when:
			def isValid = jobOffer.validate();
			
		then:
			isValid == true;
	}
}

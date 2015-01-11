package com.jobvacancy



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class JobOfferController {

	def latest(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond JobOffer.list(params), model:[jobOfferInstanceCount: JobOffer.count()]
	}
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond JobOffer.list(params), model:[jobOfferInstanceCount: JobOffer.count()]
    }

    def show(JobOffer jobOfferInstance) {
        respond jobOfferInstance
    }

    def create() {
        respond new JobOffer(params)
    }

    @Transactional
    def save(JobOffer jobOfferInstance) {
        if (jobOfferInstance == null) {
            notFound()
            return
        }

        if (jobOfferInstance.hasErrors()) {
            respond jobOfferInstance.errors, view:'create'
            return
        }

        jobOfferInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'jobOffer.label', default: 'JobOffer'), jobOfferInstance.id])
                redirect jobOfferInstance
            }
            '*' { respond jobOfferInstance, [status: CREATED] }
        }
    }

    def edit(JobOffer jobOfferInstance) {
        respond jobOfferInstance
    }

    @Transactional
    def update(JobOffer jobOfferInstance) {
        if (jobOfferInstance == null) {
            notFound()
            return
        }

        if (jobOfferInstance.hasErrors()) {
            respond jobOfferInstance.errors, view:'edit'
            return
        }

        jobOfferInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'JobOffer.label', default: 'JobOffer'), jobOfferInstance.id])
                redirect jobOfferInstance
            }
            '*'{ respond jobOfferInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(JobOffer jobOfferInstance) {

        if (jobOfferInstance == null) {
            notFound()
            return
        }

        jobOfferInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'JobOffer.label', default: 'JobOffer'), jobOfferInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'jobOffer.label', default: 'JobOffer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

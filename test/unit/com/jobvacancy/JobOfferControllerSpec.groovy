package com.jobvacancy

import grails.test.mixin.TestFor;
import grails.test.mixin.Mock;
import spock.lang.*

@TestFor(JobOfferController)
@Mock(JobOffer)
class JobOfferControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        params["title"] = 'Java Programmer'
		params["location"] = 'Buenos Aires'
		params["description"] = 'Spring experience required'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.jobOfferInstanceList
            model.jobOfferInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.jobOfferInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def jobOffer = new JobOffer()
            jobOffer.validate()
            controller.save(jobOffer)

        then:"The create view is rendered again with the correct model"
            model.jobOfferInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            jobOffer = new JobOffer(params)

            controller.save(jobOffer)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/jobOffer/show/1'
            controller.flash.message != null
            JobOffer.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def jobOffer = new JobOffer(params)
            controller.show(jobOffer)

        then:"A model is populated containing the domain instance"
            model.jobOfferInstance == jobOffer
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def jobOffer = new JobOffer(params)
            controller.edit(jobOffer)

        then:"A model is populated containing the domain instance"
            model.jobOfferInstance == jobOffer
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/jobOffer/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def jobOffer = new JobOffer()
            jobOffer.validate()
            controller.update(jobOffer)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.jobOfferInstance == jobOffer

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            jobOffer = new JobOffer(params).save(flush: true)
            controller.update(jobOffer)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/jobOffer/show/$jobOffer.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/jobOffer/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def jobOffer = new JobOffer(params).save(flush: true)

        then:"It exists"
            JobOffer.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(jobOffer)

        then:"The instance is deleted"
            JobOffer.count() == 0
            response.redirectedUrl == '/jobOffer/index'
            flash.message != null
    }
}

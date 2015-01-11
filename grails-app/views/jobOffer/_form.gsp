<%@ page import="com.jobvacancy.JobOffer" %>



<div class="fieldcontain ${hasErrors(bean: jobOfferInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="jobOffer.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${jobOfferInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: jobOfferInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="jobOffer.location.label" default="Location" />
		
	</label>
	<g:textField name="location" value="${jobOfferInstance?.location}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: jobOfferInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="jobOffer.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${jobOfferInstance?.description}"/>

</div>


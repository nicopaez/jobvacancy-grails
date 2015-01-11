
<%@ page import="com.jobvacancy.JobOffer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jobOffer.label', default: 'JobOffer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-jobOffer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-jobOffer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list jobOffer">
			
				<g:if test="${jobOfferInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="jobOffer.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${jobOfferInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobOfferInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="jobOffer.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${jobOfferInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jobOfferInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="jobOffer.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${jobOfferInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:jobOfferInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${jobOfferInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

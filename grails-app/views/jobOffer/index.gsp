
<%@ page import="com.jobvacancy.JobOffer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jobOffer.label', default: 'JobOffer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-jobOffer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-jobOffer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'jobOffer.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="location" title="${message(code: 'jobOffer.location.label', default: 'Location')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'jobOffer.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${jobOfferInstanceList}" status="i" var="jobOfferInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${jobOfferInstance.id}">${fieldValue(bean: jobOfferInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: jobOfferInstance, field: "location")}</td>
					
						<td>${fieldValue(bean: jobOfferInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${jobOfferInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

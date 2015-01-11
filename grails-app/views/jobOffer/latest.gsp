<%@ page import="com.jobvacancy.JobOffer"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
</head>
<body>

	<h1>Current Job Offers</h1>
	<table class="table table-bordered">
		<thead>
			<tr>

				<g:sortableColumn property="title"
					title="${message(code: 'jobOffer.title.label', default: 'Title')}" />

				<g:sortableColumn property="location"
					title="${message(code: 'jobOffer.location.label', default: 'Location')}" />

				<g:sortableColumn property="description"
					title="${message(code: 'jobOffer.description.label', default: 'Description')}" />

				<!-- <td>link_to 'Apply', url_for(:job_offers, :apply, :offer_id => offer.id), :class => "btn btn-primary"
			 -->
				</td>

			</tr>
		</thead>
		<tbody>
			<g:each in="${jobOfferInstanceList}" status="i"
				var="jobOfferInstance">

				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

					<td><g:link action="show" id="${jobOfferInstance.id}">
							${fieldValue(bean: jobOfferInstance, field: "title")}
						</g:link></td>

					<td>
						${fieldValue(bean: jobOfferInstance, field: "location")}
					</td>

					<td>
						${fieldValue(bean: jobOfferInstance, field: "description")}
					</td>

				</tr>
			</g:each>

			<% end %>
		</tbody>
	</table>
</body>

</html>
<#include "../parts/main-template.ftl">
<@main "List of Tickets"/>
<#macro content>
    <h1>List of Tickets</h1>

    <a href="/../../flights/search" class="ui floated small primary labeled icon button">
        <#--<i class="user icon"></i>-->
        <i class="shopping cart icon"></i>
        Issue Ticket
    </a>

    <table class="ui celled striped table">
    <thead>
    <tr class="ui inverted table">
        <th>Ticket ID</th>
        <th>Flight Direction</th>
        <th>Client's Full Name</th>
        <th>Action</th>
    </tr>
    </thead>

    <tbody>

    <#list tickets as ticket>
        <tr>
            <td>${ticket.id}</td>
            <td>${ticket.schedule.flight.departureCity.name} - ${ticket.schedule.flight.arrivalCity.name}</td>
            <td>${ticket.client.lastName} ${ticket.client.firstName} ${ticket.client.patronymic}</td>
            <td class="four wide column">
                <a href="../tickets/info?id=${ticket.id}"
                   class="ui floated small primary labeled icon button">
                    <i class="info icon"></i>
                    Details
                </a>
                <a href="../tickets/delete?id=${ticket.id}"
                   class="ui floated small red labeled icon button"
                   onclick="if (!(confirm('Are you sure you want to delete this ticket?'))) return false">
                    <i class="trash icon"></i>
                    Delete
                </a>
            </td>
        </tr>
        <#else >
        <tr>
            <td>
                No results
            </td>
        </tr>
    </#list>
</#macro>
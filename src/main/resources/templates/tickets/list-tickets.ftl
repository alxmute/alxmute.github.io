<#include "../parts/main-template.ftl">
<@main "List of Tickets"/>
<#macro content>

    <div class="user-search">
        <div class="ui icon input">
            <input type="text" placeholder="Search ticket..." class="custom-input" onkeyup="tableSearch()">
            <i class="search icon"></i>
        </div>
        <a href="/../../flights/list" class="ui floated primary labeled icon button">
            <i class="shopping cart icon"></i>
            Issue Ticket
        </a>
    </div>

    <div class="table-container">
        <table>
            <thead class="tbl-header">
            <tr>
                <th>Ticket ID</th>
                <th>Flight Direction</th>
                <th>Client's Full Name</th>
                <th>Action</th>
            </tr>
            </thead>
        </table>
        <div class="tbl-content">
            <table class="info-table">
                <tbody>
                <#list tickets as ticket>
                    <tr>
                        <td>${ticket.id}</td>
                        <td>${ticket.schedule.flight.departureCity.name}
                            - ${ticket.schedule.flight.arrivalCity.name}</td>
                        <td>${ticket.client.lastName} ${ticket.client.firstName} ${ticket.client.patronymic}</td>
                        <td>
                            <a href="../tickets/info?id=${ticket.id}"
                               class="button">
                                <i class="info icon"></i>
                                Details
                            </a>
                            <a href="../tickets/delete?id=${ticket.id}"
                               class="button delete-button"
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
                </tbody>
            </table>
        </div>
    </div>

</#macro>
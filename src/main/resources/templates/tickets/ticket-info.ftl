<#include "../parts/main-template.ftl">
<@main "Ticket's info"/>
<#macro content>

    <table class="ui very basic padded table">
        <tr>
            <td><strong>Ticket ID:</strong></td>
            <td>${ticket.id}</td>
        </tr>
        <tr>
            <td><strong>Client's Full Name:</strong></td>
            <td>
                <a href="../../clients/client-info?id=${ticket.client.id}">
                    ${ticket.client.lastName} ${ticket.client.firstName} ${ticket.client.patronymic}
                </a>
            </td>
        </tr>
        <tr>
            <td><strong>Flight ID:</strong></td>
            <td>${ticket.schedule.id}</td>
        </tr>
        <tr>
            <td><strong>Flight Direction:</strong></td>
            <td>${ticket.schedule.flight.departureCity.name}, ${ticket.schedule.flight.departureCity.country.name} -
                ${ticket.schedule.flight.arrivalCity.name}, ${ticket.schedule.flight.arrivalCity.country.name}</td>
        </tr>
        <tr>
            <td><strong>Departure Date and Time:</strong></td>
            <td>${ticket.schedule.departureDate}</td>
        </tr>
        <tr>
            <td><strong>Flight Time:</strong></td>
            <td>${ticket.schedule.time.hour}h ${ticket.schedule.time.minute}m</td>
        </tr>
        <tr>
            <td><strong>Airplane ID:</strong></td>
            <td>${ticket.schedule.airplane.id}</td>
        </tr>
        <tr>
            <td><strong>Airplane Name:</strong></td>
            <td>${ticket.schedule.airplane.name}</td>
        </tr>
        <tr>
            <td><strong>Seat Number:</strong></td>
            <td>${ticket.seat.seatNumber}</td>
        </tr>
        <tr>
            <td><strong>Sale Date:</strong></td>
            <td>${ticket.saleDate}</td>
        </tr>
        <tr>
            <td><strong>Price:</strong></td>
            <td>${ticket.schedule.price}</td>
        </tr>
    </table>

</#macro>
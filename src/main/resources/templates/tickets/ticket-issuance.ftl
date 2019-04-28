<#include "../parts/main-template.ftl">
<#import "/spring.ftl" as spring />
<@main "Ticket Issuance"/>
<#macro content>
    <h1>Ticket Issuance</h1>

    <form class="ui form ticket-form" action="../../tickets/save">
        <input type="hidden" name="scheduleId" value="${schedule.id}">
        <div class="ui internally celled grid">
            <div class="row">
                <div class="nine wide column">
                    <h4 class="ui dividing header">Flight Information</h4>

                    <table class="ui very basic padded table">
                        <tr>
                            <td><strong>Flight ID:</strong></td>
                            <td>${schedule.flight.id}</td>
                        </tr>
                        <tr>
                            <td><strong>Flight Direction:</strong></td>
                            <td>${schedule.flight.departureCity.name} - ${schedule.flight.arrivalCity.name}</td>
                        </tr>
                        <tr>
                            <td><strong>Departure Date and Time:</strong></td>
                            <td>${schedule.departureDate}</td>
                        </tr>
                        <tr>
                            <td><strong>Flight Time:</strong></td>
                            <td>${schedule.time.hour}h ${schedule.time.hour}m</td>
                        </tr>
                        <tr>
                            <td><strong>Airplane ID:</strong></td>
                            <td>${schedule.airplane.id}</td>
                        </tr>
                        <tr>
                            <td><strong>Airplane Name:</strong></td>
                            <td>${schedule.airplane.name}</td>
                        </tr>
                        <tr>
                            <td><strong>Price:</strong></td>
                            <td>${schedule.price} UAH</td>
                    </table>

                </div>
                <div class="seven wide column">

                    <h4 class="ui dividing header">Information for Choice</h4>

                    <div class="field">
                        <label>Select client or <a href="../../clients/add">add new</a></label>
                        <select class="ui fluid search dropdown" name="clientId">
                            <option value="">Client</option>
                            <#list clients as client>
                                <option value="${client.id}">
                                    ${client.lastName} ${client.firstName} ${client.patronymic},
                                    <span class="ui grey text">${client.id}</span>
                                </option>

                            </#list>
                        </select>
                    </div>

                    <div class="field">
                        <label>Seat Number</label>
                        <select class="ui fluid search five column dropdown" name="seatId">
                            <option value="">Seat Number</option>
                            <#list seats as seat>
                                <#if !busySeats?seq_contains(seat)>
                                    <option value="${seat.id}">${seat.seatNumber}</option>
                                </#if>
                            </#list>
                        </select>
                    </div>

                </div>
            </div>
        </div>
        <div class="ui divider"></div>
        <button type="submit" class="ui primary button">Apply</button>
        <div class="ui error message"></div>
    </form>
</#macro>
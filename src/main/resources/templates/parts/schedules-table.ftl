<#macro tableFlights schedules>

    <div class="table-container">
        <table>
            <thead class="tbl-header">
            <tr>
                <th>Flight ID</th>
                <th>From</th>
                <th>To</th>
                <th>Departure date and time</th>
                <th>Flight time</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            </thead>
        </table>
        <div class="tbl-content">
            <table class="info-table">
                <tbody>
                <#list schedules as schedule>
                    <tr>
                        <td>${schedule.id}</td>
                        <td>${schedule.flight.departureCity.name}</td>
                        <td>${schedule.flight.arrivalCity.name}</td>
                        <td>${schedule.departureDate}</td>
                        <#assign x = schedule.time.minute>
                        <td>${schedule.time.hour}h <#if x != 0>${x}m</#if></td>
                        <td>${schedule.price} UAH</td>
                        <td>
                            <a href="../../tickets/issuance?id=${schedule.id}"
                               class="button">
                                <i class="shopping cart icon"></i>
                                <span class="hidden">Issue a ticket</span>
                            </a>
                        </td>
                    </tr>
                <#else>
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
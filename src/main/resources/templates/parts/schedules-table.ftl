<#-- @ftlvariable name="schedule" type="ua.nmu.airportticketoffice.entity.Schedule" -->
<#macro tableFlights schedules>

    <table class="ui very padded celled striped table">
    <thead>
    <tr class="ui inverted table">
        <th>Flight ID</th>
        <th>From</th>
        <th>To</th>
        <th>Departure date and time</th>
        <th>Flight time</th>
        <th>Price</th>
    </tr>
    </thead>

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
        </tr>
    <#else>
        <tr>
            <td>
                No results
            </td>
        </tr>
    </#list>

</#macro>
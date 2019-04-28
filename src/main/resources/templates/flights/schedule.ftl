<#include "../parts/main-template.ftl">
<#include '../parts/schedules-table.ftl'>

<@main "Schedule list"/>

<#macro content>
    <h1>Full Schedule of All Flights</h1>
    <p><a href="../../flights/search">< Back</a></p>
    <@tableFlights schedules/>
</#macro>
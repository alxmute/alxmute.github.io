<#include "../parts/main-template.ftl">
<#include '../parts/schedules-table.ftl'>

<@main "Schedule list"/>

<#macro content>

    <p><a href="../../flights/search">< Back</a></p>
    <@tableFlights schedules/>

</#macro>
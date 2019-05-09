<#include "../parts/main-template.ftl">
<#include '../parts/schedules-table.ftl'>

<@main "Schedule list"/>

<#macro content>

    <div><a href="../../flights/list">< Back</a></div>
    <@tableFlights schedules/>

</#macro>
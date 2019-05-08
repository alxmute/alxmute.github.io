<#include "../parts/main-template.ftl">
<#include '../parts/schedules-table.ftl'>

<@main "Search flights"/>
<#macro content>

    <p><a href="../../flights/schedule">Full schedule of all flights</a></p>

    <form class="ui form flight-form" action="../flights/list" method="post">
        <div class="fields">
            <div class="six wide field">
                <label>From:</label>
                <div class="ui search selection dropdown">
                    <input type="hidden" name="from">
                    <div class="default text">Select City</div>
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <#list cities as city>
                            <div class="item" data-value="${city.id}">${city.name}, ${city.country.name}</div>
                        </#list>
                    </div>
                </div>
            </div>
            <div class="six wide field">
                <label>To:</label>
                <div class="ui search selection dropdown">
                    <input type="hidden" name="to">
                    <div class="default text">Select City</div>
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <#list cities as city>
                            <div class="item" data-value="${city.id}">${city.name}, ${city.country.name}</div>
                        </#list>
                    </div>
                </div>
            </div>
            <div class="four wide field">
                <label>When:</label>
                <div class="two fields">
                    <div class="thirteen wide field">
                        <div class="ui calendar" id="date_calendar">
                            <div class="ui input left icon">
                                <i class="calendar icon"></i>
                                <input type="text" placeholder="Date" name="date" autocomplete="off">
                            </div>
                        </div>
                    </div>
                    <div class="three wide field">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button class="ui icon primary button" type="submit">
                            <i class="search icon"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <#if schedules??>
        <@tableFlights schedules/>
    </#if>

</#macro>
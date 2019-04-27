<#include "../main-template.ftl">
<@main "List of clients"/>
<#macro content>
    <h1>Search flights</h1>

    <form class="ui form flight-form" action="../flights/list">
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
                        <button class="ui icon primary button" type="submit">
                            <i class="search icon"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>


    <#if schedules??>

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
                <td>${schedule.time}</td>
                <td>${schedule.price}</td>
            </tr>
            <#else>
            <tr>
                <td>
                    No results
                </td>
            </tr>
        </#list>
    </#if>


</#macro>
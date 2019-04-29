<#include "../parts/main-template.ftl">
<#include "../parts/security.ftl">

<@main "List of clients"/>
<#macro content>
    <h1>List of Clients</h1>

    <a href="../clients/add" class="ui floated small primary labeled icon button">
        <i class="user icon"></i>
        Add Client
    </a>

    <table class="ui very padded celled striped table">
    <thead>
    <tr class="ui inverted table">
        <th>Last Name</th>
        <th>First Name</th>
        <th>Patronymic</th>
        <th>Action</th>
    </tr>
    </thead>

    <tbody>

    <#list clients as client>
        <tr>
            <td>${client.lastName}</td>
            <td>${client.firstName}</td>
            <td>${client.patronymic}</td>
            <td class="<#if isAdmin>four<#else>two</#if> wide column">
                <a href="../clients/client-info?id=${client.id}"
                   class="ui floated small primary labeled icon button">
                    <i class="info icon"></i>
                    Details
                </a>
                <#if isAdmin>
                    <a href="../clients/delete?id=${client.id}"
                       class="ui floated small red labeled icon button"
                       onclick="if (!(confirm('Are you sure you want to delete this client?'))) return false">
                        <i class="trash icon"></i>
                        Delete
                    </a>
                </#if>
            </td>
        </tr>
    </#list>
</#macro>
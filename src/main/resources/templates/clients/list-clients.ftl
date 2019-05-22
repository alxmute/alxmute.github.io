<#include "../parts/main-template.ftl">
<#include "../parts/security.ftl">

<@main "List of clients"/>
<#macro content>

    <div class="user-search">
        <div class="ui icon input">
            <input type="text" placeholder="Search client..." class="custom-input" onkeyup="tableSearch()">
            <i class="search icon"></i>
        </div>
        <a href="../clients/add" class="ui floated primary labeled icon button">
            <i class="user plus icon"></i>
            Add Client
        </a>
    </div>

    <div class="table-container">
        <table>
            <thead class="tbl-header">
            <tr>
                <th>Last Name</th>
                <th>First Name</th>
                <th>Patronymic</th>
                <th>Action</th>
            </tr>
            </thead>
        </table>
        <div class="tbl-content">
            <table class="info-table">
                <tbody>
                <#list clients as client>
                    <tr>
                        <td>${client.lastName}</td>
                        <td>${client.firstName}</td>
                        <td>${client.patronymic}</td>
                        <td>
                            <a href="../clients/client-info?id=${client.id}"
                               class="button">
                                <i class="info icon"></i>
                                <span class="hidden">Details</span>
                            </a>
                            <#if isAdmin>
                                <a href="../clients/delete?id=${client.id}"
                                   class="button delete-button"
                                   onclick="if (!(confirm('Are you sure you want to delete this client?'))) return false">
                                    <i class="trash icon"></i>
                                    <span class="hidden">Delete</span>
                                </a>
                            </#if>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>

</#macro>
<#include "../parts/main-template.ftl">
<#include "../parts/security.ftl">

<@main "List of users"/>
<#macro content>
    <h1>List of users</h1>

    <a href="../users/add" class="ui floated small primary labeled icon button">
        <i class="user icon"></i>
        Add User
    </a>

    <table class="ui celled striped table">
    <thead>
    <tr class="ui inverted table">
        <th>Username</th>
        <th>Password</th>
    </tr>
    </thead>

    <tbody>

    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td class="four wide column">
                <a href="../users/edit?id=${user.id}"
                   class="ui floated small primary labeled icon button">
                    <i class="info icon"></i>
                    edit
                </a>
                <a href="../users/delete?id=${user.id}"
                   class="ui floated small red labeled icon button"
                   onclick="if (!(confirm('Are you sure you want to delete this user?'))) return false">
                    <i class="trash icon"></i>
                    Delete
                </a>
            </td>
        </tr>
    </#list>
</#macro>
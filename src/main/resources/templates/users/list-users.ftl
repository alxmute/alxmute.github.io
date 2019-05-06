<#include "../parts/main-template.ftl">
<#include "../parts/security.ftl">

<@main "List of users"/>
<#macro content>

    <div class="user-search">
        <div class="ui icon input">
            <input type="text" placeholder="Search user..." class="custom-input" onkeyup="tableSearch()">
            <i class="search icon"></i>
        </div>
        <a href="../users/add" class="ui floated primary labeled icon button">
            <i class="user plus icon"></i>
            Add User
        </a>
    </div>

    <div class="table-container">
        <table>
            <thead class="tbl-header">
            <tr>
                <th>Username</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            </thead>
        </table>
        <div class="tbl-content">
            <table class="info-table">
                <tbody>
                <#list users as user>
                    <tr>
                        <td>${user.username}</td>
                        <td>
                            <#list user.roles as role>
                                ${role.roleName}
                            </#list>
                        </td>
                        <td>
                            <a href="../users/edit?id=${user.id}"
                               class="button">
                                <i class="edit icon"></i>
                                Edit
                            </a>
                            <a href="../users/delete?id=${user.id}"
                               class="button delete-button"
                               onclick="if (!(confirm('Are you sure you want to delete this user?'))) return false">
                                <i class="trash icon"></i>
                                Delete
                            </a>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>

</#macro>
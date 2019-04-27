<#include "../main-template.ftl">
<@main "Client's info"/>
<#macro content>
    <h1>Client's info</h1>

    <table class="ui very basic padded table">
        <tr>
            <td><strong>Full Name:</strong></td>
            <td>${client.lastName} ${client.firstName} ${client.patronymic}</td>
        </tr>
        <tr>
            <td><strong>Birth Date:</strong></td>
            <td>${client.passportData.birthdate}</td>
        </tr>
        <tr>
            <td><strong>Birth Place:</strong></td>
            <td>${client.passportData.birthPlace}</td>
        </tr>
        <tr>
            <td><strong>Sex:</strong></td>
            <td>${client.passportData.sex}</td>
        </tr>
        <tr>
            <td><strong>Registration:</strong></td>
            <td>${client.passportData.registration}</td>
        </tr>
        <tr>
            <td><strong>Passport:</strong></td>
            <td>${client.passportData.series} ${client.passportData.number}</td>
        </tr>
        <tr>
            <td><strong>Issue Date:</strong></td>
            <td>${client.passportData.issueDate}</td>
        </tr>
        <tr>
            <td><strong>Issue Place:</strong></td>
            <td>${client.passportData.issuePlace}</td>
        </tr>
        <tr>
            <td><strong>Phones:</strong></td>
            <td>
                <#list client.phones as phone>
                    <p>${phone.phone}</p>
                </#list>
            </td>
        </tr>
    </table>

    <a href="../../clients/edit?id=${client.id}"
       class="ui floated small labeled icon button">
        <i class="edit icon"></i>
        Edit
    </a>

<#--<table class="ui very padded definition table">-->
<#--<tr>-->
<#--<td>Full Name:</td>-->
<#--<td>${client.lastName} ${client.firstName} ${client.patronymic}</td>-->
<#--</tr>-->
<#--<tr>-->
<#--<td>Birth Date:</td>-->
<#--<td>${client.passportData.birthdate}</td>-->
<#--</tr>-->
<#--<tr>-->
<#--<td>Sex:</td>-->
<#--<td>${client.passportData.sex}</td>-->
<#--</tr>-->
<#--<tr>-->
<#--<td>Note:</td>-->
<#--<td>${client.passportData.note}</td>-->
<#--</tr>-->
<#--</table>-->
</#macro>
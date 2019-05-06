<#include "../parts/main-template.ftl">
<#import "/spring.ftl" as spring />
<@main "Add user"/>
<#macro content>

    <@spring.bind "theUser"/>
    <form class="ui form user-form" action="../users/save" method="post">

        <@spring.formHiddenInput "theUser.id"/>

        <div class="six wide field">
            <label>Username</label>
            <@spring.formInput
            "theUser.username" "placeholder='Username' autocomplete='off'" "text"/>
        </div>
        <div class="six wide field">
            <label>New Password</label>
            <@spring.formPasswordInput
            "theUser.password" "placeholder='Password' autocomplete='off'"/>
        </div>
        <div class="grouped fields">
            <label>Role</label>

            <@spring.bind "theUser.roles"/>
            <#list roles as role>
                <#assign id="${spring.status.expression?replace('[','')?replace(']','')}${role_index}">
                <#assign isSelected = false>
                <#if theUser.roles??>
                    <#list theUser.roles as nextInList>
                        <#if nextInList.roleName == role.roleName>
                            <#assign isSelected = true>
                        </#if>
                    </#list>
                </#if>
                <div class="six wide field">
                    <div class="ui radio checkbox">
                        <input type="radio" id="${id}" name="${spring.status.expression}"
                               value="${role.id}"<#if isSelected> checked="checked"</#if>>
                        <label for="${id}">${role.roleName}</label>
                    </div>
                </div>
            </#list>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="ui primary button">${action}</button>
        <div class="ui error message"></div>
    </form>

</#macro>
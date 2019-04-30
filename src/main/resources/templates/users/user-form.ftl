<#include "../parts/main-template.ftl">
<#import "/spring.ftl" as spring />
<@main "Add user"/>
<#macro content>
    <h1>${action} user</h1>

    <@spring.bind "theUser"/>
    <form class="ui form user-form" action="../users/save" method="post">

        <div class="eight wide column">
            <@spring.formHiddenInput "theUser.id"/>

            <div class="field">
                <label>Username</label>
                <@spring.formInput
                "theUser.username" "placeholder='Username' autocomplete='off'" "text"/>
            </div>
            <div class="field">
                <label>Password</label>
                <@spring.formPasswordInput
                "theUser.password" "placeholder='Password' autocomplete='off'"/>
            </div>
            <div class="field">
                <label>Role</label>
                <#--<@spring.formRadioButtons "user.roles" "roles" "<br>"/>-->

                <@spring.bind "theUser.roles"/>
                <#list roles as role>
                    <#assign id="${spring.status.expression?replace('[','')?replace(']','')}${role_index}">
                    <#assign isSelected = false>
                    <#if theUser.roles??>
                        <#--<#assign isSelected = user.roles.contains(role)>-->

                    <#list theUser.roles as nextInList>
                            <#if nextInList.roleName == role.roleName>
                                <#assign isSelected = true>
                            </#if>
                        </#list>
                    </#if>
                    <label>
                        <input type="checkbox"
                               id="${id}" name="${spring.status.expression}"
                               value="${role.id}"
                                <#if isSelected> checked="checked"</#if>
                        >

                        ${role.roleName}
                    </label>
                </#list>
            </div>

        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="ui primary button">${action}</button>
        <div class="ui error message"></div>
    </form>
</#macro>
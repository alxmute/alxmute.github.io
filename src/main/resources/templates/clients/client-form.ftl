<#include "../parts/main-template.ftl">
<#import "/spring.ftl" as spring />
<@main "Add client"/>
<#macro content>

    <@spring.bind "passportData"/>
    <form class="ui form client-form" action="../clients/save" method="post">
        <div class="ui internally celled grid">
            <div class="row">
                <div class="eight wide column">

                    <h4 class="ui dividing header">Main Information</h4>
                    <#assign isNotEmpty = passportData.series??>
                    <#if isNotEmpty>
                        <input type="hidden" name="clientId" value="${passportData.client.id}">
                    </#if>
                    <@spring.formInput "passportData.id" "" "hidden"/>
                    <div class="field">
                        <label>Last Name</label>
                        <input type="text" placeholder="Last Name" name="lastName" autocomplete="off"
                               <#if isNotEmpty>value="${passportData.client.lastName}"</#if>>
                    </div>
                    <div class="field">
                        <label>First Name</label>
                        <input type="text" placeholder="First Name" name="firstName" autocomplete="off"
                               <#if isNotEmpty>value="${passportData.client.firstName}"</#if>>
                    </div>
                    <div class="field">
                        <label>Patronymic</label>
                        <input type="text" placeholder="Patronymic" name="patronymic" autocomplete="off"
                               <#if isNotEmpty>value="${passportData.client.patronymic}"</#if>>
                    </div>
                    <div class="field">
                        <label>Sex</label>
                        <div class="ui selection dropdown">
                            <@spring.bind "passportData.sex"/>
                            <input type="hidden" id="${spring.status.expression?replace('[','')?replace(']','')}"
                                   name="${spring.status.expression}"
                                   <#if isNotEmpty>value="${passportData.sex}"</#if>>
                            <i class="dropdown icon"></i>
                            <div class="default text">Sex</div>
                            <div class="menu">
                                <div class="item" data-value="male" data-text="Male">
                                    Male
                                </div>
                                <div class="item" data-value="female" data-text="Female">
                                    Female
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="field phones-list">
                        <label>Phones</label>
                        <#if isNotEmpty>
                            <#list passportData.client.phones as phone>
                                <div class="field">
                                    <input type="hidden" name="phoneId" value="${phone.id}">
                                    <input type="tel" name="phone" placeholder="Phone number" class="phone"
                                           autocomplete="off" value="${phone.phone}">
                                </div>
                            </#list>
                        <#else>
                            <div class="field">
                                <input type="tel" name="phone" placeholder="Phone number" class="phone"
                                       autocomplete="off">
                            </div>
                        </#if>
                    </div>
                    <a class="add-button">+ Add</a>
                </div>

                <div class="eight wide column">
                    <h4 class="ui dividing header">Passport Data</h4>
                    <div class="field">
                        <label>Passport Series</label>
                        <@spring.formInput
                        "passportData.series" "placeholder='Passport Series' autocomplete='off' maxlength='2'" "text"/>
                    </div>
                    <div class="field">
                        <label>Passport ID</label>
                        <@spring.formInput
                        "passportData.number" "placeholder='Passport ID' autocomplete='off' maxlength='6'" "text"/>
                    </div>
                    <div class="field">
                        <label>Issue Place</label>
                        <@spring.formInput
                        "passportData.issuePlace" "placeholder='Issue Place' autocomplete='off'" "text"/>
                    </div>
                    <div class="field">
                        <label>Issue Date</label>
                        <div class="ui calendar">
                            <@spring.formInput
                            "passportData.issueDate" "placeholder='Issue Date' autocomplete='off'" "text"/>
                        </div>
                    </div>
                    <div class="field">
                        <label>Birth Date</label>
                        <div class="ui calendar">
                            <@spring.formInput
                            "passportData.birthdate" "placeholder='Birth Date' autocomplete='off'" "text"/>
                        </div>
                    </div>
                    <div class="field">
                        <label>Birth Place</label>
                        <@spring.formInput
                        "passportData.birthPlace" "placeholder='Birth Place' autocomplete='off'" "text"/>
                    </div>
                    <div class="field">
                        <label>Registration</label>
                        <@spring.formTextarea
                        "passportData.registration" "rows='2'"/>
                    </div>

                </div>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="ui primary button">${action}</button>
    </form>
</#macro>
<#include "../main-template.ftl">
<#import "/spring.ftl" as spring />
<@main "Client's info"/>
<#macro content>
    <h1>${action} client</h1>

    <@spring.bind "passportData"/>
    <form class="ui form client-form" action="../clients/save">
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
                        <input type="text" placeholder="Last Name" name="lastName" autocomplete="off" required
                               <#if isNotEmpty>value="${passportData.client.lastName}"</#if>>
                    </div>
                    <div class="field">
                        <label>First Name</label>
                        <input type="text" placeholder="First Name" name="firstName" autocomplete="off" required
                               <#if isNotEmpty>value="${passportData.client.firstName}"</#if>>
                    </div>
                    <div class="field">
                        <label>Patronymic</label>
                        <input type="text" placeholder="Patronymic" name="patronymic" autocomplete="off" required
                               <#if isNotEmpty>value="${passportData.client.patronymic}"</#if>>
                    </div>
                    <div class="field">
                        <label>Sex</label>
                        <div class="ui selection dropdown">
                            <@spring.bind "passportData.sex"/>
                            <input type="hidden" id="${spring.status.expression?replace('[','')?replace(']','')}"
                                   name="${spring.status.expression}" required
                                   <#if isNotEmpty>value="${passportData.sex}"</#if>>
                            <#--<input type="hidden" name="sex" <#if isNotEmpty>value="${client.passportData.sex}"</#if>>-->
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
                                <input type="tel" name="phone" placeholder="Phone number" class="phone" required
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
                        "passportData.series" "placeholder='Passport Series' autocomplete='off' required" "text"/>
                    </div>
                    <div class="field">
                        <label>Passport ID</label>
                        <@spring.formInput
                        "passportData.number" "placeholder='Passport ID' autocomplete='off' required" "text"/>
                    </div>
                    <div class="field">
                        <label>Issue Place</label>
                        <@spring.formInput
                        "passportData.issuePlace" "placeholder='Issue Place' autocomplete='off' required" "text"/>
                    </div>
                    <div class="field">
                        <label>Issue Date</label>
                        <div class="ui calendar">
                            <@spring.formInput
                            "passportData.issueDate" "placeholder='Birth Place' autocomplete='off' required" "text"/>
                        </div>
                    </div>
                    <div class="field">
                        <label>Birth Date</label>
                        <div class="ui calendar">
                            <@spring.formInput
                            "passportData.birthdate" "placeholder='Birth Place' autocomplete='off' required" "text"/>
                        </div>
                    </div>
                    <div class="field">
                        <label>Birth Place</label>
                        <@spring.formInput
                        "passportData.birthPlace" "placeholder='Birth Place' autocomplete='off' required" "text"/>
                    </div>
                    <div class="field">
                        <label>Registration</label>
                        <@spring.formTextarea
                        "passportData.registration" "rows='2'"/>
                    </div>

                </div>
            </div>
        </div>
        <button type="submit" class="ui primary button">${action}</button>
    </form>
</#macro>
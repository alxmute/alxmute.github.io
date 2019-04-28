$('.ui.dropdown').dropdown();

let today = new Date();
$('.client-form .ui.calendar').calendar({
    type: 'date',
    startMode: 'year',
    minDate: new Date(today.getFullYear() - 100, today.getMonth(), today.getDate()),
    maxDate: new Date(today.getFullYear() - 5, today.getMonth(), today.getDate()),
    formatter: {
        date: function (date, settings) {
            if (!date) return '';
            let day = date.getDate();
            let month = date.getMonth() + 1;
            let year = date.getFullYear();
            return year + '-' + month + '-' + day;
        }
    }
});

$('.flight-form .ui.calendar')
    .calendar({
        type: 'date',
        formatter: {
            date: function (date, settings) {
                if (!date) return '';
                let day = date.getDate();
                let month = date.getMonth() + 1;
                let year = date.getFullYear();
                return year + '-' + month + '-' + day;
            }
        }
    })
;

$('.client-form')
    .form({
        on: 'blur',
        fields: {
            lastName: {
                identifier: 'lastName',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter a last name'
                    }
                ]
            },
            firstName: {
                identifier: 'firstName',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter a first name'
                    }
                ]
            },
            patronymic: {
                identifier: 'patronymic',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter a patronymic'
                    }
                ]
            },
            sex: {
                identifier: 'sex',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please select a sex'
                    }
                ]
            },
            // phone: {
            //     identifier: 'phone',
            //     rules: [
            //         {
            //             type: 'empty',
            //             prompt: 'Please enter at least one phone number'
            //         }
            //     ]
            // },
            series: {
                identifier: 'series',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter a passport series'
                    }
                ]
            },
            number: {
                identifier: 'number',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter a passport ID'
                    }
                ]
            },
            issuePlace: {
                identifier: 'issuePlace',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter an issue place'
                    }
                ]
            },
            issueDate: {
                identifier: 'issueDate',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please select an issue date'
                    }
                ]
            },
            birthdate: {
                identifier: 'birthdate',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please select an birth date'
                    }
                ]
            },
            birthPlace: {
                identifier: 'birthPlace',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter a birth place'
                    }
                ]
            },
            registration: {
                identifier: 'registration',
                rules: [
                    {
                        type: 'empty',
                        prompt: 'Please enter a registration information'
                    }
                ]
            }
        }
    })
;

let i = 0;
let div = document.querySelector(".phones-list");
document.querySelector(".add-button").onclick = function () {
    div.insertAdjacentHTML(
        'beforeend',
        '<div class="ui icon input field" id="phone-input-field' + i + '">\n' +
        '    <input type="tel" name="phone" placeholder="Phone number" class="phone" autocomplete="off" data-value="' + i + '">\n' +
        '<i class="delete link icon delete-button" data-value="' + i + '"></i>' +
        '</div>'
    );
    i++;

    let deleteButtons = document.querySelectorAll(".delete-button");
    for (let i = 0; i < deleteButtons.length; i++) {
        deleteButtons[i].onclick = function () {
            let toDelete = this.getAttribute("data-value");
            document.querySelector("#phone-input-field" + toDelete).remove();
        }
    }
};

document.querySelector(".client-form").onsubmit = function () {
    let phones = document.querySelectorAll(".phone");
    for (let i = 0; i < phones.length; i++) {
        if (phones[i].value === "") {
            let v = phones[i].getAttribute("data-value");
            document.querySelector("#phone-input-field" + v).remove();
        }
    }
};
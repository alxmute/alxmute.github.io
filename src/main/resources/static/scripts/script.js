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
            lastName: 'empty',
            firstName: 'empty',
            patronymic: 'empty',
            sex: 'empty',
            series: 'exactLength[2]',
            number: 'exactLength[6]',
            issuePlace: 'empty',
            issueDate: 'empty',
            birthdate: 'empty',
            birthPlace: 'empty',
            registration: 'empty',
        }
    })
;

$('.ticket-form')
    .form({
        on: 'blur',
        fields: {
            clientId: 'empty',
            seatId: 'empty'
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

function tableSearch() {
    let phrase = document.querySelector('.custom-input');
    let table = document.querySelector('.info-table');
    let regPhrase = new RegExp(phrase.value, 'i');
    let flag = false;
    for (let i = 0; i < table.rows.length; i++) {
        flag = false;
        for (let j = table.rows[i].cells.length - 1; j >= 0; j--) {
            flag = regPhrase.test(table.rows[i].cells[j].innerHTML);
            if (flag) break;
        }
        if (flag) {
            table.rows[i].style.display = "";
        } else {
            table.rows[i].style.display = "none";
        }

    }
}
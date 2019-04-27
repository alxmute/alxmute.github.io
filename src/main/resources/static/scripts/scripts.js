$('.ui.dropdown').dropdown();

let today = new Date();
$('.ui.calendar').calendar({
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

let div = document.querySelector(".phones-list");
document.querySelector(".add-button").onclick = function () {
    div.insertAdjacentHTML('beforeend',
        '<div class="field">\n' +
        '         <input type="tel" name="phone" placeholder="Phone number" class="phone">\n' +
        '     </div>');
};

document.querySelector(".client-form").onsubmit = function () {
    let phones = document.querySelectorAll(".phone");
    for (let i = 0; i < phones.length; i++){
        if (phones[i].value === ""){
            phones[i].remove();
        }
    }
};
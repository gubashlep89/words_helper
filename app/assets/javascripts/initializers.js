
$(document).ready(function () {
    init_student_select();
    init_answer_checkboxes();
    init_datetimePickers();
    init_home_work_group_select();
});


function init_student_select() {
    $('.select2-student-select').select2({
        width: "100%",
        theme: "bootstrap",
        language: "ru",
        placeholder: "",
        ajax: {
            url: $(".select2-student-select").data('select2Url'),
            data: function (params) {
                var query = {
                    search: params.term || '',
                    page: params.page || 1,
                    type: 'public'
                };
                return query;
            }
        }
    });
}

function init_home_work_group_select() {
    $('.select2-home-work-group-select').select2({
        width: "100%",
        theme: "bootstrap",
        language: "ru",
        placeholder: "",
        ajax: {
            url: $(".select2-home-work-group-select").data('select2Url'),
            data: function (params) {
                var query = {
                    search: params.term || '',
                    page: params.page || 1,
                    type: 'public'
                };
                return query;
            }
        }
    });
}


function init_answer_checkboxes() {
    $(document).on('change', '.is-correct-flag', function () {
        checked = $(this).prop('checked');
        if (checked) {
            $(this).closest('.questions').find('.is-correct-flag').not(this).prop('checked', false);
        }
        console.log('change', checked);
    })
}

function init_datetimePickers() {
    $('.datetimepicker').map(function () {
        $(this).attr('data-toggle', 'datetimepicker');
        $(this).attr('data-target', "#" + $(this).attr('id'));
        let format = $(this).data('format');

        if (!format) {
            format = 'L';
        }

        var date = moment($(this).val(), format).toDate();

        $(this).datetimepicker({
            locale: 'ru',
            format: format,
            date: date
        });
    })
}
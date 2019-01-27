
$(document).ready(function () {
    console.log('qwe');
    init_student_select();
    init_answer_checkboxes();
});


function init_student_select() {
    console.log('ok');
    $('.select2-student-select').select2({
        width: "100%",
        theme: "bootstrap",
        language: "ru",
        placeholder: "",
        allowClear: true,
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

function init_answer_checkboxes() {
    $(document).on('change', '.is-correct-flag', function () {
        checked = $(this).prop('checked');
        if (checked) {
            $(this).closest('.questions').find('.is-correct-flag').not(this).prop('checked', false);
        }
        console.log('change', checked);
    })
}

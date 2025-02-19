var $ele_event_id = $("#event_id");

function getEventDetails(){

    $.get(
        {
            url: '/volunteer/eventDetailsAjaxServlet',
            data:{ event_id:  $ele_event_id.val()},
            success: function (result) {

                if(result.isValid) {
                    console.log("Result", result);
                    $(".event_name").html(result.mEvent.event_name);
                    $(".event_fees").html(result.mEvent.event_fee);
                    $(".total_fees").html("Rs. " + result.mEvent.event_fee );

                }else {
                    alert("Error Fetching details");
                }

            }

        }
    );
}

$ele_event_id.change(function () {
    getEventDetails();
});

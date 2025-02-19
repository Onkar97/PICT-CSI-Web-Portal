<%--
  Created by IntelliJ IDEA.
  User: negativezero
  Date: 17/10/18
  Time: 11:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!------ Include the above in your HEAD tag ---------->


<html>
<head>

    <jsp:include page="headerv4.jsp"/>
    <link rel="stylesheet" href="css/chats.css">
</head>
<body>
<div class="container">
    <h3 class=" text-center">Messaging</h3>
    <div class="messaging">
        <div class="inbox_msg">
            <div class="inbox_people">
                <div class="headind_srch">
                    <div class="recent_heading">
                        <h4>Recent</h4>
                    </div>
                    <div class="srch_bar">
                        <div class="stylish-input-group">
                            <input type="text" class="search-bar"  placeholder="Search" >
                            <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span> </div>
                    </div>
                </div>
                <div class="inbox_chat">
                    <div class="chat_list active_chat">
                        <div class="chat_people">
                            <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                            <div class="chat_ib">
                                <h5>Global Chat <span class="chat_date"></span></h5>
                                <p></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mesgs">
                <div class="msg_history" id="chatContainer">

                </div>
                <div class="row">
                    <input type="checkbox" value="Bold" id="h1_checkbox">
                    <label for="h1_checkbox">Large Text</label>

                    <input type="checkbox" value="Bold" id="h2_checkbox">
                    <label for="h2_checkbox">H4</label>

                    <input type="checkbox" value="Bold" id="bold_checkbox">
                    <label for="bold_checkbox">Bold</label>

                    <input type="checkbox" value="Bold" id="italic_checkbox">
                    <label for="italic_checkbox">Italic</label>


                </div>
                <form onsubmit="return sendChat(this)">

                    <div class="type_msg">
                        <div class="input_msg_write">
                            <input type="text" id="inputMessage" class="write_msg" placeholder="Type a message" />
                            <button class="msg_send_btn" id="send_button" type="submit"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <p class="text-center top_spac"> Design by <a target="_blank" href="#">PICT CSI</a></p>

    </div>
</div>
</body>

<script type="text/javascript">

    var incomingMessage = '<div class="incoming_msg">' +
        '                        <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>' +
        '                        <div class="received_msg">' +
        '                            <div class="received_withd_msg">' +
        '                                <p class="message"></p>' +
        '                                <span class="time_date user_name"></span></div>' +
        '                        </div>' +
        '                    </div>';

    var outgoingMessage = '<div class="outgoing_msg">' +
        '                        <div class="sent_msg">' +
        '                            <p class="message"></p>' +
        '                            <span class="time_date user_name"></span> </div>' +
        '                    </div>';



    var user_id = <%=request.getSession().getAttribute("user_id")%>;

    var chatContainer = $("#chatContainer");

    var lastMessage = -1;

    function getAllChats(){
        $.ajax({
                url: "getAllChats",
                data: {"lastMessage":  lastMessage},

                method: 'get',

                success: function (data) {


                    // console.log(data);
                    var $message;
                    if(data.chats !== undefined && data.chats.length > 0 &&  data.chats[data.chats.length - 1].id > lastMessage){


                        data.chats.forEach(function (val, index) {
                            // console.log(index, val);
                            console.log(val.user_id, user_id);
                            if(val.user_id === user_id){
                                $message = $(outgoingMessage);
                            }else {
                                $message = $(incomingMessage);
                            }

                            $message.find(".message").html(val.chat_message);
                            $message.find(".user_name").html((val.user_name !== undefined ? val.user_name + " | " + val.email_id : val.email_id));
                            chatContainer.append($message);

                        });

                        lastMessage = data.chats[data.chats.length - 1].id;

                        gotoBottom("chatContainer");
                    }
                },


                error: function () {
                    alert("Unknown Error Occurred");
                }
            }
        )

    }

    function addHtmlTags(){
        var message = $("#inputMessage").val();
        // console.log($("#h1_checkbox").is(":checked"));
        if($("#h1_checkbox").is(":checked")){
            message = "<h1>" + message + "</h1>"
        }

        if($("#h2_checkbox").is(":checked")){
            message = "<h4>" + message + "</h4>"
        }
        if($("#bold_checkbox").is(":checked")){
            message = "<b>" + message + "</b>"
        }
        if($("#italic_checkbox").is(":checked")){
            message = "<i>" + message + "</i>"
        }

        // console.log("Here", message);

        return message;


    }


    function sendChat(element) {
        var msg = $("#inputMessage").val();
        if(msg === null || msg === "" || msg === " "){
            return false;
        }
        $.post({
                url: "addChat",
                data: {"chat_message": addHtmlTags()},
                success: function (data) {
                    console.log(data);
                    if (!data.isSuccess) {
                        alert(data.message);
                    }
                    $("#inputMessage").val("");
                    // setTimeout(getAllChats, 500);
                    getAllChats();
                },
                error: function () {
                    alert("Unknown Error Occurred");
                }
            }
        );
        return false;
    }
    function gotoBottom(id){
        var element = document.getElementById(id);
        element.scrollTop = element.scrollHeight - element.clientHeight;
    }
    $(function () {
        getAllChats();

        setInterval(getAllChats, 1000);


    });

</script>
</html>
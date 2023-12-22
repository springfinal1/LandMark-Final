function printAttendanceContent()
{
    $.ajax({
        method: "POST",
        url: "/event/getAttendanceCnt",
        data: { evNo: evNo, id: uid},
        success: function (res){
            console.log(res);
            for(let i=1;i<=res;i++){
                let id='attendence-content'+i;
                let attendenceContent=document.getElementById(id);
                console.log(attendenceContent);
                attendenceContent.src="/resources/image/event-image/at.jpg";
                
            }
        }
    })
}
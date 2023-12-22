document.addEventListener("DOMContentLoaded", function () {
    var orderNum = document.querySelector('.payMentOk').getAttribute('order-num');

    // 페이지 로드 시 주문 상태 확인 및 버튼 숨김 처리
    checkAndHideButtons(orderNum);

    // 확인 버튼 클릭 이벤트
    var confirmButton = document.getElementById("confirmButton");
    if (confirmButton) {
        confirmButton.addEventListener("click", function () {
            sendConfirmationRequest(orderNum);
        });
    }

    // 취소 버튼 클릭 이벤트
    const payMentCancelButtons = document.querySelectorAll('.payMentCancel');
    payMentCancelButtons.forEach(function (button) {
        button.addEventListener("click", function () {
            handleCancelOrder(orderNum);
        });
    });

    // 추가로 필요한 로직이 있다면 여기에 추가

    function checkAndHideButtons(orderNum) {
        var xhr = new XMLHttpRequest();
        var statusUrl = "/peyment/status?orderNum=" + orderNum;
        xhr.open('GET', statusUrl, true);

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response;
                try {
                    response = JSON.parse(xhr.responseText);
                } catch (e) {
                    response = { status: xhr.responseText };
                }
                var orderStatus = response.status;

                // 여기에서 버튼 상태를 설정하거나 필요한 작업을 수행합니다.
                // 예: 주문 상태에 따라 버튼을 보이게/숨기게 하거나 다른 조작 수행
                var confirmButton = document.getElementById("confirmButton");
                var cancelButton = document.getElementById("cancelButton");

                if (orderStatus === "Y" && confirmButton) {
                    confirmButton.style.display = "none";
                }
                if (orderStatus === "Y" && cancelButton) {
                    cancelButton.style.display = "none";
                }
            }
        };

        xhr.send();
    }

    function sendConfirmationRequest(orderNum) {
        var xhr = new XMLHttpRequest();
        var url = "/peyment/confirmation";
        xhr.open('POST', url, true);
        xhr.setRequestHeader('Content-Type', 'application/json');

        var data = {
            orderNum: orderNum
        };

        xhr.send(JSON.stringify(data));

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    // 확인 버튼 클릭 후의 로직
                    // ...
                    // 주문 상태 갱신
                    checkAndHideButtons(orderNum);
                } else {
                    console.error("서버 응답 오류:", xhr.status);
                }
            }
        };
    }

    function handleCancelOrder(orderNum) {
        const userConfirmed = confirm("주문을 취소하시겠습니까?\n취소하면 되돌릴 수 없습니다.!");

        if (userConfirmed) {
            alert("주문을 취소하였습니다!");
            const xhttp = new XMLHttpRequest();

            xhttp.open("POST", "/peyment/orderCancle");

            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            xhttp.send("orderNum=" + orderNum);

            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    let result1 = xhttp.responseText.trim();
                    console.log(result1);

                    if (result1 == 1) {
                        location.replace('/peyment/OrderList?pageNo=1');
                    } else {
                        location.replace('/peyment/OrderList?pageNo=1');
                    }
                }
            }
        } else {
            alert("보류하였습니다!");
        }
    }

    function cancelPay() {
        const xhttp = new XMLHttpRequest;

        xhttp.open("POST", "../admin/orderCancle")

        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhttp.send("orderNum=" + orderNum);

        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                let result1 = xhttp.responseText.trim();
                console.log(result1);
                if (result1 == 1) {
                    console.log("삭제성공")
                } else {
                    console.log("삭제실패");
                }
            }
        }
    }
});

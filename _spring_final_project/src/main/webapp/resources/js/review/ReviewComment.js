console.log('js 연결됨');

//댓글 추가
let cmtPostBtn=document.getElementById('cmtPostBtn');

async function postCommentToServer(cmtData)
{
    try {
        const url='/reviewcmt/post';
        const config={
            method:'post',
            headers:{
                'content-type':'application/json; charset=utf-8'
            },
            body:JSON.stringify(cmtData)
        };
        const resp=await fetch(url,config);
        const result=await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

cmtPostBtn.addEventListener('click', (e)=>{
    let cmtTextVal=document.getElementById('cmtText').value;
    let cmtWriterVal=document.getElementById('cmtWriter').innerText;

    let cmtData={
        rvNo:rnoVal,
        rcContent:cmtTextVal,
        rcWriter:cmtWriterVal
    };
    cmtTextVal.innerText='';
    postCommentToServer(cmtData).then(result=>{
        if(result==1){
            alert('댓글 등록 성공');
            getCommentList(rnoVal);
            spreadCommentCount(rnoVal);
        }
    })
})

// 댓글 리스트 뿌려주는 영역

async function spreadCommentListFromServer(rvNo)
{
    try {
        const resp=await fetch('/reviewcmt/'+rvNo);
        const result=await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}
function getCommentList(rvNo)
{
    spreadCommentListFromServer(rvNo).then(result=>{
        console.log(result);
        let ReviewCmtArea=document.getElementById('ReviewCmtArea');
        ReviewCmtArea.innerHTML='';
        if(result.length>0)
        {
            for(let i=0;i<result.length;i++)
            {
                let str=`<div class="cmt-list-div">`;

                str+=`<div class="cmt-header">`;
                str+=`<div class="cmt-id-div">${result[i].rcWriter} </div>`;
                str+=`<div class="cmt-reg-div">`;
                str+=`${result[i].rcRegAt}`;
                str+=`<button type="button" class="showmod" onclick="showModifyDiv(${i})"><i class="fa-solid fa-trash"></i>수정</button>`;
                str+=`<button type="button" class="cmtDelBtn" data-rcno="${result[i].rcNo}"><i class="fa-solid fa-pencil"></i>삭제</button>`;
                str+=`</div>`; //<div class="cmt-reg-div">닫기
                str+=`</div>`; //<div class="cmt-header">닫기

                str+=`<div class="cmt-content">`;
                str+=`${result[i].rcContent}`;
                str+=`</div>` //<div class="cmt-content">닫기

                str+=`</div>`;  //<div class="cmt-list-div">닫기

                str+=`<div class="cmt-modify" id="cmtmod${i}">`; //수정 div

                str+=`<div class="cmt-modify-writer">`;
                str+=`<input type="text" readonly="readonly" value="${result[i].rcWriter}">`
                str+=`</div>`;

                str+=`<div class="cmt-modify-content">`;
                str+=`<textarea id="cmtModText" onkeyup="autoResize(this)" onkeydown="autoResize(this)">${result[i].rcContent}</textarea>`
                str+=`<button type="button" class="cmtModBtn" data-rcno="${result[i].rcNo}">수정</button>`;
                str+=`</div>`;  //<div class="cmt-modify-content">

                str+=`</div>`;//<div class="cmt-modify">닫기

                ReviewCmtArea.innerHTML+=str;
            }
        }
        else
        {
            let str=`<ul><li>Comment List Empty</li></ul>`;
            ReviewCmtArea.innerHTML=str;
        }
    })
}

async function DeleteComment(rcNo)
{
    try {
        const url="/reviewcmt/"+rcNo;
        const config={
            method:'delete'
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function ModifyComment(cmtData)
{
    try {
        const url="/reviewcmt/"+cmtData.rcNo;
        const config={
            method:'put',
            headers:{
                'content-type':'application/json; charset=utf-8'
            },
            body:JSON.stringify(cmtData)
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.addEventListener('click',(e)=>{
    console.log(e.target);
    if(e.target.classList.contains('cmtDelBtn'))
    {
        let li=e.target.closest('button');
        console.log(li);
        let rcno=li.dataset.rcno;
        console.log(rcno);
        DeleteComment(rcno).then(result=>{
            if(result==1){
                alert('삭제성공');
                getCommentList(rnoVal);
            }
                
        })
    }
    else if(e.target.classList.contains('cmtModBtn'))
    {
        let div=e.target.closest('div')

        let cmtModNo=div.lastChild.dataset.rcno;
        let cmtModText=div.firstChild.value;

        console.log(cmtModText);

        let cmtData={
            rcNo:cmtModNo,
            rcContent:cmtModText
        };
        
        ModifyComment(cmtData).then(result=>{
            if(result==1){
                alert('수정 성공');
                getCommentList(rnoVal);
            }
        })

    }
})

async function getCommentCount(rvNo)
{
    console.log('getCommentCount');
    try {
        const url='/reviewcmt/cnt/'+rvNo;
        const config={
            method:'get'
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

function spreadCommentCount(rvNo)
{
    console.log("spreadCommentCount");
    getCommentCount(rvNo).then(result=>{
        if(result!=-1){
            let cmtCountA=document.getElementById('cmtCount');
            cmtCountA.innerHTML=`댓글수:`;
            cmtCountA.innerHTML+=`${result}`;
        }
    })

}

async function showModifyDiv(idx)
{
    let showmod=document.getElementById(`cmtmod${idx}`);
    
    console.log("스타일:"+showmod.style.display);
    if(showmod.style.display=="none"){
        showmod.style.display="block";
    }
    else{
        showmod.style.display="none";
    }
}
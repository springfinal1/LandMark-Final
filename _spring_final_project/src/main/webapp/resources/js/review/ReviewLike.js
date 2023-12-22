console.log('review like js 연결');

let likeBtn=document.getElementById('like');

likeBtn.addEventListener('click',(e)=>{
    let cmtData={
        rvNo:rnoVal,
        userNo:idVal
    };
    UserLikeHistoryDistinction(cmtData).then(result=>{
        if(result==1){
            likeBtn.style.backgroundColor='red';
            spreadLikeCount(cmtData.rvNo);
            alert('좋아요 누름!');
        }
        else if(result==2){
            likeBtn.style.backgroundColor='';
            spreadLikeCount(cmtData.rvNo);
            alert('좋아요 취소');
        }
        else
            alert('error!');
    })
})

async function UserLikeHistoryDistinction(cmtData)
{
    try {
        const url='/review/'+cmtData.rvNo;
        const config={
            method:'post',
            headers:{
                'content-type':'application/json; charset=utf-8'
            },
            body:JSON.stringify(cmtData)
        }
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}
async function getUserLikeDisplay(cmtData)
{
    try {
        const url='/review/'+cmtData.rvNo;
        const config={
            method:'put',
            headers:{
                'content-type':'application/json; charset=utf-8'
            },
            body:JSON.stringify(cmtData)
        }
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function UserLikeDisplay()
{
    let cmtData={
        rvNo:rnoVal,
        userNo:idVal
    };
    getUserLikeDisplay(cmtData).then(result=>{
        if(result==1)
            likeBtn.style.backgroundColor='red';
        else
            likeBtn.style.backgroundColor='';
    })
}

async function getLikeCount(rvNo)
{
    console.log('getLikeCount')
    try {
        const url='/review/cnt/'+rvNo;
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

function spreadLikeCount(rvNo)
{
    getLikeCount(rvNo).then(result=>{
        console.log("좋아요수:"+result);
        if(result!=-1){
            let likespan=document.getElementById('likeSpan');
            likespan.innerHTML=`${result}`;
            let headLikeSpan=document.getElementById('headLikeSpan');
            headLikeSpan.innerHTML+=`<span style="color: red" >${result}</span>`;
        }
    })

}
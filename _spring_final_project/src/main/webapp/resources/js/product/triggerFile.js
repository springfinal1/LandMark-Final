/**
 * 
 */
 
document.getElementById('trigger').addEventListener('click',()=>{
    document.getElementById('files').click();
}) 
 

// 실행파일 막기
const regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$");
const regExpImg = new RegExp("\.(jpg|jpeg|png|gif)$");
const maxSize = 1024 * 1024 * 20;

function fileValidation(fileName, fileSize){
    if(!regExpImg.test(fileName)){
        return 0;
    }else if(regExp.test(fileName)){
        return 0;
    }else if(fileSize > maxSize){
        return 0;
    }else{
        return 1;
    }
}

document.addEventListener('change',(e)=>{
    if(e.target.id=="files"){
        document.getElementById('regBtn').disabled = false;
        const fileObject = document.getElementById('files').files;
        

        let div = document.getElementById('imgZone');

        div.innerHTML="";
        let isOk = 1;
        let ul = `<div>`;
        for(let file of fileObject){
            let vaildResult = fileValidation(file.name, file.size);
            isOk *= vaildResult;
            ul += `<div>${vaildResult ? '업로드가능' : '업로드 불가능'}</div>`;
            ul += `<div>파일명 : ${file.name}</div>`;
            ul += `<div>사이즈 : ${file.size}</div>`;
            console.log(file);
        }
        ul += `</div>`;
        div.innerHTML += ul;
        if(isOk == 0){
            document.getElementById('regBtn').disabled = true;
        }
    }
})




// a태그 링크
let loginLink = document.getElementById('loginLink');

// naver 로고
let naverLogin = document.getElementById('naverLogin');
// kakao 로고
let kakaoLogin = document.getElementById('kakaoLogin');
// google 로고
let googleLogin = document.getElementById('googleLogin');

// 로그인 요청 정보
let loginUrl = '';
let clientId = '';
let clientSecret = '';
let state = '';
let redirectUrl = '';

// 네이버 로그인 이벤트
// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=GNk4hFIqHpvlhA2t5zpx&state=STATE_STRING&redirect_uri=http://localhost:8088/login/oauth2/code/naver
naverLogin.addEventListener('click', ()=>{
    getUrl("naverLogin");
});

// 카카오 로그인 이벤트
// https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}
kakaoLogin.addEventListener('click', ()=>{
    getUrl("kakaoLogin");
});

// 구글 로그인 이벤트
//https://accounts.google.com/o/oauth2/v2/auth?response_type=code&client_id={client_id}&redirect_uri={redirect_url}&scope={ scope범위 ex)profile }
googleLogin.addEventListener('click', ()=>{
    getUrl("googleLogin");
});

// 서버에 url 생성 정보 요청
async function urlFromServer(sns){
    try {
        let resp = await fetch('/login/oauth2/'+sns);
        let result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

// oauth 로그인 요청 url 생성 함수
function getUrl(sns){
    if(sns == 'naverLogin'){
        // https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=GNk4hFIqHpvlhA2t5zpx&state=STATE_STRING&redirect_uri=http://localhost:8088/login/oauth2/code/naver
        urlFromServer('naverLogin').then(result =>{
            clientId = result.client_id;
            redirectUrl = result.redirect_url;
            state = result.state;
            loginUrl = result.login_url;
            let url = `${loginUrl}?response_type=code&client_id=${clientId}&state=${state}&redirect_uri=${redirectUrl}`;
            loginLink.href = url; // a 태그에 href 주소 설정
            loginLink.click(); // a 태그 클릭
        })
    }else if(sns == 'kakaoLogin'){
        // https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}
        urlFromServer('kakaoLogin').then(result =>{
            clientId = result.client_id;
            redirectUrl = result.redirect_url;
            state = result.state;
            loginUrl = result.login_url;
            let url = `${loginUrl}?response_type=code&client_id=${clientId}&state=${state}&redirect_uri=${redirectUrl}`;
            loginLink.href = url; // a 태그에 href 주소 설정
            loginLink.click(); // a 태그 클릭
        })
    }else if(sns == 'googleLogin'){
        // https://accounts.google.com/o/oauth2/v2/auth?response_type=code&client_id=876871450477-omgqacib15a7qj7fo8n9ul1cgvs4aeq9.apps.googleusercontent.com&redirect_uri=http://localhost:8088/login/oauth2/code/google&scope=profile
        urlFromServer('googleLogin').then(result =>{
            clientId = result.client_id;
            redirectUrl = result.redirect_url;
            state = result.state;
            loginUrl = result.login_url;
            let url = `${loginUrl}?response_type=code&client_id=${clientId}&state=${state}&redirect_uri=${redirectUrl}&scope=profile email&access_type=offline`;
            loginLink.href = url; // a 태그에 href 주소 설정
            loginLink.click(); // a 태그 클릭
        })
    }


}
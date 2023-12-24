
console.log('js in');

let reservationBtn = document.querySelectorAll('.reservation-btn');
let arrChoice = document.querySelectorAll('.arr-choice');
let depInfo = document.querySelector('.dep-info');
let arrInfo = document.querySelector('.arr-info');

let startAirport = document.querySelector('.startAirport');

let depName = document.querySelector('.depName');
let depTime = document.querySelector('.depTime');
let depAir = document.querySelector('.depAir');

let arrName = document.querySelector('.arrName') ;
let arrTime = document.querySelector('.arrTime');
let arrAir = document.querySelector('.arrAir');

let reserH1 = document.querySelector('.reser-h1');


let airlineArr = document.getElementById('airlineArr');
let flightIdArr = document.getElementById('flightIdArr');

let airlineDep = document.getElementById('airlineDep');
let flightIdDep = document.getElementById('flightIdDep');




let departureDay = document.getElementById("departureDay");
let arrivalDay = document.getElementById("arrivalDay");

let gateNumber = document.getElementById('gateNumber');

reservationBtn.forEach(e=>{
    let depAirLine = document.querySelector(".depAirLine").innerHTML;
    let depFlight = document.querySelector(".depFlight").innerHTML;
    let depDate = document.querySelector('.dep-Day').value;
    e.addEventListener('click',()=>{
        reserH1.innerHTML=""
        depName.innerHTML = e.closest('div').dataset.airline;
        depTime.innerHTML = `${e.closest('div').dataset.schedule.substring(8,10)}`+" : "+`${e.closest('div').dataset.schedule.substring(10,12)}`;
        depAir.innerHTML =  `${startAirport.innerHTML} <i class="fa-solid fa-right-long"></i> `+ e.closest('div').dataset.airport;
        airlineDep.value = depAirLine;
        flightIdDep.value = depFlight;
        departureDay.value = depDate;
      
    })
})
arrChoice.forEach(e=>{
    let arrAirLine = document.querySelector(".arrAirLine").innerHTML;
    let arrFlight = document.querySelector('.arrFlight').innerHTML;
    let arrDate = document.querySelector('.arr-Day').value;
    let arrGate = document.getElementById('arrGate');
    e.addEventListener('click',()=>{
        reserH1.innerHTML=""
        arrName.innerHTML = e.closest('div').dataset.airline;
        arrTime.innerHTML = `${e.closest('div').dataset.schedule.substring(8,10)}`+" : "+`${e.closest('div').dataset.schedule.substring(10,12)}`;
        arrAir.innerHTML =  e.closest('div').dataset.airport+" "+` <i class="fa-solid fa-right-long"></i> ${startAirport.innerHTML}`;
        gateNumber.value = arrGate.value;
        airlineArr.value = arrAirLine;
        flightIdArr.value = arrFlight;
        arrivalDay.value = arrDate;
    })
})


let adult = document.querySelector('.adult').innerHTML;
let child = document.querySelector('.child').innerHTML;
let infant = document.querySelector('.infant').innerHTML;
let seat = document.querySelector('.seat').innerHTML;


let pepCnt = document.querySelector('.pep-cnt');



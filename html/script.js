console.log('JS Cargado')
var showing = false;
var cola = [];
var mapa = false;
window.addEventListener('message', function(event){
    mapa = event.data.mapaopen
    if (event.data.entornoZona == 'undefined' |! event.data.entornoZona){
        if (event.data.show){
            MostrarNoti(event.data);
        }
    }
    if (!mapa){
        document.getElementById('#todo').style.bottom = '1px'
        document.getElementById('#todo').style.left = '200px'
    }else{

        document.getElementById('#todo').style.bottom = '20%'
        document.getElementById('#todo').style.left = '33px'
    }

    if (event.data.delete){
        $('#todo').hide()
    }
})

function MostrarNoti(data){
    let id = data.id.toString()
    let id2 = data.id2.toString()
    $('#todo').append(`
    <div id = ${id} style="
        width: 250px;
        background-color:rgba(0, 0, 0, 0.795);
        border: 1px solid rgba(0, 0, 0, 0.596);
        padding: 5px;
        text-align: center;
        border-radius: 5px;
        box-shadow: 8px 8px 8px -5px rgba(0, 0, 0, 0.815);
        max-width: 250px;
        margin-bottom: 7px;
        position:relative;"
        >
        <span id = 'text' class = 'texto'>${data.message}</span>
        <div id = ${id2} class = 'barrita'></div>
    </div>`);
    $('#' + id2).hide()
    document.getElementById(id2).style.animation = '';
    document.getElementById(id).style.display = 'block';
    document.getElementById(id).style.border = '1px solid ' + data.color;
    document.getElementById(id).classList.add('darvueltasPrimero')
    setTimeout(function(){
        $('#' + id2).show(500)
    }, 900);
    setTimeout(function(){
        document.getElementById(id2).style.animation = 'barra ' + (data.timeout - 1500) + 'ms ease-in-out';
    }, 1500);
    setTimeout(function(){
        $('#' + id2).hide(500)
    }, data.timeout-50)
    setTimeout(function() {
        document.getElementById(id).classList.remove('darvueltasPrimero')
        document.getElementById(id).classList.add('darvueltasSegundo')
    }, data.timeout+500);
    setTimeout(function(){
        document.getElementById(id).style.display = 'none' 
        document.getElementById(id).classList.remove('darvueltasSegundo')
    }, data.timeout+1400)
}

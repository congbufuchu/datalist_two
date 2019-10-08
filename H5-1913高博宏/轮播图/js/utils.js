function move(ele , target,callbcak){
    const obj = {}
    for(let attr in target){
        obj[attr] = setInterval(() =>{
            let curAttr
            if(attr === 'opacity'){
                curAttr = parseFloat(getStyle(ele,attr)*100)
            }else{
                curAttr = parseFloat(getStyle(ele,attr))
            }
            let speed = (target[attr] - curAttr)/5
            speed = speed > 0 ? Math.ceil(speed) :Math.floor(speed)

            if(target[attr] === curAttr){
                clearInterval(obj[attr])
                delete obj[attr]
                if(getTimerLength(obj) === 0){
                    callbcak && callbcak()
                }
            }else{
                if(attr === 'opacity'){
                    ele.style[attr] = (curAttr + speed)/100 
                }else{
                    ele.style[attr] = curAttr +speed + 'px'
                }
            }
        },30)
    }
    
}
function getStyle(ele, attr){
    if(window.getComputedStyle){
      return window.getComputedStyle(ele)[attr]
    }else{
      return ele.currentStyle[attr]
    }
}

function getTimerLength(obj){
    let n = 0
    for (let attr in obj){
        n++
    }
    return n
}
class Enlarge{
    constructor(ele){
        this.ele = ele
        this.show = this.ele.querySelector('.show')
        this.zhe = this.ele.querySelector('.zhe')
        this.enlarge = this.ele.querySelector('.enlarge')
        this.init()
    }
    init(){
        this.mouse()
        this.hua()
        this.move()
    }
    mouse(){
        this.show.addEventListener('mouseover',() => this.zhe.style.display=this.enlarge.style.display='block')
        this.show.addEventListener('mouseout' , ()=>this.zhe.style.display = this.enlarge.style.display = 'none')
    }
    hua(){
        const zheX = parseInt(getStyle(this.zhe,'width'))
        const zheY = parseInt(getStyle(this.zhe,'height'))

        const showX = this.show.clicentWidth
        const showY = this.show.clicentHeight

        const bgX = parseInt(getStyle(this.enlarge
            ,'background-size').split(' '[0]))
        const bgY = parseInt(getStyle(this.enlarge,'background-size').split(' ')[1])

        const enlargeX = zheX * bgX / showX
        const enlargeY = zheY * bgY / showY
        this.enlarge.style.width = enlargeX +'px'
        this.enlarge.style.height = enlargeY +'px'
    }
    move(){
        this.show.addEventListener('mousemove' ,e=>{
            e = e || window.event
            let x = e.pageX - this.ele.offsetLeft -100
            let y = e.pageY - this.ele.offsetTop -100

            const showX = this.show.clientWidth
            const showY = this.show.clientHeight

            const zheX = this.zhe.clientWidth
            const zheY = this.zhe.clientHeight

            const enlargeX = this.enlarge.clientWidth
            const enlargeY = this.enlarge.clientHeight
            if (x <= 0){
                x = 0
            }
            if (y <= 0){
                y=0
            }
            if (x + zheX >= showX) {
                x = showX - zheX
            }
        
            if (y + zheY >= showY) {
                y = showY - zheY
            }

            this.zhe.style.left = x + 'px'
            this.zhe.style.top = y + 'px'

            const bgX = x * enlargeX / zheX
            const bgY = y * enlargeY / zheY

            this.enlarge.style.backgroundPosition = `-${bgX}px -${bgY}px`
        })
    }
}

function getStyle (ele, attr){
    if (window.getComputedStyle){
        return window.getComputedStyle(ele)[attr]
    }else{
        return ele.currentStyle[attr]
    }
}
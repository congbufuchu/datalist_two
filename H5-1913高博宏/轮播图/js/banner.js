class Banner{
    constructor(className){
        this.ele = document.querySelector(className)

        this.imgbox = this.ele.querySelector('.imgbox')
        this.fousebox = this.ele.querySelector('.fousebox')
        this.cilckbox = this.ele.querySelector('.clickbox')

        this.boxWidth = this.ele.clientWidth
        this.index=1
        this.timer=null
        this.loopFlag = true;
        this.init()
    }
    init(){
        this.fouse()//焦点位置
        this.autoloop()//自动播放
        this.mouse()//鼠标移入移出
        this.cilckboxEvent()//左右焦点事件
        this.fouseboxEvent()//小圆点焦点事件
        this.copyh()//填充
    }
    copyh(){
        const first = this.imgbox.children[0].cloneNode(true)
        const last = this.imgbox.children[this.imgbox.children.length - 1].cloneNode(true)

        this.imgbox.appendChild(first)
        this.imgbox.insertBefore(last,this.imgbox.children[0])

        this.imgbox.style.width = this.imgbox.children.length * this.boxWidth + 'px'
        this.imgbox.style.left = -this.index *this.boxWidth + 'px'
    }
    fouse(){
        const num = this.imgbox.children.length

        for(let i = 0;i<num;i++){
            const li = document.createElement('li')

            if(i === 0){
                li.className = "active"
            }
            li.setAttribute('index' ,i +1)
            this.fousebox.appendChild(li)
        }
        this.fousebox.style.width = num * 40 +'px'
    }
    autoloop(){
        this.timer = setInterval(() =>{
            this.index++
            move(this.imgbox,{left:-this.index *this.boxWidth},this.moveEnd.bind(this))
        },1000)
    }
    moveEnd(){
        if(this.index === this.imgbox.children.length - 1){
            this.index = 1
            this.imgbox.style.left = -this.index *this.boxWidth + 'px'
        }

        if(this.index === 0){
            this.index = this.imgbox.children.length - 2
            this.imgbox.style.left = -this.index * this.boxWidth + 'px'
        }

        for(let i = 0;i<this.fousebox.children.length;i++){
                this.fousebox.children[i].className = ''
        }
        this.fousebox.children[this.index - 1].className = 'active'
        this.loopFlag = true
    }
    mouse(){
        this.ele.addEventListener('mouseover',() =>clearInterval(this.timer))
        this.ele.addEventListener('mouseout',() =>this.autoloop())
    }
    cilckboxEvent(){
        this.cilckbox.addEventListener('click' , e =>{
            e = e || window.event
            if(this.loopFlag === false){
                return
            }
            this.loopFlag = false

            if(e.target.className === 'left'){
                this.index--;
                move(this.imgbox,{left:-this.index *this.boxWidth},this.moveEnd.bind(this))
            }
            if (e.target.className === 'right') {
                this.index++
                move(this.imgbox, {left:-this.index *this.boxWidth},this.moveEnd.bind(this))
              }
        })
    }
    fouseboxEvent(){
        const _this = this
        for(let i = 0;i<this.fousebox.children.length;i++){
            this.fousebox.children[i].addEventListener('cilck',function(){
                const index = this.getAttribute('index') - 0

                if(_this.loopFlag = false){
                    return
                }
                _this.loopFlag = false

                _this.index = index
                move(_this.imgbox,{left: -_this.index * _this.boxWidth }, _this.moveEnd.bind(_this))
            })
        }
    }
}
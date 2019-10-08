const Utils = (function(){
    class Abc {
        constructor(){
            this.Flag = addEventListener
        }
        setCss(ele ,options){
            for(let attr in options){
                ele.style[attr] = options[attr]
            }
        }
    }

    let instance

    return function(){
        if(!instance){
            instance = new Abc()
        }
        return instance
    }
})()
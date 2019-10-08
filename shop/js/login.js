// 1. 获取 form 标签
const form = document.querySelector('form')

// 2. 获取input
const inps = document.querySelectorAll('input')

/**
 * @api {get} /admin/uesr/login  用户登录
 * @apiName login
 * @apiGroup User
 *
 * @apiParam {int} id 用户账号ID
 * @apiParam {varchar} username 用户账号
 * @apiParam {varchar} password 用户密码
 * @apiParam {int} goodsid 商品ID
 * @apiParam {varchar} goodsname 商品名称
 * @apiParam {varchar} goodsimage 商品图片位置
 * @apiParam {tinyint} isSale 是否出售
 * @apiParam {tinyint} isRecom 是否包邮
 * @apiParam {int} goodsphone 商品电话
 * @apiParam {datetime} createTime 商品创建时间
 *
 * @apiSuccess {Number} err 状态码
 * @apiSuccess {String} msg  msg.
 * @apiSuccess {String} token  token
 */
form.addEventListener('submit', async e => {
    e = e || window.event
    e.preventDefault()

    const username = inps[0].value
    const password = inps[1].value

    const res = await pAjax({
        url: '../server/login.php',
        dataType: 'json',
        type: 'POST',
        data: {
            username,
            password
        }
    })

    if (res.code === 0) {
        alert('用户名或密码错误')
        return
    }

    // 登录成功
    // 设置 cookie 信息
    setCookie('login', 1)

    const reg = /pathname=(.+)/

    if (reg.test(window.location.search)) {
        const href = reg.exec(window.location.search)[1]
        window.location.href = href
    } else {
        window.location.href = './datalist.html'
    }

})
// 查看一下地址栏有没有带 id 信息过来

// 获取 container 容器
const box = document.querySelector('.container')

const reg = /id=(\d+)/

if (!reg.test(window.location.search)) {
  // 表示你没有携带 id 参数
  box.innerHTML = `
    <div class="jumbotron">
      <h1>您还没有选择商品</h1>
      <p>点击下面按钮返回列表页选择</p>
      <p><a class="btn btn-primary btn-lg" href="./list.html" role="button">去选购</a></p>
    </div>
  `
} else {
  // 使用 id 去获取商品信息
  const id = reg.exec(window.location.search)[1]

  // 获取回来以后使用响应渲染页面
  getDetail(id)
}

async function getDetail(id) {
  const res = await pAjax({
    url: '../server/getDetail.php',
    dataType: 'json',
    data: {
      id: id
    }
  })

  bindHtml(res.detail)
}

function bindHtml(data) {
  box.innerHTML = `
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">商品详细信息</h3>
      </div>
      <div class="panel-body">
        <div class="media">
          <div class="media-left">
            <a href="#">
              <img class="media-object" src="${data.goods_big_logo}" alt="...">
            </a>
          </div>
          <div class="media-body">
            <h4 class="media-heading">${data.goods_name}</h4>
            <p>
              <i class="glyphicon glyphicon-yen"></i>
              <span>${data.goods_price}</span>
            </p>
            <div class="btn-group" role="group" aria-label="...">
              <button type="button" class="btn btn-default">XL</button>
              <button type="button" class="btn btn-default">L</button>
              <button type="button" class="btn btn-default">M</button>
              <button type="button" class="btn btn-default">S</button>
              <button type="button" class="btn btn-default">XS</button>
            </div>
            <p>
              <a href="javascript:;" class="btn btn-warning btn-lg" role="button">立即购买</a>
              <a href="#" id="addCart" data-id="${data.goods_id}" class="btn btn-danger btn-lg" role="button">加入购物车</a>
            </p>
          </div>
        </div>
        <ul class="nav nav-tabs">
          <li role="presentation" class="active"><a href="#">商品详细信息</a></li>
          <li role="presentation"><a href="#">商品参数信息</a></li>
          <li role="presentation"><a href="#">相关商品</a></li>
        </ul>
        <div>
          ${data.goods_introduce}
        </div>
      </div>
    </div>
  `

  bindEvent()
}

function bindEvent() {
  const addCart = document.querySelector('#addCart')

  addCart.addEventListener('click', function () {
    // const id = this.getAttribute('data-id')

    // 验证登录
    const login = getCookie('login')

    if (!login) {
      // 如果你没有登录，那么跳转回登录页
      alert('您还没有登录，请先登录')

      // console.log(window.location.pathname + window.location.search)
      // console.log(window.location)

      window.location.href = './login.html?pathname=' + window.location
    } else {
      // 如果你登录了，那么加入购物车
      alert('我要添加到购物车里面了')
    }
  })
}

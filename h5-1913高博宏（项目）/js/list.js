// 1. 先请求第一页的数据

// 1-1. 准备一个页面数据的对象
const pageInfo = {
  pagenum: 1, //当前页数
  pagesize: 10, //请求数据量
  total: 10, //所有的数据
  totalpage: 10 //总共页数
}

// 1-2. 请求数据
getList()
async function getList() {
  const res = await pAjax({
    url: '../server/getList.php',
    dataType: 'json',
    data: {
      pagenum: pageInfo.pagenum,
      pagesize: pageInfo.pagesize
    }
  })

  pageInfo.total = res.total.count - 0
  pageInfo.totalpage = Math.ceil(pageInfo.total / pageInfo.pagesize)

  bindPagi()
  bindHtml(res.list)
}

// 获取分页器的盒子
const box = document.querySelector('.pagi')

function bindPagi() {
  new Pagination(box, {
    pageInfo: pageInfo,
    textInfo: {
      first: '首页',
      prev: '上一页',
      next: '下一页',
      last: '末页'
    },
    async change(n) {
      if (n === pageInfo.pagenum) return

      // pagenum = 2
      pageInfo.pagenum = n

      const res = await pAjax({
        url: '../server/getList.php',
        dataType: 'json',
        data: {
          pagenum: pageInfo.pagenum, // 2
          pagesize: pageInfo.pagesize
        }
      })

      pageInfo.total = res.total.count - 0
      pageInfo.totalpage = Math.ceil(pageInfo.total / pageInfo.pagesize)

      bindHtml(res.list) // 第二页的数据
    }
  })
}

// 获取列表盒子的元素
const listGroup = document.querySelector('.list_width')

function bindHtml(list) {
  console.log(list[0])
  let str = ''

  // 遍历 list
  list.forEach(item => {
    str += `
    <div class="mod_search_pro">
    <div pageType="simple_table_nonFashion" class="itemBox">
      <div class="proImg" id="searchProImg" style="height:200px">
        <a class="img" style="position: relative"target="_blank"
          href="./goodsdata.html?id=${item.goodsid}">
          <img src="${item.goodsimage}" />
        </a>
        <div class="sideUp styleBox" style="bottom: -30px;"></div>
      </div>
      <p class="proPrice">
        <em class="num" id="price0_990602">
          <b>¥</b>${item.marketPrice}
        </em>
        <span id="unit_price_990602" class="unit_price"></span>
      </p>
      <p class="proName clearfix">
        <a target="_blank" title="${item.goodsname}"
          onclick="log('ProductYhd','ListYhd','1','990602')">${item.goodsname}
        </a>
      </p>
      <div class="__item_bg_icon imp">
        <a href="#" class="item_bg_icon" target="_blank">每满68减30</a>
      </div>
      <div class="item_act clearfix" id="shopping_cart">
        <div class="shopping_num">
          <input value="1" id="buyNum_990602" onkeyup="var key=event.keyCode;checkBuyNum(this, key)"
            type="text">
          <span>
            <a class="add">加</a>
            <a class="dis_decrease" href="javascript:void(0);">减</a>
          </span>
        </div>
        <div class="shopping_act fl" id="shopping_act_990602" isnumBuy="0">
          <a class="buy_btn" id="buyButton_990602" href="javascript:void(0);">加入购物车</a>
        </div>
      </div>
      <p class="proPrice">
        <span class="comment">
          <a id="pdlinkcomment_990602" href="https://item.yhd.com/990602.html" target="_blank">
            <i class="iconSearch"></i>64万+</a>
        </span>
        <span class="positiveRatio" title="好评率99%"><i class="iconSearch"></i>99%</span>
      </p>
      <p class="searh_shop_storeName storeName limit_width">
        <span class="subscribe_self">自营</span>
        <a href="https://mall.yhd.com/index-1000092648.html" class="o_1" target="_blank"
          title="McVitie's麦维他自营旗舰店">
          <span class="shop_text">McVitie's麦维他自营旗舰店</span>
        </a>
      </p>
    </div>
  </div>
    `
  })

  // 丢到页面里面
  listGroup.innerHTML = str

  bindEvent(list)
}

function bindEvent(data) {
  const addCart = document.querySelector('#buyButton_990602')

  addCart.addEventListener('click', function () {

    const login = getCookie('login')

    if (!login) {
      alert('您还没有登录，请先登录')

      window.location.href = './login.html?pathname=' + window.location
    } else {

      const cartList = JSON.parse(localStorage.getItem('cartList')) || []

      if (!cartList.length) {

        data.cart_number = data.cart_number - 0 + 1
        cartList.push(data)
      } else {

        const isCart = cartList.some(item => {
          return item.goods_id === data.goods_id
        })

        if (!isCart) {
          data.cart_number = data.cart_number - 0 + 1
          cartList.push(data)
        } else {
          cartList.forEach(item => {
            if (item.goods_id === data.goods_id) {
              item.cart_number = item.cart_number - 0 + 1
            }
          })
        }
      }

      localStorage.setItem('cartList', JSON.stringify(cartList))
    }
  })
}
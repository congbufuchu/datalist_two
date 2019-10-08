// 查看一下地址栏有没有带 id 信息过来

// 获取 container 容器
const box = document.querySelector('.detail_wrap')

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
  <div class="fm_detail_one clearfix">
              <div class="l">
                <div class="mod_detail_preview clearfix" id="jsModDetailPreview">
                  <div class="proImg_border">
                    <div class="proImg">
                      <img id="J_prodImg" width="360" height="360" src="${data.goodsimage}" alt="${data.goodsname}">
                    </div>
                  </div>
                </div>
                <div class="product_rel clearfix">
                  <div class="prod_l">
                    <p class="product_id" id="pro_code"><span>商品编号</span>${data.shopids}&nbsp;${data.saleTime}</p>
                  </div>
                  <p class="collect">
                    <a rel="collect" href="javascript:void(0);" id="product-collect">
                      <span class="collect_icon">
                        <i class="iconfont heart">&#xe613;</i>
                        <i class="iconfont heart_active">&#xe611;</i>
                      </span>
                      <span class="collect_text">关注</span>
                    </a>
                  </p>
                </div>
              </div>
              <div class="main_content">
                <div class="detail_information" id="jsModInformation">
                  <div class="mod_detailInfo_proName" id="detail_sku_main">
                    <h1 class="mh" id="productMainName">${data.goodsname}</h1>
                  </div>
                  <p class="subhead">
                    <span class="sh">
                      正品行货 品质保证
                    </span>
                  </p>
                  <div class="mod_detailInfo_priceSales ">
                    <div class="price pb0" id="currentPriceArea">
                      <ul class="clearfix">
                        <li class="tag" id="price_lable">
                          价格
                        </li>
                        <li class="number inte_check">
                          <span id="current_price">${data.marketPrice}</span>
                        </li>
                        <li class="pricing" id="bookprice"></li>
                      </ul>
                    </div>
                    <ul class="Msgsales clearfix" id="msgsales">
                      <li id="skuGoodCommentRate">
                        <span class="hpl paise">
                          <a class="pl"">好评率<strong class=" rate">100%</strong>
                          </a>
                        </span>
                        <span class="pl paise_num">
                          <a class="pl">[访问<span class="yellow">${data.visitNum}</span>次数]</a>
                        </span>
                      </li>
                    </ul>
                  </div>
                  <div class="mod_detailInfo_promotion" id="detailPromotion"></div>
                  <div class="mod_cuputing clearfix" id="computingArea">
                    <div class="clearfix">
                      <div data-sel="num" class="computing_item" id="computing_item">
                        <div class="computing_num">
                          <input type="text" data-max="199" data-min="1" class="num" value="1" id="product_amount">
                        </div>
                        <div class="computing_act">
                          <input type="button" class="add">
                          <input type="button" class="no_reduce">
                        </div>
                      </div>
                      <div class="cartbox" id="BtnArea">
                        <a href="javascript:void(0);" class="buy_btn6 btn_init_class" id="addCart"
                          btn_init_flag="1"><span>加入购物车</span></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="fm_detail_two laymt clearfix">
              <div class="grid_18">
                <div class="des" id="J_des">
                  <ul class="des_tab">
                    <li class="des_tabbox" id="detail_desc_tab">
                      <a href="javascript:void(0);" class="tab cur" id="spjs">商品介绍</a>
                      <a href="javascript:void(0);" class="tab" id="sppj">评价<em>&nbsp;&nbsp;${data.visitNum}</em></a>
                      <a href="javascript:void(0);" class="tab" id="ggbz">规格及包装</a>
                      <a href="javascript:void(0);" class="tab" id="shfw">售后服务</a>
                    </li>
                  </ul>
                  <div class="descon" id="detail_desc_content">
                    <div id="prodDescTabContent">
                      <div tabIndex="0" class="desitem" style="display:block" id="prodDetailCotentDiv">
                        <dl class="des_info clearfix">
                          <dt>
                            规格参数
                            <a id="medica_record" class="medica_record" href="2379171.html" target="_blank"></a>
                            <a href="javascript:void(0)" onclick="detailProdDesc.onGuigeTabSwitchEvent();"
                              class="s_standard_more">查看更多 »</a>
                          </dt>
                          <dd title="品牌：${data.goodsUnit}">品牌：${data.goodsUnit}</dd>
                          <dd title="商品名称：${data.goodsname}">
                            商品名称：${data.goodsname}</dd>
                          <dd title="商品编号：${data.goodsid}">商品编号：${data.goodsid}</dd>
                          <dd title="商品电话：${data.goodsphone}">商品毛重：${data.goodsphone}</dd>
                          <dd title="商品产地：${data.goodsCatIdPath}">商品产地：${data.goodsCatIdPath}</dd>
                        </dl>
                        <div class="mod_des">
                          <div class="desbox">
                          </div>
                        </div>
                      </div>
                      <div tabIndex="1" class="desitem desqoute" id="detail_desc_prop" style="display:none">
                      </div>
                    </div>
                    <div class="desitem desqoute" id="detail_desc_fwcl">
                      ${data.goodsCatIdPath}<br />
                      <img src="${data.goodsimage}" alt="${data.goodsname}">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </div>
  `

  bindEvent(data)
}

function bindEvent(data) {
  const addCart = document.querySelector('#addCart')

  addCart.addEventListener('click', function () {
    // const id = this.getAttribute('data-id')

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
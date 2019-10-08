// 1. 先请求第一页的数据

// 1-1. 准备一个页面数据的对象
const pageInfo = {
  pagenum: 1,
  pagesize: 13,
  total: 0,
  totalpage: 0
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
    async change (n) {
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
const listGroup = document.querySelector('.list-group')

function bindHtml(list) {
  console.log(list[0])
  let str = ''

  // 遍历 list
  list.forEach(item => {
    str += `
      <li class="list-item">
        <div class="panel panel-primary">
          <div class="panel-body">
            <ol class="breadcrumb">
              <li><a href="#">${item.cat_one_id}</a></li>
              <li><a href="#">${item.cat_two_id}</a></li>
              <li class="active">${item.cat_three_id}</li>
            </ol>
          </div>
          <div class="panel-footer">
            <div class="row">
              <div class="">
                <div class="thumbnail">
                  <img src="${item.goods_big_logo}" alt="...">
                  <div class="caption">
                    <h3>${item.goods_name}</h3>
                    <p class="price">
                      <i class="glyphicon glyphicon-yen"></i>
                      <span>${item.goods_price}</span>
                    </p>
                    <p>
                      <a href="./cart.html" class="btn btn-primary" role="button">查看购物车</a>
                      <a href="./detail.html?id=${item.goods_id}" class="btn btn-danger" role="button">查看商品详情</a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </li>
    `
  })

  // 丢到页面里面
  listGroup.innerHTML = str
}
